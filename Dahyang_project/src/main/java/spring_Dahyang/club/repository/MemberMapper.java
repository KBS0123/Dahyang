package spring_Dahyang.club.repository;

import java.util.List;

import spring_Dahyang.club.model.Member;

public interface MemberMapper {

	public static int insert(int memid, int clid, int uid) {
		return 0;
	}
	
	public int delete(Member member);
	
	public static boolean findMember(int clid, int uid) {
		if (findMember(clid, uid)) {
			return true;
		}
		return false;
	}
	
	public List<Member> selectAll(int uid);
	
}
