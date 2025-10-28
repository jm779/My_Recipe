package kr.ac.kopo.recipe.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Member;
import kr.ac.kopo.recipe.model.Step;
import kr.ac.kopo.recipe.service.CookService;
import kr.ac.kopo.recipe.service.MemberService;

@Controller
@RequestMapping("/cook")
public class CookController {
	final String uploadPath = "d:/upload";

	@Autowired
	private CookService cookService;

	@Autowired
	private MemberService memberService;
	

	@GetMapping("/add")
	public String add() {
		return "cook/add";
	}

	@PostMapping("/add")
	public String addSubmit(@ModelAttribute Cook cook, HttpSession session,
	                        @RequestParam(value = "file", required = false) MultipartFile[] file) {
	    String userid = (String) session.getAttribute("userid");
	    cook.setUserid(userid);

	    List<Step> steps = cook.getSteps();
	    if (steps == null) {
	        steps = new ArrayList<>();
	        cook.setSteps(steps);
	    }
	    
	    for (int i = 0; i < steps.size(); i++) {
            Step step = steps.get(i);
            step.setImagepath("");

            if (file != null && i < file.length && !file[i].isEmpty()) {
                String fileName = UUID.randomUUID().toString() + "_" + file[i].getOriginalFilename();
                File img = new File(uploadPath, fileName);

                try {
                    file[i].transferTo(img);
                    step.setImagepath("/upload/" + fileName);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        cookService.addCookWithStep(cook, userid);
        return "redirect:/cook/list";
    }

	@GetMapping("/list")
	String list(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		List<Cook> list = cookService.list();

		model.addAttribute("list", list);
		model.addAttribute("userid", userid);

		if (userid != null) {
			Member member = memberService.item(userid);
			model.addAttribute("item", member);
		}
		
		return "cook/list";
	}

	@GetMapping("/update/{recipeid}")
	public String update(@PathVariable int recipeid, Model model) {
		Cook item = cookService.item(recipeid);
		List<Step> steps = cookService.listByRecipeId(recipeid);

		model.addAttribute("item", item);
		model.addAttribute("steps", steps);

		return "/cook/update";
	}

	@PostMapping("/update/{recipeid}")
	public String update(@PathVariable int recipeid, @ModelAttribute Cook item) {
		item.setRecipeid(recipeid);
		cookService.update(item, item.getSteps());
		return "redirect:/cook/list";
	}

	@GetMapping("/delete/{recipeid}")
	public String delete(@PathVariable int recipeid) {
		cookService.delete(recipeid);
		return "redirect:/cook/list";
	}

	@GetMapping("/detail/{recipeid}")
	public String detail(@PathVariable("recipeid") int recipeid, Model model) {
		Cook cookItem = cookService.detail(recipeid);
		List<Step> steps = cookService.listByRecipeId(recipeid);

		if (cookItem == null) {
			return "redirect:/cook/list";
		}

		model.addAttribute("item", cookItem);
		model.addAttribute("steps", steps);

		return "/cook/detail";
	}

	@PostMapping("/detail/{recipeid}")
	public String detail(@PathVariable int recipeid, Cook item) {
		cookService.detail(recipeid);

		return "redirect:/cook/list";
	}

	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}
	
	
	@PostMapping("/cook/recommend/{recipeid}")
	public String recommend(@PathVariable int recipeid, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("member");
		if (loginMember == null) {
			return "redirect:/login";
		}
		
		cookService.recommend(recipeid);
		return "redirect:/";
		
		
	}

}
