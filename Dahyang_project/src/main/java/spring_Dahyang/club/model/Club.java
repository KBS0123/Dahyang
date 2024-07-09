package spring_Dahyang.club.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import spring_Dahyang.user.model.User;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Club {
	
	@Id
	private int clid;
    private int uid;
    private String title;
    private String content;
    private String notice;
    private String img;

    @ManyToOne
    private User creator;

}
