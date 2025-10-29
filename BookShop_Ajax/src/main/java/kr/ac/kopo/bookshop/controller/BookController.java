package kr.ac.kopo.bookshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.bookshop.model.Attach;
import kr.ac.kopo.bookshop.model.Book;
import kr.ac.kopo.bookshop.model.BookPager;
import kr.ac.kopo.bookshop.pager.Pager;
import kr.ac.kopo.bookshop.service.BookService;

@RestController
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	BookService service;
	
	String uploadPath = "d:/upload/";
	
	@PostMapping("/list")
	BookPager list(@RequestBody Pager pager){
		return new BookPager(service.list(pager), pager);
	}
	
	@PostMapping
	Book add(Book item, List<MultipartFile> uploadFile) {
		List<Attach> attachs = new ArrayList<Attach>();
		
		for(MultipartFile file : uploadFile) {	
			if(!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			
			try {
				file.transferTo(new File(uploadPath + uuid + "_" +filename));
				
				Attach attach = new Attach();
				attach.setFilename(filename);
				attach.setUuid(uuid);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
	}
		
		item.setAttachs(attachs);
		
		service.add(item);
		
		return item;
	}
	
	@PutMapping
	Book update(@RequestBody Book item) {
		service.update(item);
		
		return item;
	}
	
	@DeleteMapping("/{code}")
	void delete(@PathVariable Long code) {
		service.delete(code);
	}

}
