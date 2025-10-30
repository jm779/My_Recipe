package kr.ac.kopo.recipe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.recipe.model.Question;
import kr.ac.kopo.recipe.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController { 
	@Autowired
	QuestionService qService;
	
	@GetMapping("/questionadd")
	public String question() {
		return "question/questionadd";
	}

	@GetMapping("/qlist")
	public String questionList(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		
		List<Question> list = qService.getAllQuestions();
		model.addAttribute("list",list);
		
		if(userid == null) {
			// 비회원
			return "question/qlist";
		} else {
			// 로그인 사용자
			model.addAttribute("userid",userid);
			return "question/memberqlist";
		}
	}
	
		@GetMapping("/add")
	    public String showAddForm(HttpSession session) {
	        String userid = (String) session.getAttribute("userid");
	
	        if (userid == null) {
	            return "redirect:/login"; // 로그인 페이지로 리디렉션
	        }
	
	        return "question/questionadd"; // 등록 폼 JSP
	    }
	
	    @PostMapping("/add")
	    public String submitQuestion(@ModelAttribute Question question, HttpSession session) {
	        String userid = (String) session.getAttribute("userid");
	
	        if (userid == null) {
	            return "redirect:/login";
	        }
	
	        question.setUserid(userid);
	        qService.save(question);
	        return "redirect:/question/qlist";
	    }
}
