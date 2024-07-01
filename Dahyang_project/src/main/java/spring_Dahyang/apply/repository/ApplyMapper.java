package spring_Dahyang.apply.repository;

import java.util.List;

import spring_Dahyang.apply.dto.Apply;

public interface ApplyMapper {

	public int insert(Apply apply);
	public int delete(int applyId);
	public List<Apply> selectAll(int clid);
	
}
