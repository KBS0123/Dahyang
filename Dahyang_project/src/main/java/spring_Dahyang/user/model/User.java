package spring_Dahyang.user.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.List;
import spring_Dahyang.club.model.Club;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class User {
    @Id
    private int uid;
    private String email;
    private String pwd;
    private String nickname;
    private String birthday;
    private String images;

}
