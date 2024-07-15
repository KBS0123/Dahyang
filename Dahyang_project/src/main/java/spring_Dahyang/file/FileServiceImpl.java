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
	        message = "���� ���ε尡 ���������� �Ϸ�Ǿ����ϴ�.";
	    } else {
	        message = "���� ���ε忡 �����Ͽ����ϴ�.";
	    }
	    return message;
	}
	
}