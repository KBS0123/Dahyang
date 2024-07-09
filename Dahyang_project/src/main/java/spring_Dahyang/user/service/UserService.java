package spring_Dahyang.user.service;

import org.springframework.stereotype.Service;
import spring_Dahyang.user.model.User;

@Service
public class UserService {
    public User getUserById(int userId) {
        // 실제로는 DB에서 사용자 정보를 조회하는 코드
        // 여기서는 간단히 더미 데이터를 반환하는 예시로 작성
        return new User(userId, "test@example.com", "password", "사용자1", "1990-01-01", "profile.jpg");
    }
}
