package spring_Dahyang.chat.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import spring_Dahyang.chat.model.ChatMessage;
import spring_Dahyang.user.model.User;

import java.util.List;

public interface ChatRepository extends JpaRepository<ChatMessage, Long> {
    // ChatMessage를 특정 사용자를 기준으로 조회하는 메서드 추가 예시
    List<ChatMessage> findByUserId(Long userId);
}
