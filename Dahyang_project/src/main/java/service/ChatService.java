package service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import domain.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class ChatService {

    private final Path rootLocation = Paths.get("upload-dir");

    public String uploadImage(MultipartFile file) throws IOException {
        String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        Files.copy(file.getInputStream(), this.rootLocation.resolve(filename));
        return "/images/" + filename;
    }

    public ChatRoom findRoomById(Long roomId) {
        // ID로 채팅 방을 찾는 메서드를 구현합니다.
        // 예시로 null 반환
        return null;
    }
}
