package spring_Dahyang.web.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring_Dahyang.club.model.Club;
import spring_Dahyang.club.repository.ClubMapper;
import spring_Dahyang.feed.model.Feed;
import spring_Dahyang.feed.repository.FeedMapper;

@Controller
@RequestMapping("/views/")
public class HomeController {
	
	@Autowired
	private ClubMapper clubMapper;
	
	@Autowired
	private FeedMapper feedMapper;
	
	@GetMapping
	public String getHomeView(HttpServletRequest request, Model model) {
		List<Club> clubs = clubMapper.selectAll();
		List<Club> LClubs = clubMapper.selectAllByLikes();
		List<Feed> Feeds = feedMapper.selectAllByLikes();
		model.addAttribute("clubs", clubs);
		model.addAttribute("LClubs", LClubs);
		model.addAttribute("Feeds", Feeds);
		
		return "main";
	}
	
}
