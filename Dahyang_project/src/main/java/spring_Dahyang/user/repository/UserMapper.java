package spring_Dahyang.user.repository;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import spring_Dahyang.user.model.User;
import org.apache.ibatis.annotations.*;

@Mapper
public interface UserMapper {
	
	public int insert(User user);
	public int update(User user);
	public int delete(int uid);
	public User selectByUid(int uid);
	public User selectByEmail(String email);
}
