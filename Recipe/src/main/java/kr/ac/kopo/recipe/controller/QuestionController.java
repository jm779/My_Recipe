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
			// 鍮꾪쉶�썝
			return "question/qlist";
		} else {
			// 濡쒓렇�씤 �궗�슜�옄
			model.addAttribute("userid",userid);
			return "question/memberqlist";
		}
	}
	
		@GetMapping("/add")
	    public String showAddForm(HttpSession session) {
	        String userid = (String) session.getAttribute("userid");
	
	        if (userid == null) {
	            return "redirect:/login"; // 濡쒓렇�씤 �럹�씠吏�濡� 由щ뵒�젆�뀡
	        }
	
	        return "question/questionadd"; // �벑濡� �뤌 JSP
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
	    
	    @GetMapping("/memberqlist")
	    public String memberqlist() {
	    	return "question/memberqlist";
	    }
}
