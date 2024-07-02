package spring_Dahyang.file;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface FileService {

	public static final String IMAGE_REPO="C:/springworks/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Dahyang_project/views/imgs";
	public String saveFile(MultipartFile file);
	
}