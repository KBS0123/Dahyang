package spring_Dahyang.feed.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import javax.persistence.Entity;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Likes {
	
	private int lid;
	private int fid;
	private int clid;
    private int uid;

}
