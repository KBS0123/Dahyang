package spring_Dahyang.chat.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import spring_Dahyang.chat.dto.*;

public interface ChatRepository extends JpaRepository<Chat, Long> {
    List<Chat> findAllByRoomId(Long roomId);
}