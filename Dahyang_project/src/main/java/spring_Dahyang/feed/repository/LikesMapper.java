package spring_Dahyang.feed.repository;

import org.apache.ibatis.annotations.Param;

import spring_Dahyang.feed.model.Likes;

public interface LikesMapper {
	
	public int insert(Likes likes);
	public int delete(int lid);
	public int likeCount(int fid);
	Likes selectByUserAndFeed(@Param("uid") int uid, @Param("fid") int fid);
	
}
