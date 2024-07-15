package spring_Dahyang.web.control;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring_Dahyang.file.FileService;
import spring_Dahyang.file.FileServiceImpl;
import spring_Dahyang.login.service.LoginService;
import spring_Dahyang.register.dto.Register;
import spring_Dahyang.register.service.RegisterService;
import spring_Dahyang.user.model.User;
import spring_Dahyang.user.repository.UserMapper;

@Controller
@RequestMapping("/views/users")
public class UserController { //유저정보를 가져와 실 정보인지 비교
	@Autowired
	private RegisterService registerService;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
    private FileService fileService;
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/register")
	public String RegisterView(HttpServletRequest request, HttpSession session) {	
		session.setAttribute("isreg", true);
		return "register";
	}
	
	@PostMapping("/register")
    public String postUser(User reguser, Register reg, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		session.setAttribute("islogin", false);
		registerService.authenticate(reg);
		
		 // 에러 메시지가 존재하는지 확인
        if (reg.getError() != null) {
            // 모델에 에러 메시지 추가
            model.addAttribute("error", reg.getError());
            session.setAttribute("islogin", false);
            session.removeAttribute("user");
            return "register";
        } else if (reg.getError() ==null) {
        	userMapper.insert(reguser);
        	session.setAttribute("isreg", false);
        	
        }
        return "redirect:/views/login";
	}
	
	
	@GetMapping("/profile")
    public String ProfileView(HttpServletRequest request) {
        return "profile";
    }
    
    @GetMapping("/profile_update")
    public String getProfile_UpdateView(HttpServletRequest request) {
        return "profile_update";
    }
     
    @PostMapping("/profile_update")
    public String updateUser(User user, @RequestParam("img") MultipartFile file, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {      	
    	User ori_user = userMapper.selectByEmail(user.getEmail());
    	
    	String error = null; // 에러 메시지를 저장할 변수

    	
    	    // 새로운 정보가 null이거나 빈 문자열인 경우 에러 메시지 설정
    	    if (user.getNickname() == null || user.getNickname().isEmpty()) {
    	        error = "닉네임을 입력해주세요.";
    	    } else if (user.getBirthday() == null || user.getBirthday().isEmpty()) {
    	        error = "생년월일을 입력해주세요.";
    	    }

    	    if (user.getImages() != null && !user.getImages().isEmpty()) {
                File oldFile = new File(FileServiceImpl.IMAGE_REPO, user.getImages());
                if (oldFile.exists()) {
                    oldFile.delete(); // 기존 파일 삭제
                }
            }

            // 새 파일 업로드
            String imgFileName = null; // 새 파일명
            try {
                if (file != null && !file.isEmpty()) {
                    imgFileName = fileService.saveFile(file); // FileService의 구현체를 사용하여 새 파일 저장
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            // 파일명 업데이트
            if (imgFileName != null) {
            	user.setImages(imgFileName);
            }    
    	    
    	// 에러가 없다면 수정 진행, 있으면 에러 메시지 세션에 저장
    	if (error == null) {
    	    int result = userMapper.update(user);
    	    session.setAttribute("user", userMapper.selectByUid(user.getUid()));
    	    session.removeAttribute("error"); // 에러 세션 제거
    	} else {
    	    session.setAttribute("error", error); // 에러 세션 설정
    	    return "profile_update";
    	}

    	// 프로필 페이지로 리다이렉트
    	return "redirect:/views/users/profile";

    }
}


