package spring_Dahyang.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring_Dahyang.chat.model.Chat; // Chat 클래스로 변경
import spring_Dahyang.chat.repository.ChatRepository; // ChatRepository로 변경
import spring_Dahyang.club.model.Club;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ChatService { // 클래스 이름도 ChatService로 변경

    @Autowired
    private ChatRepository chatRepository; // ChatRepository로 변경

    public List<Chat> getChatsForClub(Club club) {
        return chatRepository.findByClubOrderByTimestampAsc(club);
    }

    public Chat saveChat(Chat chat) {
        return chatRepository.save(chat);
    }
}
