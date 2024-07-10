package spring_Dahyang.chat.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import spring_Dahyang.chat.model.ChatMessage;

public interface ChatMessageRepository extends JpaRepository<ChatMessage, Integer> {
}
