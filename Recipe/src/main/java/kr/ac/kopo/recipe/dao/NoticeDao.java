package kr.ac.kopo.recipe.dao;

import java.util.List;

import kr.ac.kopo.recipe.model.Notice;

public interface NoticeDao {

	List<Notice> list();

	void insert(Notice notice);

	Notice get(int id);

	void update(Notice notice);

	void delete(int id);

}