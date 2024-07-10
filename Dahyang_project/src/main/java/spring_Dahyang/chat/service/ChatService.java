package spring_Dahyang.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring_Dahyang.chat.model.Chat;
import spring_Dahyang.chat.model.ChatMessage;
import spring_Dahyang.chat.repository.ChatMessageRepository;
import spring_Dahyang.chat.repository.ChatRepository;
import spring_Dahyang.club.model.Club;
import spring_Dahyang.club.repository.ClubMapper;
import spring_Dahyang.user.model.User;
import spring_Dahyang.user.repository.UserMapper;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class ChatService {
    @Autowired
    private ChatMessageRepository chatMessageRepository;

    @Autowired
    private ChatRepository chatRepository;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ClubMapper clubMapper;

    public ChatMessage sendMessage(int userId, int clid, String content) {
        Optional<User> user = userMapper.findById(userId);
        Optional<Club> club = clubMapper.findById(clid);

        if (user.isPresent() && club.isPresent()) {
            Chat chat = chatRepository.findByClub(club.get()).orElseGet(() -> {
                Chat newChat = new Chat();
                newChat.setClub(club.get());
                return chatRepository.save(newChat);
            });

            ChatMessage chatMessage = new ChatMessage();
            chatMessage.setChat(chat);
            chatMessage.setUser(user.get());
            chatMessage.setNickname(user.get().getNickname());
            chatMessage.setContent(content);
            chatMessage.setTimestamp(LocalDateTime.now());

            return chatMessageRepository.save(chatMessage);
        } else {
            // handle error
            return null;
        }
    }

    public List<ChatMessage> getMessages(int clid) {
        Optional<Club> club = clubMapper.findById(clid);
        if (club.isPresent()) {
            Optional<Chat> chat = chatRepository.findByClub(club.get());
            return chat.map(Chat::getMessages).orElse(null);
        } else {
            // handle error
            return null;
        }
    }
}
