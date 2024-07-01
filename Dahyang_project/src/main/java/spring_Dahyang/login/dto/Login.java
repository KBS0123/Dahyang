package spring_Dahyang.login.dto;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Login {
	private String email;
	private String pwd;
	private String nickname;
	private String birthday;
	private String error; //error메시지 세팅을 위한 변수

}
