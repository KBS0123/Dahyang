package spring_Dahyang.file;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

@Service
public class FileServiceImpl implements FileService {

	@Override
	public String saveFile(MultipartFile file) {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
	    String sysFileName = sdf.format(Calendar.getInstance().getTime()) + file.getOriginalFilename();
	    File saveFile = new File(IMAGE_REPO, sysFileName);
	    try {
	        file.transferTo(saveFile);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return sysFileName;
	}
	
	public String getMessage(int result, HttpServletRequest request) {
	    String message;
	    if (result > 0) {
	        message = "파일 업로드가 성공적으로 완료되었습니다.";
	    } else {
	        message = "파일 업로드에 실패하였습니다.";
	    }
	    return message;
	}
	
}