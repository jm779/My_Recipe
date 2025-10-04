package kr.ac.kopo.recipe.dao;

import java.util.List;

import kr.ac.kopo.recipe.model.Cook;

public interface CookDao {
	
	void add(Cook cook);

	List<Cook> list();

	Cook item(int recipeid);

	void update(Cook item);

	void delete(int recipeid);

	Cook detail(int recipeid);

	
}
