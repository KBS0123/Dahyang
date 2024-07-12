package spring_Dahyang.web.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring_Dahyang.file.FileService;
import spring_Dahyang.file.FileServiceImpl;
import spring_Dahyang.user.model.User;
import spring_Dahyang.feed.model.Comment;
import spring_Dahyang.feed.model.Feed;
import spring_Dahyang.feed.repository.CommentMapper;
import spring_Dahyang.feed.repository.FeedMapper;

@Controller
@RequestMapping("/views/club/{clid}/feed/{fid}")
public class CommentController {
	
	@Autowired
	private CommentMapper commentMapper;
	
	@PostMapping("/comment/write")
	public String postInsert(@PathVariable int clid, @PathVariable int fid, HttpServletRequest request, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		// Board 객체 생성 및 필요한 데이터 설정
		model.addAttribute("clid", clid);
		model.addAttribute("fid", fid);
		Comment comment = new Comment();
		comment.setFid(fid);
        comment.setClid(clid);
        comment.setUid(user.getUid()); // 세션에서 가져온 유저의 ID 사용
        comment.setNickname(user.getNickname()); // 세션에서 가져온 유저의 닉네임 사용
        comment.setContent(request.getParameter("content"));
        comment.setUimg(user.getImages());
	    
	    try {
	    	commentMapper.insert(comment);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return "redirect:/views/club/" + clid + "/feed/" + fid;
	}
	
	@GetMapping("/comment/delete/{fcid}")
	public String getDelete(@PathVariable int fcid, @PathVariable int clid, @PathVariable int fid, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("clid", clid);
		model.addAttribute("fid", fid);
		
		if (user != null) {
			Comment comment = commentMapper.selectById(fcid);
			
			if (user.getUid() == comment.getUid()) {
				commentMapper.delete(fcid);
				return "redirect:/views/";
			}
		}
		
		return session.getServletContext().getContextPath() + "/views/";
	}

}
