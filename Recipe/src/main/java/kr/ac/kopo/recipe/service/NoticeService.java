package kr.ac.kopo.recipe.service;

import java.util.List;

import kr.ac.kopo.recipe.model.Notice;

public interface NoticeService {	
	
	List<Notice> getAll();

	void save(Notice notice);

	Notice getById(int id);

	void update(Notice notice);

	void delete(int id);
	
	
}