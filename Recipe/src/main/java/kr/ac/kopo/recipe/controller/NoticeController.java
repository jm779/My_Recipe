package kr.ac.kopo.recipe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.recipe.model.Notice;
import kr.ac.kopo.recipe.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<Notice> noticeList = noticeService.getAll();
		model.addAttribute("", noticeList);
		return "notice/list";
	}
	
	 // (�����ڸ� ����)
    @GetMapping("/add")
    public String addForm() {
        return "notice/add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Notice notice) {
        noticeService.save(notice);
        return "redirect:/notice/list";
    }

    @GetMapping("/detail/{noticeid}")
    public String detail(@PathVariable int noticeid, Model model) {
        Notice notice = noticeService.getById(noticeid);
        model.addAttribute("notice", notice);
        return "notice/detail";
    }

    @GetMapping("/update/{noticeid}")
    public String editForm(@PathVariable int noticeid, Model model) {
        Notice notice = noticeService.getById(noticeid);
        model.addAttribute("notice", notice);
        return "notice/update";
    }

    @PostMapping("/update")
    public String edit(@ModelAttribute Notice notice) {
        noticeService.update(notice);
        return "redirect:/notice/list";
    }

    @GetMapping("/delete/{noticeid}")
    public String delete(@PathVariable int noticeid) {
        noticeService.delete(noticeid);
        return "redirect:/notice/list";
    }

}
