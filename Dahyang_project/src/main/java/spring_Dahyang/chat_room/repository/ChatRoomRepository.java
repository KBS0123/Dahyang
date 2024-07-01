package spring_Dahyang.chat_room.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import spring_Dahyang.chat_room.dto.ChatRoom;

public interface ChatRoomRepository extends JpaRepository<ChatRoom, Long> {
}
