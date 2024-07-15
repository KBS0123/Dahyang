package spring_Dahyang.file;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface FileService {

	public static final String IMAGE_REPO="C:/Users/hi-pc-999/git/Dahyang/Dahyang_project/src/main/webapp/resources/imgs";
	public String saveFile(MultipartFile file);
	
}