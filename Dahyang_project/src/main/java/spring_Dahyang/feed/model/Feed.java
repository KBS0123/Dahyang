package spring_Dahyang.feed.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import javax.persistence.Entity;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Feed {
	
	private int fid;
	private int clid;
    private int uid;
    private String writer;
    private String content;
    private String img;

}
