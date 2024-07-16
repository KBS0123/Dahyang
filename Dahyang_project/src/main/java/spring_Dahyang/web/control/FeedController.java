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
	    User user = (User) session.getAttribute("user");
	    model.addAttribute("clid", clid);
	    Feed feed = new Feed();

	    try {
	        feed.setClid(clid);
	        feed.setUid(user.getUid());
	        feed.setWriter(user.getNickname());
	        feed.setContent(request.getParameter("content"));
	        feed.setUimg(user.getImages());
	        feed.setLikes(0);

	        // 첫 번째 이미지 설정
	        if (files.length > 0 && !files[0].isEmpty()) {
	            String firstImgFileName = fileService.saveFile(files[0]);
	            feed.setImg(firstImgFileName);
	        }

	        feedMapper.insert(feed);

	        // 피드 ID 가져오기
	        Feed insertedFeed = feedMapper.selectByContent(feed.getContent());
	        int fid = insertedFeed.getFid();

	        // 첫 번째 이미지를 images 테이블에 저장
	        if (files.length > 0 && !files[0].isEmpty()) {
	            Images firstImage = new Images();
	            firstImage.setFid(fid);
	            firstImage.setImg(feed.getImg());
	            imagesMapper.insert(firstImage);
	        }

	        // 나머지 이미지 저장
	        for (int i = 1; i < files.length; i++) {
	            MultipartFile file = files[i];
	            if (!file.isEmpty()) {
	                String imgFileName = fileService.saveFile(file);
	                Images image = new Images();
	                image.setFid(fid);
	                image.setImg(imgFileName);
	                imagesMapper.insert(image);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        // 에러 페이지로 리다이렉트
	        return "redirect:/views/error";
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
	public String postUpdate(
	        @PathVariable int clid,
	        @RequestParam("img[]") MultipartFile[] files,
	        HttpServletRequest request,
	        HttpSession session,
	        Model model) {
	    User user = (User) session.getAttribute("user");
	    model.addAttribute("clid", clid);

	    if (user != null) {
	        Feed feed = feedMapper.selectById(Integer.parseInt(request.getParameter("fid")));
	        if (feed != null && user.getUid() == feed.getUid()) {
	            try {
	                // 기존 이미지 삭제
	                List<Images> existingImages = imagesMapper.selectAll(feed.getFid());
	                for (Images image : existingImages) {
	                    File oldFile = new File(FileServiceImpl.IMAGE_REPO, image.getImg());
	                    if (oldFile.exists()) {
	                        oldFile.delete();
	                    }
	                }
	                imagesMapper.delete(feed.getFid());

	                // 새 이미지 파일을 저장하고 첫 번째 이미지를 피드에 설정
	                String firstImgFileName = null;
	                for (int i = 0; i < files.length; i++) {
	                    MultipartFile file = files[i];
	                    if (!file.isEmpty()) {
	                        String imgFileName = fileService.saveFile(file);
	                        if (i == 0) {
	                            firstImgFileName = imgFileName;
	                        }
	                        Images image = new Images();
	                        image.setFid(feed.getFid());
	                        image.setImg(imgFileName);
	                        imagesMapper.insert(image);
	                    }
	                }

	                // 피드 정보 업데이트
	                feed.setClid(clid);
	                feed.setContent(request.getParameter("content"));
	                feed.setImg(firstImgFileName != null ? firstImgFileName : "");
	                feedMapper.update(feed);

	                return "redirect:/views/club/" + clid + "/feed/" + feed.getFid();
	            } catch (Exception e) {
	                e.printStackTrace();
	                return "redirect:/views/error";
	            }
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
