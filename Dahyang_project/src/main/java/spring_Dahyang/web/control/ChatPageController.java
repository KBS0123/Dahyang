package spring_Dahyang.web.control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import javax.servlet.http.HttpSession;

@Controller
public class ChatPageController {

    @GetMapping("/chat")
    public String chatPage(HttpSession session, Model model) {
        // 세션에서 사용자 ID를 가져옵니다.
        Long userId = (Long) session.getAttribute("userId");
        // Model 객체를 사용하여 클럽 ID를 JSP로 전달합니다. 예시로 클럽 ID를 1로 설정합니다.
        Long clubId = 1L; // 실제 애플리케이션에서는 동적으로 설정해야 합니다.
        
        model.addAttribute("userId", userId);
        model.addAttribute("clubId", clubId);
        
        return "chat"; // 이 부분이 InternalResourceViewResolver의 prefix와 suffix를 통해 /WEB-INF/views/chat.jsp로 매핑됩니다.
    }
}
