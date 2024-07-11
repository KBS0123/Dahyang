package spring_Dahyang.web.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import spring_Dahyang.chat.model.ChatMessage;
import spring_Dahyang.chat.service.ChatService;

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

    @PostMapping("/send")
    public ChatMessage sendMessage(@PathVariable int clid, @RequestParam int userId, @RequestParam String content) {
        ChatMessage chatMessage = chatService.sendMessage(userId, clid, content);
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
