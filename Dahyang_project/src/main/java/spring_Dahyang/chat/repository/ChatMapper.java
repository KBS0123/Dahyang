package spring_Dahyang.chat.repository;

import org.apache.ibatis.annotations.*;

import spring_Dahyang.chat.model.Chat;

import java.util.Optional;

@Mapper
public interface ChatMapper {

    @Insert("INSERT INTO dchat (club_id) VALUES (#{clid})")
    @Options(useGeneratedKeys = true, keyProperty = "chatId", keyColumn = "chat_id")
    int insert(Chat chat);

    @Delete("DELETE FROM dchat WHERE chat_id = #{chatId}")
    int delete(int chatId);

    @Select("SELECT * FROM dchat WHERE chat_id = #{chatId}")
    @Results(id = "chatResultMap", value = {
        @Result(property = "chatId", column = "chat_id"),
        @Result(property = "clid", column = "club_id")
    })
    Optional<Chat> findById(int chatId);

    @Select("SELECT * FROM dchat WHERE club_id = #{clid}")
    @ResultMap("chatResultMap")
    Optional<Chat> findByClid(int clid);
}
