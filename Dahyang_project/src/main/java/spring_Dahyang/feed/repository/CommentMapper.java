package spring_Dahyang.feed.repository;

import java.util.List;

import spring_Dahyang.feed.model.Comment;

public interface CommentMapper {
	
	public int insert(Comment comment);
	public int update(Comment comment);
	public int delete(int fcid);
	public List<Comment> selectAll(int fid);
	public Comment selectById(int fcid);
	
}
