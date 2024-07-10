package spring_Dahyang.club.repository;

import java.util.List;

import spring_Dahyang.club.model.Member;

public interface MemberMapper {

	public int insert(Member member);
	public int delete(Member member);
	
	public static int deleteMember(int clid) {
		return 0;
	}
	
	public static boolean findMember(int clid, int uid) {
		if (findMember(clid, uid)) {
			return true;
		}
		return false;
	}
	
	public static boolean deleteClub(int clid) {
		if (deleteMember(clid) > 0) {
			if (ClubMapper.remove(clid) > 0) {
				return true;
			}
		}
		return false;
	}
	
	public List<Member> selectAll(int uid);
	
}
