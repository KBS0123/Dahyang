package spring_Dahyang.chat.service;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import spring_Dahyang.chat.model.ChatMessage;

@Service
public class ChatService {
    private final List<ChatMessage> messages = new ArrayList<>();

    public void addMessage(ChatMessage message) {
        messages.add(message);
    }

    public List<ChatMessage> getMessages() {
        return new ArrayList<>(messages);
    }
}
