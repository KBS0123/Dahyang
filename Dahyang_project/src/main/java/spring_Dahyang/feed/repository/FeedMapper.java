package spring_Dahyang.feed.repository;

import java.util.List;

import spring_Dahyang.feed.model.Feed;

public interface FeedMapper {
	
	public int insert(Feed feed);
	public int update(Feed feed);
	public int delete(int fid);
	public List<Feed> selectAll(int clid);
	public Feed selectById(int fid);
	
}
