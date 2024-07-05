package spring_Dahyang.chat.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

import spring_Dahyang.club.model.Club;
import spring_Dahyang.user.model.User;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "chats") // 테이블 이름을 "chats"로 변경
public class Chat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // 메시지 ID

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "club_id")
    private Club club;

    private String content;
    private LocalDateTime timestamp;
}
