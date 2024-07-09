package spring_Dahyang.chat.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import spring_Dahyang.club.model.Club;
import spring_Dahyang.user.model.User;

@Data
@NoArgsConstructor
public class ChatMessage {
	private String uid;
	private String clid;
    private String nickname; // 사용자의 닉네임 필드 추가
    private String content;
    private String timestamp;
}
