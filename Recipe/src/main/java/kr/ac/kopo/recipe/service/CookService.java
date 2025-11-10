package kr.ac.kopo.recipe.service;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Step;

public interface CookService{
	
	void addCookWithStep(Cook cook, String userid);

	List<Cook> list(String userid);

	Cook item(int recipeid);

	void update(Cook item, List<Step> steps);

	void delete(int recipeid);

	Cook detail(int recipeid);

	List<Step> listByRecipeId(int recipeid);

	void recommend(Map<String, Object> param);

	List<Cook> getAllRecommendedByUser(String userid);

	List<Cook> getAllRecommended();
	
}