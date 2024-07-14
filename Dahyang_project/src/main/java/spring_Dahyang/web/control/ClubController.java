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
import spring_Dahyang.club.model.Club;
import spring_Dahyang.club.model.Member;
import spring_Dahyang.club.repository.ClubMapper;
import spring_Dahyang.club.repository.MemberMapper;

@Controller
@RequestMapping("/views/club")
public class ClubController {
	
	@Autowired
    private FileService fileService;
	
	@Autowired
	private ClubMapper clubMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@GetMapping("/list")
	public ModelAndView getClubView(HttpSession session) {
		User user = (User)session.getAttribute("user");
		ModelAndView mav = new ModelAndView("club_list");
		
		if (user == null) {
			return mav;
		} else {
			mav.addObject("clubs", clubMapper.selectByUid(user.getUid()));
		}
		
		return mav;
	}
	
	@GetMapping("/{clid}")
	public String getClubView(@PathVariable int clid, HttpServletRequest request, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		Club club = clubMapper.selectById(clid);
		List<Member> member = memberMapper.findMembers(clid);
		List<Member> members = memberMapper.selectAll(clid);
		model.addAttribute("club", club);
		model.addAttribute("member", member);
		model.addAttribute("members", members);
		
		return "club";
	}
	
	@PostMapping("/{clid}")
	public String postClubMember(@PathVariable int clid, HttpServletRequest request, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		
		try {
	        Member member = new Member();
	        member.setClid(clid);
	        member.setUid(user.getUid());
	        member.setUnickname(user.getNickname());
	        member.setUimg(user.getImages());
	        
	        memberMapper.insert(member);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return "redirect:/views/club/{clid}";
		
	}
	
	@GetMapping("/{clid}/setting")
	public String getSettingView(@PathVariable int clid, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		Club club = clubMapper.selectById(clid);
		model.addAttribute("user", user);
		model.addAttribute("club", club);
		
		return "club_setting";
	}
	
	@GetMapping("/write")
	public String getInsertView(HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		
		model.addAttribute("user", user);
		return "club_write";
	}
	
	@GetMapping("/update/{clid}")
	public String getUpdateView(@PathVariable int clid, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		Club club = clubMapper.selectById(clid);
		
		if (user != null && club != null) {
			if (user.getUid() == club.getUid()) {
				model.addAttribute("club", club);
				return "club_update";
			}
		}
		
		return session.getServletContext().getContextPath() + "/views/test";
	}
	
	@PostMapping("/update")
	public String postUpdate(@RequestParam("img") MultipartFile file, HttpServletRequest request, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		
		if (user != null) {
	        Club club = clubMapper.selectById(Integer.parseInt(request.getParameter("clid")));
	        if (club != null && user.getUid() == club.getUid()) {
	            // 기존 파일 삭제
	            if (club.getImg() != null && !club.getImg().isEmpty()) {
	                File oldFile = new File(FileServiceImpl.IMAGE_REPO, club.getImg());
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
	            	club.setImg(imgFileName);
	            }
	            
	            club.setUid(Integer.parseInt(request.getParameter("uid")));
	            club.setTitle(request.getParameter("title"));
	            club.setContent(request.getParameter("content"));
	            club.setNotice(request.getParameter("notice"));
	            
	            try {
	            	clubMapper.update(club); // MovieMapper의 update 메서드를 호출하여 업데이트
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            
	            return "redirect:/views/club/" + club.getClid();
	        }
		}
		
		return session.getServletContext().getContextPath() + "/views/test";
	}
	
	@GetMapping("/delete/{clid}")
	public String getDelete(@PathVariable int clid, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		
		if (user != null) {
			Club club = clubMapper.selectById(clid);
			
			if (user.getUid() == club.getUid()) {
				clubMapper.deleteFeedComment(clid);
				clubMapper.deleteFeed(clid);
				clubMapper.deleteMembers(clid);
				clubMapper.deleteClub(clid);
				return "redirect:/views/club/list";
			}
		}
		
		return session.getServletContext().getContextPath() + "/views/test";
	}
	
	// 모임 탈퇴 기능
	@GetMapping("/{clid}/remove/{uid}")
	public String getRemoveMember(@PathVariable int clid, @PathVariable int uid, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		
		if(user != null) {
			
			Member member = new Member();
	        member.setClid(clid);
	        member.setUid(uid);
			
			memberMapper.delete(member);
			
			return "redirect:/views/";
		}
				
		
		return session.getServletContext().getContextPath() + "/views/test";
	}

}
