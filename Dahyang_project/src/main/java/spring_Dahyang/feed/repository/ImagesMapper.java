package spring_Dahyang.feed.repository;

import java.util.List;

import spring_Dahyang.feed.model.Images;

public interface ImagesMapper {
	
	public int insert(Images images);
	public int update(Images images);
	public int delete(int fid);
	public List<Images> selectAll(int fid);
	
}
