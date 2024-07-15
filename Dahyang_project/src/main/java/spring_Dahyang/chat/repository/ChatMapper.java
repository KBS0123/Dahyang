package spring_Dahyang.chat.repository;

import java.util.List;
import spring_Dahyang.chat.model.Chat;

public interface ChatMapper {

    public int insert(Chat chat);
    public int update(Chat chat);
    public int delete(int cid);
    public List<Chat> selectAll(int clid);
    public Chat selectById(int cid);
}
