package spring_Dahyang.chat.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class ChatMessage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MESSAGE_ID")
    private int messageId;

    @ManyToOne
    @JoinColumn(name = "CHAT_ID", nullable = false)
    private Chat chat;

    @Column(name = "USER_ID", nullable = false)
    private int uid;

    @Column(name = "NICKNAME", nullable = false)
    private String nickname;

    @Column(name = "CONTENT", nullable = false)
    private String content;

    @Column(name = "TIMESTAMP", nullable = false)
    private LocalDateTime timestamp = LocalDateTime.now();
}
