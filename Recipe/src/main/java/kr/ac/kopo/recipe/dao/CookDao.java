package kr.ac.kopo.recipe.dao;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Step;

public interface CookDao {
	
	void addCook(Cook cook);
	
	void addStep(Step step);

	List<Cook> list(String userid);

	Cook item(int recipeid);

	void update(Cook item);

	void delete(int recipeid);

	Cook detail(int recipeid);

	List<Step> getStepsByRecipeid(int recipeid);

	void recommend(Map<String, Object> param);

	List<Cook> getRecommendedByUser(String userid);

	List<Cook> getAllRecommended();


}
