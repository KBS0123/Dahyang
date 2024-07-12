package spring_Dahyang.chat.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import spring_Dahyang.chat.model.Chat;
import java.util.Optional;

public interface ChatRepository extends JpaRepository<Chat, Integer> {
    Optional<Chat> findByClid(int clid);
}
