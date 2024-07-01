package spring_Dahyang.user.model;
import lombok.Data;

import java.util.Date;

import lombok.AllArgsConstructor; //모든 멤버변수를 입력받는 생성자
import lombok.NoArgsConstructor; //디폴트 생성자 처리

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
	
	/* lombok에서 처리해주기 때문에 작성 불필요
	 public User() {} 디폴트 생성자
	 public User(String email, String password) {
	 	this.email = email;
	 	this.password = password;
	 }
	 public String setEmail(String email){}
	 public void getEmail(){}
	 public String setPassword(String password){}
	 public void getPassword(){}
	 */

}
