package spring_Dahyang.feed.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import javax.persistence.Entity;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Images {
	
	private int imgid;
	private int clid;
	private int fid;
    private String img;
    

}
