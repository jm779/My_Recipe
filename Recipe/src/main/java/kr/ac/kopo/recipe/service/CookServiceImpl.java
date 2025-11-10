package kr.ac.kopo.recipe.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.recipe.dao.CookDao;
import kr.ac.kopo.recipe.dao.StepDao;
import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Step;

@Service
public class CookServiceImpl implements CookService {
	@Autowired
	private CookDao cookDao;
	
	@Autowired
	private StepDao stepDao;
	
	@Override
	@Transactional
	public void addCookWithStep(Cook cook, String userid) {
		System.out.println("Cook: " + cook);
	    for(Step s : cook.getSteps()) {
	        System.out.println("Step: " + s.getContent() + ", " + s.getIngredient());
	    }
		
		cook.setUserid(userid);
		cookDao.addCook(cook);
		
		int order=1;
		
		List<Step> steps = cook.getSteps();
		if(steps != null) {
			for(Step step : steps) {
				step.setRecipeid(cook.getRecipeid());
				step.setStepOrder(order++);
				step.setUserid(userid);
				stepDao.add(step);
			}
		}
		
		for(Step step : steps) {
			System.out.println("Saving Step: " + step.getStepOrder() + ", imagePath: " + step.getImagepath());
			
		}
	}

	@Override
	public List<Cook> list(String userid) {
		return cookDao.list(userid);
	}

	@Override
	public Cook item(int recipeid) {
		return cookDao.item(recipeid);
	}

	@Override
		public void update(Cook item, List<Step> steps) {
			cookDao.update(item);
			
			List<Step> existingSteps = stepDao.listByRecipeId(item.getRecipeid());
			
			stepDao.deleteByRecipeId(item.getRecipeid());
			
			int order = 1;
			if (steps != null) {
		        for (int i = 0; i < steps.size(); i++) {
		            Step newStep = steps.get(i);
		            newStep.setRecipeid(item.getRecipeid());
		            newStep.setStepOrder(order++);

		            // 湲곗〈 �씠誘몄� 寃쎈줈 �쑀吏�
		            if ((newStep.getImagepath() == null || newStep.getImagepath().isEmpty()) 
		                && i < existingSteps.size()) {
		                newStep.setImagepath(existingSteps.get(i).getImagepath());
		            }

		            stepDao.add(newStep);
		        }
		    }
		}

	@Override
	public void delete(int recipeid) {
		stepDao.deleteByRecipeId(recipeid);
		
		cookDao.delete(recipeid);
	}

	@Override
	public Cook detail(int recipeid) {
		Cook cook = cookDao.detail(recipeid);
		
		if(cook != null) {
			List<Step> steps = stepDao.listByRecipeId(recipeid);
			cook.setSteps(steps);
		
		}
		return cook;
	}

	@Override
	public List<Step> listByRecipeId(int recipeid) {
		return stepDao.listByRecipeId(recipeid);
	}


	@Override
	public void recommend(Map<String, Object> param) {
		/*
		 * int recipenum = (int)param.get("recipenum"); String userid =
		 * (String)param.get("userid");
		 */
		param.put("writedate", new Date());
		
		cookDao.recommend(param);
	}

	@Override
	public List<Cook> getAllRecommendedByUser(String userid) {
		List<Cook> list = cookDao.getRecommendedByUser(userid);
	    return list != null ? list : new ArrayList<>();
		//return cookDao.getRecommendedByUser(userid);
	}

	@Override
	public List<Cook> getAllRecommended() {
		List<Cook> list = cookDao.getAllRecommended();
	    return list != null ? list : new ArrayList<>();
	}
}