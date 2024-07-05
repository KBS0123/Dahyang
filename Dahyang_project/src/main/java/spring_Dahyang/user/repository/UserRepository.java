package spring_Dahyang.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import spring_Dahyang.user.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
}