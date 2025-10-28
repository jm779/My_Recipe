package kr.ac.kopo.recipe.service;

import java.util.List;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Step;
import kr.ac.kopo.recipe.pager.Pager;

public interface CookService{
	
	void addCookWithStep(Cook cook, String userid);

	List<Cook> list();

	Cook item(int recipeid);

	void update(Cook item, List<Step> steps);

	void delete(int recipeid);

	Cook detail(int recipeid);

	List<Step> listByRecipeId(int recipeid);

	List<Cook> getAllRecommended();

	void recommend(int recipeid);
	
}
