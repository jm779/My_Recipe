package kr.ac.kopo.recipe.service;

import java.util.List;

import kr.ac.kopo.recipe.model.Cook;

public interface CookService{
	
	void add(Cook cook);

	List<Cook> list();

	Cook item(int recipeid);

	void update(Cook item);

	void delete(int recipeid);

	Cook detail(int recipeid);


}
