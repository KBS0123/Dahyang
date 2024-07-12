package spring_Dahyang.web.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import spring_Dahyang.chat.model.ChatMessage;
import spring_Dahyang.chat.service.ChatService;
import spring_Dahyang.user.model.User;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/views/club/{clid}/chat")
public class ChatController {
    @Autowired
    private ChatService chatService;

    private final Map<Integer, SseEmitter> emitters = new HashMap<>();

    @GetMapping()
    public ModelAndView getChatView(@PathVariable int clid, HttpSession session) {
        User user = (User) session.getAttribute("user");
        ModelAndView mav = new ModelAndView("chat");
        mav.addObject("clid", clid);
        if (user != null) {
            mav.addObject("uid", user.getUid());
        } else {
            mav.addObject("uid", null);
        }
        return mav;
    }

    @PostMapping("/send")
    public ChatMessage sendMessage(@PathVariable int clid, HttpSession session, @RequestParam String content) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            throw new IllegalStateException("User not logged in");
        }
        int uid = user.getUid();
        ChatMessage chatMessage = chatService.sendMessage(uid, clid, content);
        emitters.values().forEach(emitter -> {
            try {
                emitter.send(chatMessage);
            } catch (IOException e) {
                emitter.completeWithError(e);
            }
        });
        return chatMessage;
    }

    @GetMapping("/messages")
    public List<ChatMessage> getMessages(@PathVariable int clid) {
        return chatService.getMessages(clid);
    }

    @GetMapping("/stream")
    public SseEmitter streamMessages(@PathVariable int clid) {
        SseEmitter emitter = new SseEmitter();
        emitters.put(clid, emitter);
        emitter.onCompletion(() -> emitters.remove(clid));
        emitter.onTimeout(() -> emitters.remove(clid));
        return emitter;
    }
}
