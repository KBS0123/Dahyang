package spring_Dahyang.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring_Dahyang.login.dto.Login;
import spring_Dahyang.user.model.User;
import spring_Dahyang.user.repository.UserMapper;

@Service
public class LoginService {
	@Autowired
	private UserMapper userMapper;
	
	public void authenticate(Login login) {
		User user = userMapper.selectByEmail(login.getEmail());
		if(user == null) {
			login.setError("이메일이 존재하지 않습니다.");
		}else {
			if(!user.getPwd().equals(login.getPwd())) {
				login.setError("비밀번호가 다릅니다.");
			}else {
				login.setError(null);
			}
		}
	}
}