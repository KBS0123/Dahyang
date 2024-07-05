package spring_Dahyang.web.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import spring_Dahyang.chat.model.Chat; // Chat 클래스로 변경
import spring_Dahyang.chat.service.ChatService; 

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    private final List<Chat> chatQueue = new CopyOnWriteArrayList<>();

    @GetMapping("/room/{clubId}")
    public String chatRoom(@PathVariable Long clubId, Model model) {
        model.addAttribute("clubId", clubId);
        return "chatRoom";
    }

    @GetMapping("/chats/{clubId}")
    @ResponseBody
    public List<Chat> getChats(@PathVariable Long clubId) {
        Club club = new Club();
        club.setClid(clubId);
        return chatService.getChatsForClub(club);
    }

    @PostMapping("/chats")
    @ResponseBody
    public Chat sendChat(@RequestBody Chat chat) {
        chat = chatService.saveChat(chat);
        chatQueue.add(chat);
        return chat;
    }

    @GetMapping("/poll/{clubId}")
    @ResponseBody
    public List<Chat> pollChats(@PathVariable Long clubId) throws InterruptedException {
        while (chatQueue.isEmpty()) {
            Thread.sleep(1000);
        }

        List<Chat> chatsToSend = new CopyOnWriteArrayList<>(chatQueue);
        chatQueue.clear();
        return chatsToSend;
    }
}
