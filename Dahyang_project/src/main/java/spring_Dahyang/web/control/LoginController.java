package spring_Dahyang.web.control;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import spring_Dahyang.kakao.dto.Kakao;
import spring_Dahyang.kakao.repository.KakaoApi;
import spring_Dahyang.login.dto.Login;
import spring_Dahyang.login.service.LoginService;
import spring_Dahyang.user.model.User;
import spring_Dahyang.user.repository.UserMapper;

@RequiredArgsConstructor
@Component
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private KakaoApi kakaoApi;
	
	@RequestMapping("/views/login")
	public String getLoginView(HttpServletRequest request, Model model) {
		model.addAttribute("REST_API_KEY", kakaoApi.getKakaoApiKey());
        model.addAttribute("REDIRECT_URI", kakaoApi.getKakaoRedirectUri());
		return "login";
	}
	
	@ModelAttribute("active")
	public String active() {
		return "login";
	}
	
	@PostMapping("/views/login")
	public String postLogin(Login login, Model model, HttpSession session) {
		loginService.authenticate(login);
		
		if (login.getError() != null) {
			model.addAttribute("error", login.getError());
			model.addAttribute("login", login);
			session.setAttribute("islogin", false);
			return "login";
		} else {
			User user = userMapper.selectByEmail(login.getEmail());
			session.setAttribute("user", user);
			session.setAttribute("islogin", true);
			session.setAttribute("isreg", false);
			return "redirect:/views/";
		}
	}
	
	@RequestMapping("/kakaoLogin")
    public String login(@RequestParam("code") String code, HttpSession session,  HttpServletRequest request) throws IOException {
		
        System.out.println(code);
            
        //토큰 발급 받기
    	String access_Token = loginService.getAccessToken(code);
    		
    	//사용자 정보 가지고 오기 
    	Kakao userInfo = loginService.userInfo(access_Token);
    	
    	//세션 형성 + request 내장 객체 가지고 오기
    	session = request.getSession();
    	
    	System.out.println("accessToken: "+access_Token);
    	System.out.println("code:"+ code);
    	System.out.println("Common Controller:"+ userInfo);
    	System.out.println("nickname: "+ userInfo.getKakao_nickname());
    	System.out.println("email: "+ userInfo.getKakao_email());
    	
    	
    	//세션에 담기
    	if (userInfo.getKakao_id() != null) {
    	     session.setAttribute("kakao_nickname", userInfo.getKakao_nickname());
    	     session.setAttribute("access_Token", access_Token);
    	     session.setAttribute("kakao_id", userInfo.getKakao_id());
    	     session.setAttribute("kakao_email", userInfo.getKakao_email());
    	}
            
        return "main";
    }
	
	@GetMapping("/views/logout")
	public String getLogout(HttpSession session) {
		session.invalidate();
		return "login";
		
	}

}