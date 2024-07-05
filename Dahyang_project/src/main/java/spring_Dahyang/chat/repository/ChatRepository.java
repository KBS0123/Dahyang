package spring_Dahyang.chat.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import spring_Dahyang.chat.model.Chat; // Chat 클래스로 변경
import spring_Dahyang.club.model.Club;

import java.util.List;

public interface ChatRepository extends JpaRepository<Chat, Long> { // 인터페이스 이름도 ChatRepository로 변경
    List<Chat> findByClubOrderByTimestampAsc(Club club);
}
