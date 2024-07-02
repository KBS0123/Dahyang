package spring_Dahyang.club.repository;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import spring_Dahyang.club.model.Club;

public interface ClubMapper {
	
	public int insert(Club club);
	public int update(Club club);
	public int delete(int clid);
	
	@Select("select count(*) from dclub")
	public int count();
	
	@Select("select * from dclub")
	public List<Club> selectAll();
	
	public List<Club> findClub(int clid);
	
	public Club selectById(int clid);
	
	public Club selectUserId(int uid);
	
	public int deleteByUid(int uid);
	
}
