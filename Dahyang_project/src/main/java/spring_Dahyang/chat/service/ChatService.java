package spring_Dahyang.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring_Dahyang.chat.model.Chat;
import spring_Dahyang.chat.repository.ChatMapper;

import java.util.List;

@Service
public class ChatService {

    @Autowired
    private ChatMapper chatMapper;

    public int insert(Chat chat) {
        return chatMapper.insert(chat);
    }

    public int update(Chat chat) {
        return chatMapper.update(chat);
    }

    public int delete(int cid) {
        return chatMapper.delete(cid);
    }

    public List<Chat> selectAll(int clid) {
        return chatMapper.selectAll(clid);
    }

    public Chat selectById(int cid) {
        return chatMapper.selectById(cid);
    }
}
