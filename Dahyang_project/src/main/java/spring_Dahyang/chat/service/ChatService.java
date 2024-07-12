package spring_Dahyang.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring_Dahyang.chat.model.Chat;
import spring_Dahyang.chat.model.ChatMessage;
import spring_Dahyang.chat.repository.ChatMessageMapper;
import spring_Dahyang.user.model.User;
import spring_Dahyang.user.repository.UserMapper;
import spring_Dahyang.user.repository.UserRepository;

import java.time.LocalDateTime;

@Service
public class ChatService {
    @Autowired
    private ChatMessageMapper chatMessageMapper;

    @Autowired
    private UserMapper userMapper;

    @Transactional
    public ChatMessage sendMessage(int uid, int clid, String content) {
        User user = userMapper.findById(uid).orElseThrow(() -> new IllegalArgumentException("User not found"));

        Chat chat = new Chat();
        chat.setChatId((long) clid); // Assuming Chat entity is fetched or created properly

        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setChat(chat);
        chatMessage.setUser(user);
        chatMessage.setNickname(user.getNickname());
        chatMessage.setContent(content);
        chatMessage.setTimestamp(LocalDateTime.now());

        chatMessageMapper.insertChatMessage(chatMessage);
        return chatMessage;
    }
}
