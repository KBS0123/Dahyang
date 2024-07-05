package spring_Dahyang.club.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import spring_Dahyang.club.model.Club;

public interface ClubRepository extends JpaRepository<Club, Integer> {
}