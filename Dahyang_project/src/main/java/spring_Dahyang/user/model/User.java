package spring_Dahyang.user.model;

import lombok.Data;
import lombok.AllArgsConstructor; //모든 멤버변수를 입력받는 생성자
import lombok.NoArgsConstructor; //디폴트 생성자 처리

import java.util.List;

import javax.persistence.OneToMany;

import spring_Dahyang.club.model.Club;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	
	private int uid;
	private String email;
	private String pwd;
	private String nickname;
	private String birthday;
	private String images;
	
	@OneToMany(mappedBy = "creator")
    private List<Club> clubs;
	
}
