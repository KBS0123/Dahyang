package spring_Dahyang.web.control;

import java.io.File;
import java.util.List;

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
@RequestMapping("/views/club/{clid}/feed")
public class FeedController {
	
	@Autowired
    private FileService fileService;
	
	@Autowired
	private FeedMapper feedMapper;
	
	@Autowired
	private CommentMapper commentMapper;
	
	@GetMapping()
	public ModelAndView getFeedView(@PathVariable int clid) {
		ModelAndView mav = new ModelAndView("feed_list");
		mav.addObject("feeds", feedMapper.selectAll(clid));
		mav.addObject("clid", clid);
		return mav;
	}
	
	@GetMapping("/{fid}")
	public String getFeedView(@PathVariable int clid, @PathVariable int fid, HttpServletRequest request, HttpSession session, Model model) {
		Feed feed = feedMapper.selectById(fid);
		List<Comment> comment = commentMapper.selectAll(fid);
		model.addAttribute("feed", feed);
		model.addAttribute("clid", clid);
		model.addAttribute("comments", comment);
		
		return "feed";
	}
	
	@GetMapping("/write")
	public String getInsertView(@PathVariable int clid, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		
		model.addAttribute("user", user);
		return "feed_write";
	}
	
	@PostMapping("/write")
	public String postInsert(@PathVariable int clid, @RequestParam("img") MultipartFile file, HttpServletRequest request, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		// Board 객체 생성 및 필요한 데이터 설정
		model.addAttribute("clid", clid);
		Feed feed = new Feed();
		feed.setClid(Integer.parseInt(request.getParameter("clid")));
		feed.setUid(Integer.parseInt(request.getParameter("uid")));
		feed.setWriter(request.getParameter("writer"));
		feed.setContent(request.getParameter("content"));
		feed.setUimg(request.getParameter("uimg"));
		feed.setLikes(Integer.parseInt(request.getParameter("likes")));
		
		// 파일 저장 및 파일명 설정
	    String imgFileName = null;
	    if (file != null && !file.isEmpty()) {
	        imgFileName = fileService.saveFile(file); // FileService의 구현체를 사용하여 파일 저장
	        feed.setImg(imgFileName); // 파일이 있는 경우에만 파일명 설정
	    }
	    
	    try {
	    	feedMapper.insert(feed);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return "redirect:/views/club/" + clid + "/feed";
	}
	
	@GetMapping("/update/{fid}")
	public String getUpdateView(@PathVariable int clid, @PathVariable int fid, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		Feed feed = feedMapper.selectById(fid);
		
		if (user != null && feed != null) {
			if (user.getUid() == feed.getUid()) {
				model.addAttribute("feed", feed);
				return "feed_update";
			}
		}
		
		return session.getServletContext().getContextPath() + "/views/test";
	}
	
	@PostMapping("/update")
	public String postUpdate(@PathVariable int clid, @RequestParam("img") MultipartFile file, HttpServletRequest request, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("clid", clid);
		
		if (user != null) {
	        Feed feed = feedMapper.selectById(Integer.parseInt(request.getParameter("fid")));
	        if (feed != null && user.getUid() == feed.getUid()) {
	            // 기존 파일 삭제
	            if (feed.getImg() != null && !feed.getImg().isEmpty()) {
	                File oldFile = new File(FileServiceImpl.IMAGE_REPO, feed.getImg());
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
	            	feed.setImg(imgFileName);
	            }
	            
	            feed.setClid(Integer.parseInt(request.getParameter("clid")));
	            feed.setUid(Integer.parseInt(request.getParameter("uid")));
	            feed.setWriter(request.getParameter("writer"));
	            feed.setContent(request.getParameter("content"));
	            
	            try {
	            	feedMapper.update(feed); // MovieMapper의 update 메서드를 호출하여 업데이트
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            
	            return "redirect:/views/club/" + clid + "/feed/" + feed.getFid();
	        }
		}
		
		return session.getServletContext().getContextPath() + "/views/test";
	}
	
	@GetMapping("/delete/{fid}")
	public String getDelete(@PathVariable int clid, @PathVariable int fid, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("clid", clid);
		
		if (user != null) {
			Feed feed = feedMapper.selectById(fid);
			
			if (user.getUid() == feed.getUid()) {
				feedMapper.deleteComment(fid);
				feedMapper.deleteFeed(fid);
				return "redirect:/views/club/" + clid + "/feed";
			}
		}
		
		return session.getServletContext().getContextPath() + "/views/";
	}

}
