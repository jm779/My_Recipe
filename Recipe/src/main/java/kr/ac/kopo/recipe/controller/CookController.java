package kr.ac.kopo.recipe.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.service.CookService;

@Controller
@RequestMapping("/cook")
public class CookController {
	@Autowired
	private CookService cookService;
	
	@GetMapping("/add")
	public String add() {
		return "cook/add";
	}
	
	@PostMapping("/add")
	public String addSubmit(Cook cook) {
		cookService.add(cook);
		return "redirect:/cook/list";
	}
	
	@GetMapping("/list")
	String list(HttpSession session, Model model) {
		List<Cook> list = cookService.list();
		model.addAttribute("list", list);
		
		return "cook/list";
	}
	
	@GetMapping("/update/{recipeid}")
	public String update(@PathVariable int recipeid, Model model) {
		Cook item = cookService.item(recipeid);
		model.addAttribute("item",item);
		
		return "/cook/update";
	}
	
	@PostMapping("/update/{recipeid}")
	public String update(@PathVariable int recipeid, Cook item) {
		item.setRecipeid(recipeid);
		cookService.update(item);
		
		return "redirect:/cook/list";
	}
	
	@GetMapping("/delete/{recipeid}")
	public String delete(@PathVariable int recipeid) {
		cookService.delete(recipeid);
		return "redirect:/cook/list";
	}
	
	@GetMapping("/detail/{recipeid}")
	public String detail(@PathVariable int recipeid, Model model) {
		Cook item = cookService.detail(recipeid);
		model.addAttribute("item",item);
		
		return "/cook/detail";
	}
		
	@PostMapping("/detail/{recipeid}")
	public String detail(@PathVariable int recipeid, Cook item) {
		item.setRecipeid(recipeid);
		cookService.detail(recipeid);
		
		return "redirect:/cook/list";
	}
}
