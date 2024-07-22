package spring_Dahyang.web.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.java.Log;
import spring_Dahyang.kakao.repository.KakaoPayService;
import spring_Dahyang.user.model.User;
import spring_Dahyang.club.model.Club;
import spring_Dahyang.club.model.Member;
import spring_Dahyang.club.repository.ClubMapper;
import spring_Dahyang.club.repository.MemberMapper;
import spring_Dahyang.file.FileService;

import org.springframework.web.multipart.MultipartFile;

@Controller
@RequiredArgsConstructor
@Log
public class KakaoPayController {
	
	@Autowired
    private FileService fileService;

	@Setter(onMethod_ = @Autowired)
    private KakaoPayService kakaoPayService;

    @Setter(onMethod_ = @Autowired)
    private ClubMapper clubMapper;

    @Setter(onMethod_ = @Autowired)
    private MemberMapper memberMapper;

    @PostMapping("/kakaoPay")
    public String kakaoPay(HttpSession session, 
    						@RequestParam("img") MultipartFile file, 
                           @RequestParam("title") String title,
                           @RequestParam("content") String content, 
                           @RequestParam("notice") String notice) {
        log.info("kakaoPay post.....................");
        
        // 파일을 임시 저장소에 저장하고 파일 경로를 세션에 저장
        String filePath = null;
        if (file != null && !file.isEmpty()) {
            filePath = fileService.saveFile(file);
        }
        
        // 모임 정보 세션에 저장
        session.setAttribute("img", filePath);
        session.setAttribute("title", title);
        session.setAttribute("content", content);
        session.setAttribute("notice", notice);

        return "redirect:" + kakaoPayService.kakaoPayReady(session);
    }

    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
        log.info("kakaoPay Success get................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);

        // 세션에서 모임 정보 가져오기
        String filePath = (String) session.getAttribute("img");
        String title = (String) session.getAttribute("title");
        String content = (String) session.getAttribute("content");
        String notice = (String) session.getAttribute("notice");
        User user = (User) session.getAttribute("user");

        // 모임 생성 로직
        if (user != null) {
            Club club = new Club();
            club.setUid(user.getUid());
            club.setTitle(title);
            club.setContent(content);
            club.setNotice(notice);

            if (filePath != null) {
                club.setImg(filePath);
            }

            try {
                clubMapper.insert(club);
                Club clubs = clubMapper.selectByTitle(title);
                Member member = new Member();
                member.setClid(clubs.getClid());
                member.setUid(clubs.getUid());
                member.setUnickname(user.getNickname());
                member.setUimg(user.getImages());
                memberMapper.insert(member);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        Club clubs = clubMapper.selectByTitle(title);

        // 세션에서 모임 정보 삭제
        session.removeAttribute("img");
        session.removeAttribute("title");
        session.removeAttribute("content");
        session.removeAttribute("notice");

        return "redirect:/views/club/" + clubs.getClid();
    }
}