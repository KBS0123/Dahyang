package spring_Dahyang.chat.repository;

import org.apache.ibatis.annotations.*;
import spring_Dahyang.chat.model.ChatMessage;

@Mapper
public interface ChatMessageMapper {

    @Insert("INSERT INTO dchat_message (chat_id, user_id, nickname, content, timestamp) VALUES (#{chat.chatId}, #{user.uid}, #{nickname}, #{content}, #{timestamp})")
    @Options(useGeneratedKeys = true, keyProperty = "messageId", keyColumn = "message_id")
    int insertChatMessage(ChatMessage chatMessage);
}
