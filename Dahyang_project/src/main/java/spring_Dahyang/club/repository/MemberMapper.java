package spring_Dahyang.club.repository;

import java.util.List;

import spring_Dahyang.club.model.Member;

public interface MemberMapper {

	public int insert(Member member);
	public int delete(Member member);
	public List<Member> selectAll(int uid);
	
}
