package spring_Dahyang.chat.service;

import spring_Dahyang.chat.dto.Chat;
import spring_Dahyang.chat.repository.ChatRepository;
import spring_Dahyang.chat_room.dto.ChatRoom;
import spring_Dahyang.chat_room.repository.ChatRoomRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ChatService {
    private final ChatRoomRepository roomRepository;
    private final ChatRepository chatRepository;
    private final Path rootLocation = Paths.get("upload-dir");

    public List<ChatRoom> findAllRoom() {
        return roomRepository.findAll();
    }

    public ChatRoom findRoomById(Long id) {
        return roomRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid room ID: " + id));
    }

    public ChatRoom createRoom(String name) {
        return roomRepository.save(ChatRoom.createRoom(name));
    }

    public Chat createChat(Long roomId, String sender, String senderEmail, String message) {
        ChatRoom room = roomRepository.findById(roomId).orElseThrow(() -> new IllegalArgumentException("Invalid room ID: " + roomId));
        return chatRepository.save(Chat.createChat(room, sender, senderEmail, message));
    }

    public Chat createChat(Long roomId, String sender, String senderEmail, String message, MultipartFile image) throws IOException {
        ChatRoom room = roomRepository.findById(roomId).orElseThrow(() -> new IllegalArgumentException("Invalid room ID: " + roomId));
        String imageUrl = null;
        if (image != null && !image.isEmpty()) {
            imageUrl = uploadImage(image);
        }
        return chatRepository.save(Chat.createChat(room, sender, senderEmail, message, imageUrl));
    }

    private String uploadImage(MultipartFile file) throws IOException {
        String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        Files.copy(file.getInputStream(), this.rootLocation.resolve(filename));
        return "/images/" + filename;
    }

    // 채팅방 채팅내용 불러오기
    public List<Chat> findAllChatByRoomId(Long roomId) {
        return chatRepository.findAllByRoomId(roomId);
    }
}