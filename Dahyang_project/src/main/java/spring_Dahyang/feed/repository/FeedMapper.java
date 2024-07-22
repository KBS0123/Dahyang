package spring_Dahyang.feed.repository;

import java.util.List;

import spring_Dahyang.feed.model.Feed;

public interface FeedMapper {
	
	public int insert(Feed feed);
	public int update(Feed feed);
	public int deleteLikes(int fid);
	public int deleteImages(int fid);
	public int deleteComment(int fid);
	public int deleteFeed(int fid);
	public Feed selectByContent(String content);
	public List<Feed> selectAll(int clid);
	public List<Feed> selectAllRandom();
	public List<Feed> selectAllByLikes();
	public Feed selectById(int fid);
	
}
