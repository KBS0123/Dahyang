package spring_Dahyang.web.control;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import spring_Dahyang.chat.model.ChatMessage;
import spring_Dahyang.chat.service.ChatService;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArrayList;

@Controller
public class ChatController {
    private final ChatService chatService;
    private final CopyOnWriteArrayList<SseEmitter> emitters = new CopyOnWriteArrayList<>();

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
    }

    @PostMapping("/chat/send")
    @ResponseBody
    public void sendMessage(@RequestBody ChatMessage message) {
        chatService.addMessage(message);
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
