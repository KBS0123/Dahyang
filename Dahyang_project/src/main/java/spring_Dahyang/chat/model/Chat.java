package spring_Dahyang.chat.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import spring_Dahyang.club.model.Club;
import spring_Dahyang.user.model.User;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@Entity
public class Chat {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "DCHAT_SEQ")
    @SequenceGenerator(name = "DCHAT_SEQ", sequenceName = "DCHAT_SEQ", allocationSize = 1)
    private Long chatId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CLUB_ID", nullable = false)
    private Club club;

    @OneToMany(mappedBy = "chat", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ChatMessage> messages = new ArrayList<>();

    public Chat(Club club) {
        this.club = club;
    }
}
