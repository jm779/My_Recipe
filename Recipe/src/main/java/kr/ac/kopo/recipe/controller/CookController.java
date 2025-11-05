package kr.ac.kopo.recipe.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
	public String addSubmit(@ModelAttribute Cook cook, 
							 HttpSession session,
							@RequestParam(value = "mainfile", required = false) MultipartFile mainfile, 
	                        @RequestParam(value = "file", required = false) MultipartFile[] file) {
	    String userid = (String) session.getAttribute("userid");
	    cook.setUserid(userid);
	   
		//대표사진 이미지
		if (mainfile != null && !mainfile.isEmpty()) {
            String mainFileName = UUID.randomUUID().toString() + "_" + mainfile.getOriginalFilename();
            File mainImg = new File(uploadPath, mainFileName);

            try {
            	mainfile.transferTo(mainImg);
                cook.setMainimagepath("/upload/" + mainFileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
	    
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
        return "redirect:/member/mypage";
    }

	  @GetMapping("/list") String list(HttpSession session, Model model) { 
	  String userid = (String) session.getAttribute("userid"); 
		  List<Cook> list = cookService.list();
	  
		  model.addAttribute("list", list); model.addAttribute("userid", userid);
	  
	  if (userid != null) { 
		  Member member = memberService.item(userid);
		  model.addAttribute("item", member); }
	  
	  return "cook/list"; }
	 

	@GetMapping("/update/{recipeid}")
	public String update(@PathVariable int recipeid, Model model) {
		Cook item = cookService.item(recipeid);
		List<Step> steps = cookService.listByRecipeId(recipeid);

		model.addAttribute("item", item);
		model.addAttribute("steps", steps);

		return "/cook/update";
	}

	@PostMapping("/update/{recipeid}")
	public String update(@PathVariable int recipeid, 
						 @ModelAttribute Cook item, 
						 @RequestParam(value = "mainfile", required = false) MultipartFile mainfile,
						 @RequestParam(value = "file", required = false) MultipartFile[] file) {
						 
		item.setRecipeid(recipeid);
		
		//대표사진 이미지
		if (mainfile != null && !mainfile.isEmpty()) {
            String mainFileName = UUID.randomUUID().toString() + "_" + mainfile.getOriginalFilename();
            File mainImg = new File(uploadPath, mainFileName);

            try {
            	mainfile.transferTo(mainImg);
                item.setMainimagepath("/upload/" + mainFileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

		//요리순서 이미지
		List<Step> steps = item.getSteps();
	    if (steps == null) {
	        steps = new ArrayList<>();
	        item.setSteps(steps);
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
	    
		cookService.update(item, item.getSteps());
		return "redirect:/member/mypage";
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
		
		cookItem.setSteps(steps);

		model.addAttribute("item", cookItem);
		/* model.addAttribute("steps", steps); */

		return "/cook/detail";
	}

	/*
	 * @PostMapping("/detail/{recipeid}") public String detail(@PathVariable int
	 * recipeid,
	 * 
	 * @ModelAttribute Cook item,
	 * 
	 * @RequestParam(value = "file", required = false) MultipartFile[] file) {
	 * 
	 * item.setRecipeid(recipeid);
	 * 
	 * List<Step> steps = item.getSteps(); if (steps == null) { steps = new
	 * ArrayList<>(); item.setSteps(steps); }
	 * 
	 * for (int i = 0; i < steps.size(); i++) { Step step = steps.get(i);
	 * step.setImagepath("");
	 * 
	 * if (file != null && i < file.length && !file[i].isEmpty()) { String fileName
	 * = UUID.randomUUID().toString() + "_" + file[i].getOriginalFilename(); File
	 * img = new File(uploadPath, fileName);
	 * 
	 * try { file[i].transferTo(img); step.setImagepath("/upload/" + fileName); }
	 * catch (Exception e) { e.printStackTrace(); } } else {
	 * step.setImagepath(step.getImagepath()); } }
	 * 
	 * cookService.detail(recipeid); return "redirect:/cook/list"; }
	 */

	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}
	
	
	@PostMapping("/recommend")
	public String recommend(@RequestParam("userid")String userid, HttpSession session) {
		Member member = (Member) session.getAttribute("member");	
		if(member == null) {
			return "redirect://member/login";
		}
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userid", userid);
		param.put("writerdate", new Date());
		
		cookService.recommend(param);
		
		return "redirect:/";
		
	}

}
