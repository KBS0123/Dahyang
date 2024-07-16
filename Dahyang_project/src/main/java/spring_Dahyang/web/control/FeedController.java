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
import spring_Dahyang.club.model.Member;
import spring_Dahyang.club.repository.MemberMapper;
import spring_Dahyang.feed.model.Comment;
import spring_Dahyang.feed.model.Feed;
import spring_Dahyang.feed.model.Images;
import spring_Dahyang.feed.repository.CommentMapper;
import spring_Dahyang.feed.repository.FeedMapper;
import spring_Dahyang.feed.repository.ImagesMapper;

@Controller
@RequestMapping("/views/club/{clid}/feed")
public class FeedController {
	
	@Autowired
    private FileService fileService;
	
	@Autowired
	private FeedMapper feedMapper;
	
	@Autowired
	private ImagesMapper imagesMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CommentMapper commentMapper;
	
	@GetMapping()
	public ModelAndView getFeedView(@PathVariable int clid) {
		ModelAndView mav = new ModelAndView("feed_list");
		mav.addObject("feeds", feedMapper.selectAll(clid));
		List<Member> member = memberMapper.findMembers(clid);
		mav.addObject("member", member);
		mav.addObject("clid", clid);
		return mav;
	}
	
	@GetMapping("/{fid}")
	public String getFeedView(@PathVariable int clid, @PathVariable int fid, HttpServletRequest request, HttpSession session, Model model) {
		Feed feed = feedMapper.selectById(fid);
		List<Comment> comment = commentMapper.selectAll(fid);
		List<Images> images = imagesMapper.selectAll(fid);
		model.addAttribute("feed", feed);
		model.addAttribute("clid", clid);
		model.addAttribute("comments", comment);
		model.addAttribute("images", images);
		
		return "feed";
	}
	
	@GetMapping("/write")
	public String getInsertView(@PathVariable int clid, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		
		model.addAttribute("user", user);
		return "feed_write";
	}
	
	@PostMapping("/write")
	public String postInsert(@PathVariable int clid, @RequestParam("img[]") MultipartFile[] files, HttpServletRequest request, HttpSession session, Model model) {
	    User user = (User)session.getAttribute("user");
	    // Feed 객체 생성 및 필요한 데이터 설정
	    model.addAttribute("clid", clid);
	    Feed feed = new Feed();
	    feed.setClid(Integer.parseInt(request.getParameter("clid")));
	    feed.setUid(Integer.parseInt(request.getParameter("uid")));
	    feed.setWriter(request.getParameter("writer"));
	    feed.setContent(request.getParameter("content"));
	    feed.setUimg(request.getParameter("uimg"));
	    feed.setLikes(Integer.parseInt(request.getParameter("likes")));
	    
	    try {
	        // 첫 번째 이미지를 Feed 객체에 설정하고 dpheed_images 테이블에도 저장
	        if (files.length > 0 && files[0] != null && !files[0].isEmpty()) {
	            String firstImgFileName = fileService.saveFile(files[0]);
	            feed.setImg(firstImgFileName);
	        }

	        feedMapper.insert(feed);
	        
	        Feed fid = feedMapper.selectByContent(request.getParameter("content"));
	        
	        // 첫 번째 이미지 dpheed_images 테이블에도 저장
	        if (files.length > 0 && files[0] != null && !files[0].isEmpty()) {
	            Images firstImage = new Images();
	            firstImage.setFid(fid.getFid());
	            firstImage.setImg(feed.getImg());
	            imagesMapper.insert(firstImage);
	        }

	        // 나머지 이미지 저장 및 파일명 설정
	        for (int i = 1; i < files.length; i++) {
	            MultipartFile file = files[i];
	            if (file != null && !file.isEmpty()) {
	                String imgFileName = fileService.saveFile(file);
	                Images image = new Images();
	                image.setFid(fid.getFid());
	                image.setImg(imgFileName);
	                imagesMapper.insert(image);
	            }
	        }
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
	public String postUpdate(@PathVariable int clid, @RequestParam("img[]") MultipartFile[] files, HttpServletRequest request, HttpSession session, Model model) {
	    User user = (User) session.getAttribute("user");
	    model.addAttribute("clid", clid);

	    if (user != null) {
	        Feed feed = feedMapper.selectById(Integer.parseInt(request.getParameter("fid")));
	        if (feed != null && user.getUid() == feed.getUid()) {
	            // 기존 파일 삭제 및 테이블 업데이트
	            try {
	                List<Images> existingImages = imagesMapper.selectAll(feed.getFid());
	                for (Images image : existingImages) {
	                    File oldFile = new File(FileServiceImpl.IMAGE_REPO, image.getImg());
	                    if (oldFile.exists()) {
	                        oldFile.delete(); // 기존 파일 삭제
	                    }
	                }
	                imagesMapper.delete(feed.getFid()); // 기존 이미지 레코드 삭제
	            } catch (Exception e) {
	                e.printStackTrace();
	            }

	            // 새 파일 업로드 및 파일명 설정
	            try {
	                for (MultipartFile file : files) {
	                    if (file != null && !file.isEmpty()) {
	                        String imgFileName = fileService.saveFile(file); // FileService의 구현체를 사용하여 새 파일 저장
	                        Images image = new Images();
	                        image.setFid(feed.getFid());
	                        image.setImg(imgFileName);
	                        imagesMapper.insert(image); // 새 이미지 정보 데이터베이스에 저장
	                    }
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	            }

	            // 피드 정보 업데이트
	            feed.setClid(Integer.parseInt(request.getParameter("clid")));
	            feed.setUid(Integer.parseInt(request.getParameter("uid")));
	            feed.setWriter(request.getParameter("writer"));
	            feed.setContent(request.getParameter("content"));

	            // dpheed_images 테이블에서 첫 번째 이미지 가져오기
	            try {
	                List<Images> newImages = imagesMapper.selectAll(feed.getFid());
	                if (!newImages.isEmpty()) {
	                    feed.setImg(newImages.get(0).getImg()); // 첫 번째 이미지를 dpheed 테이블의 img 열에 설정
	                } else {
	                    feed.setImg(""); // 이미지가 없는 경우 기본값으로 설정
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	            }

	            try {
	                feedMapper.update(feed); // FeedMapper의 update 메서드를 호출하여 피드 업데이트
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
				feedMapper.deleteImages(fid);
				feedMapper.deleteComment(fid);
				feedMapper.deleteFeed(fid);
				return "redirect:/views/club/" + clid + "/feed";
			}
		}
		
		return session.getServletContext().getContextPath() + "/views/";
	}

}
