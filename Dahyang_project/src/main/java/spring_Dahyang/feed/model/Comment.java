package spring_Dahyang.feed.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import javax.persistence.Entity;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Comment {
	
	private int fcid;
	private int fid;
	private int clid;
    private int uid;
    private String nickname;
    private String content;
    private String uimg;

}
