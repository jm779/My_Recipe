package kr.ac.kopo.recipe.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
		cook.setUserid(userid);
		cookDao.addCook(cook);
		
		int order=1;
		
		List<Step> steps = cook.getSteps();
		if(steps != null) {
			for(Step step : steps) {
				step.setRecipeid(cook.getRecipeid());
				step.setStepOrder(order++);
				stepDao.add(step);
			}
		}
	}

//	@Override
//	public void addCook(Cook cook) {
//		cookDao.addCook(cook);
//	}
//
//	@Override
//	public void addStep(Step step) {
//		cookDao.addStep(step);
//	}
	
	@Override
	public List<Cook> list() {
		return cookDao.list();
	}

	@Override
	public Cook item(int recipeid) {
		return cookDao.item(recipeid);
	}

	@Override
		public void update(Cook item, List<Step> steps) {
			cookDao.update(item);
			
			stepDao.deleteByRecipeId(item.getRecipeid());
			
			int order = 1;
			if (steps != null) {
				for (Step step : steps) {
					step.setRecipeid(item.getRecipeid());
					step.setStepOrder(order++);
					stepDao.add(step);
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
	public List<Step> getStepsByRecipeid(int recipeid) {
		return stepDao.listByRecipeid(recipeid);
	}

}