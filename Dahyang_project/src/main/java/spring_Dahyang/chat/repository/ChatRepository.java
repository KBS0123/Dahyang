package spring_Dahyang.chat.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import spring_Dahyang.chat.dto.Chat;

import java.util.List;
import spring_Dahyang.chat.dto.*;

public interface ChatRepository extends JpaRepository<Chat, Long> {
    List<Chat> findAllByRoomId(Long roomId);
}