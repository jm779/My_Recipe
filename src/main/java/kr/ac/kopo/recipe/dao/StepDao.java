package kr.ac.kopo.recipe.dao;

import java.util.List;

import kr.ac.kopo.recipe.model.Step;

public interface StepDao {
	
	void add(Step step);
	
	void deleteByRecipeId(int recipeid);

	void update(Step step);

	List<Step> listByRecipeId(int recipeid);
	
}
