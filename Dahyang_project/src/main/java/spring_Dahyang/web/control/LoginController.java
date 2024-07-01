package spring_Dahyang.web.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring_Dahyang.login.dto.Login;
import spring_Dahyang.login.service.LoginService;
import spring_Dahyang.user.model.User;
import spring_Dahyang.user.repository.UserMapper;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/views/login")
	public String getLoginView(HttpServletRequest request) {
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
	
	@GetMapping("/views/logout")
	public String getLogout(HttpSession session) {
		session.invalidate();
		return "login";
	}

}


