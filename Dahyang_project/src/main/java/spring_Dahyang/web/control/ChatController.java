package spring_Dahyang.web.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.fasterxml.jackson.databind.ObjectMapper;

import spring_Dahyang.chat.model.Chat;
import spring_Dahyang.chat.repository.ChatMapper;
import spring_Dahyang.club.model.Member;
import spring_Dahyang.club.repository.MemberMapper;
import spring_Dahyang.user.model.User;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@Controller
@RequestMapping("/views/club/{clid}/chat")
public class ChatController {

    @Autowired
    private ChatMapper chatMapper;
    
    @Autowired
	private MemberMapper memberMapper;

    private final CopyOnWriteArrayList<SseEmitter> emitters = new CopyOnWriteArrayList<>();

    @GetMapping
    public ModelAndView getChatView(@PathVariable int clid) {
        ModelAndView mav = new ModelAndView("chat");
        List<Member> member = memberMapper.findMembers(clid);
        mav.addObject("chatList", chatMapper.selectAll(clid));
        mav.addObject("clid", clid);
        mav.addObject("member", member);
        return mav;
    }

    @PostMapping("/send")
    public String sendMessage(@PathVariable int clid, HttpServletRequest request, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("clid", clid);

        Chat chat = new Chat();
        chat.setClid(clid);
        chat.setUid(user.getUid());
        chat.setNickname(user.getNickname());
        chat.setContent(request.getParameter("content"));
        chat.setUimg(user.getImages());
        chat.setTimestamp(new Timestamp(System.currentTimeMillis())); // ���� �ð��� ����

        try {
            chatMapper.insert(chat);
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonString = objectMapper.writeValueAsString(chat);
            for (SseEmitter emitter : emitters) {
                try {
                    emitter.send(jsonString, MediaType.APPLICATION_JSON);
                } catch (IOException e) {
                    emitters.remove(emitter);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/views/club/" + clid + "/chat";
    }

    @GetMapping("/delete/{cid}")
    public String deleteMessage(@PathVariable int cid, @PathVariable int clid, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("clid", clid);

        if (user != null) {
            Chat chat = chatMapper.selectById(cid);

            if (user.getUid() == chat.getUid()) {
                chatMapper.delete(cid);
                return "redirect:/views/club/" + clid + "/chat";
            }
        }

        return session.getServletContext().getContextPath() + "/views/";
    }

    @GetMapping("/stream")
    public SseEmitter streamChat() {
        SseEmitter emitter = new SseEmitter();
        emitters.add(emitter);
        emitter.onCompletion(() -> emitters.remove(emitter));
        emitter.onTimeout(() -> emitters.remove(emitter));
        return emitter;
    }
}
