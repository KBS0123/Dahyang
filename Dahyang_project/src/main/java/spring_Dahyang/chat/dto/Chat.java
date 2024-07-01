package spring_Dahyang.chat.dto;

import lombok.*;
import spring_Dahyang.chat_room.dto.ChatRoom;

import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
public class Chat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "chat_id")
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "room_id")
    private ChatRoom room;

    private String sender;

    private String senderEmail;

    @Column(columnDefinition = "TEXT")
    private String message;

    @Column(columnDefinition = "TEXT")
    private String imageUrl;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime sendDate;

    @Builder
    public Chat(ChatRoom room, String sender, String senderEmail, String message, String imageUrl) {
        this.room = room;
        this.sender = sender;
        this.senderEmail = senderEmail;
        this.message = message;
        this.imageUrl = imageUrl;
        this.sendDate = LocalDateTime.now();
    }

    /**
     * 채팅 생성
     * @param room 채팅 방
     * @param sender 보낸이
     * @param senderEmail 보낸이 이메일
     * @param message 내용
     * @param imageUrl 이미지 URL
     * @return Chat Entity
     */
    public static Chat createChat(ChatRoom room, String sender, String senderEmail, String message, String imageUrl) {
        return Chat.builder()
                .room(room)
                .sender(sender)
                .senderEmail(senderEmail)
                .message(message)
                .imageUrl(imageUrl)
                .build();
    }

    /**
     * 채팅 생성 (이미지 없이)
     * @param room 채팅 방
     * @param sender 보낸이
     * @param senderEmail 보낸이 이메일
     * @param message 내용
     * @return Chat Entity
     */
    public static Chat createChat(ChatRoom room, String sender, String senderEmail, String message) {
        return createChat(room, sender, senderEmail, message, null);
    }
}
