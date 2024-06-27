package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import domain.*;
import service.*;
import java.io.IOException;

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
        String imageUrl = null;
        if (image != null && !image.isEmpty()) {
            imageUrl = chatService.uploadImage(image);
        }
        ChatRoom room = chatService.findRoomById(roomId);
        return Chat.createChat(room, sender, senderEmail, message, imageUrl);
    }
}
