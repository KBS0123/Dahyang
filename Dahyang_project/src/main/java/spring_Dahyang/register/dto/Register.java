package spring_Dahyang.register.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data				// getter, setter 생성자 처리
@NoArgsConstructor	// 디폴트 생성자 처리
@AllArgsConstructor	// 모든 멤버변수를 입력 받는 생성자 처리
public class Register {
	
	private int uid;			
	private String pwd;			
	private String repwd;		
	private String nickname;	
	private String email;		
	private String birthday;
	private String error;

}