package spring_Dahyang.club.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import spring_Dahyang.club.model.Club;
import spring_Dahyang.feed.model.Feed;

public interface ClubMapper {
	
	public int insert(Club club);
	public int update(Club club);
	public int deleteChat(int clid);
	public int deleteLikes(int clid);
	public int deleteImages(int clid);
	public int deleteMembers(int clid);
	public int deleteClub(int clid);
	public int deleteFeedComment(int clid);
	public int deleteFeed(int clid);
	
	public static int remove(int clid) {
		return 0;
	}
	
	@Select("select count(*) from dclub")
	public int count();
	
	public List<Club> selectAll();
	
	public List<Club> selectAllRandom();
	
	public List<Club> selectByUid(int uid);
	
	public List<Club> findClub(int clid);
	
	public Club selectById(int clid);
	
	public Club selectByTitle(String title);
	
	public List<Club> selectAllByLikes();
	
	public Club findUserId(int uid);
	
	public int deleteByUid(int uid);
	
	public Optional<Club> findById(int clid);
	
	public List<Club> searchTitle(String title);
	
}
