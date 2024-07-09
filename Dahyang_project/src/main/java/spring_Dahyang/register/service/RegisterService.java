package spring_Dahyang.register.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring_Dahyang.register.dto.Register;
import spring_Dahyang.user.model.User;
import spring_Dahyang.user.repository.UserMapper;

@Service
public class RegisterService {
	
	@Autowired
	private UserMapper userMapper;
	
	public void authenticate(Register reg) {
		// 이메일이 이미 존재하는지 확인
	    User user = userMapper.selectByEmail(reg.getEmail());
	    if (user != null) {
	        reg.setError("이메일이 이미 존재합니다.");
	        return;
	    }

	    // 비밀번호와 비밀번호 확인이 일치하는지 확인
	    if (!reg.getPwd().equals(reg.getRepwd())) {
	        reg.setError("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	        return;
	    }
		
	    // 이메일이 비어있는지 확인하고, 비어있으면 에러 설정
	    if (reg.getEmail().isEmpty()) {
	        reg.setError("이메일을 입력하세요.");
	        return;
	    }

	    // 비밀번호가 비어있는지 확인하고, 비어있으면 에러 설정
	    if (reg.getPwd().isEmpty()) {
	        reg.setError("비밀번호를 입력하세요.");
	        return;
	    }

	    // 비밀번호 확인이 비어있는지 확인하고, 비어있으면 에러 설정
	    if (reg.getRepwd().isEmpty()) {
	        reg.setError("비밀번호 확인을 입력하세요.");
	        return;
	    }

	    // 닉네임이 비어있는지 확인하고, 비어있으면 에러 설정
	    if (reg.getNickname().isEmpty()) {
	        reg.setError("닉네임을 입력하세요.");
	        return;
	    }

	    // 생일이 비어있는지 확인하고, 비어있으면 에러 설정
	    if (reg.getBirthday().isEmpty()) {
	        reg.setError("생년월일을 입력하세요.");
	        return;
	    }

	    // 모든 조건을 만족하면 에러를 null로 설정
	    reg.setError(null);
	}
	
}
