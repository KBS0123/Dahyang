package spring_Dahyang.web.control;

import spring_Dahyang.chat.dto.Chat;
import spring_Dahyang.chat_room.dto.ChatRoom;
import spring_Dahyang.chat.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/chats")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @PostMapping("/create")
    public Chat createChat(@RequestParam("room_id") Long roomId,
                           @RequestParam("sender") String sender,
                           @RequestParam("senderEmail") String senderEmail,
                           @RequestParam("message") String message,
                           @RequestParam(value = "image", required = false) MultipartFile image) throws IOException {
        if (image != null && !image.isEmpty()) {
            return chatService.createChat(roomId, sender, senderEmail, message, image);
        } else {
            return chatService.createChat(roomId, sender, senderEmail, message);
        }
    }

    @GetMapping("/rooms")
    public List<ChatRoom> findAllRooms() {
        return chatService.findAllRoom();
    }

    @GetMapping("/rooms/{roomId}")
    public ChatRoom findRoomById(@PathVariable Long roomId) {
        return chatService.findRoomById(roomId);
    }

    @GetMapping("/rooms/{roomId}/chats")
    public List<Chat> findAllChatByRoomId(@PathVariable Long roomId) {
        return chatService.findAllChatByRoomId(roomId);
    }

    @PostMapping("/rooms")
    public ChatRoom createRoom(@RequestBody ChatRoom room) {
        return chatService.createRoom(room.getName());
    }
}
