package spring_Dahyang.club.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring_Dahyang.club.model.Club;
import spring_Dahyang.club.repository.ClubRepository;
import spring_Dahyang.chat.model.Chat;
import spring_Dahyang.chat.repository.ChatRepository;

@Service
public class ClubService {
    @Autowired
    private ClubRepository clubRepository;

    @Autowired
    private ChatRepository chatRepository;

    public Club getClubById(int clubId) {
        // 실제로는 DB에서 모임방 정보를 조회하는 코드
        // 여기서는 간단히 더미 데이터를 반환하는 예시로 작성
        return new Club(clubId, 1, "모임방 제목", "모임방 내용", "공지사항", "default.jpg");
    }

    public Club createClub(Club club) {
        Club savedClub = clubRepository.save(club);
        
        // 모임방이 생성될 때 해당 모임방의 채팅도 함께 생성
        Chat chat = new Chat(savedClub);
        chatRepository.save(chat);
        
        savedClub.setChat(chat); // 채팅을 모임방에 연결
        
        return savedClub;
    }
}
