package spring_Dahyang.web.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import spring_Dahyang.chat.model.ChatMessage;
import spring_Dahyang.chat.service.ChatService;
import spring_Dahyang.club.model.Club;
import spring_Dahyang.club.service.ClubService;
import spring_Dahyang.user.model.User;
import spring_Dahyang.user.service.UserService;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArrayList;

@Controller
public class ChatController {
    private final ChatService chatService;
    private final CopyOnWriteArrayList<SseEmitter> emitters = new CopyOnWriteArrayList<>();

    @Autowired
    private UserService userService;

    @Autowired
    private ClubService clubService;

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
    }

    @PostMapping("/chat/send")
    @ResponseBody
    public void sendMessage(@RequestParam("senderId") int senderId,
                            @RequestParam("clubId") int clubId,
                            @RequestParam("content") String content) {
        // 사용자 ID를 통해 사용자 정보를 가져오기
        User sender = userService.getUserById(senderId);
        
        // 모임방 ID를 통해 모임방 정보 가져오기
        Club club = clubService.getClubById(clubId);

        ChatMessage message = new ChatMessage();
        message.setUid(String.valueOf(senderId)); // 사용자 ID 설정
        message.setClid(String.valueOf(clubId)); // 모임방 ID 설정
        message.setNickname(sender.getNickname()); // 발신자 닉네임 설정
        message.setContent(content); // 채팅 내용 설정

        // 채팅 서비스에 메시지 추가
        chatService.addMessage(message);

        // SSE로 채팅 메시지 전송
        emitters.forEach(emitter -> {
            try {
                emitter.send(message, MediaType.APPLICATION_JSON);
            } catch (IOException e) {
                emitters.remove(emitter);
            }
        });
    }

    @GetMapping("/chat/stream")
    public SseEmitter streamMessages() {
        SseEmitter emitter = new SseEmitter();
        emitters.add(emitter);
        emitter.onCompletion(() -> emitters.remove(emitter));
        emitter.onTimeout(() -> emitters.remove(emitter));
        return emitter;
    }

    @GetMapping("/chat")
    public String chatPage() {
        return "chat"; // 이 부분이 InternalResourceViewResolver의 prefix와 suffix를 통해 /WEB-INF/views/chat.jsp로 매핑됩니다.
    }
}
