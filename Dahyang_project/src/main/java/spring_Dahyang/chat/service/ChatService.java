package spring_Dahyang.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring_Dahyang.chat.model.ChatMessage;
import spring_Dahyang.chat.repository.ChatRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class ChatService {
    private final List<ChatMessage> messages = new ArrayList<>();

    @Autowired
    private ChatRepository chatRepository;

    public void addMessage(ChatMessage message) {
        messages.add(message);
    }

    public List<ChatMessage> getMessages() {
        return new ArrayList<>(messages);
    }

    public List<ChatMessage> getMessagesByClubId(Long clubId) {
        // Club ID에 해당하는 채팅 메시지 조회
        // 실제로는 DB에서 조회하는 코드로 변경 필요
        return new ArrayList<>(); // 임시로 빈 리스트 반환
    }
}
