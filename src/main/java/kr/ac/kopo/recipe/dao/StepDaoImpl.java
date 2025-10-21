package kr.ac.kopo.recipe.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.recipe.model.Step;

@Repository
public class StepDaoImpl implements StepDao {
	@Autowired
	SqlSession sql;

	@Override
	public void add(Step step) {
		sql.insert("step.add", step);
	}
	
	@Override
	public void deleteByRecipeId(int recipeid) {
		sql.delete("step.deleteByRecipeId", recipeid);
	}
	
	@Override
	public void update(Step step) {
		sql.update("step.update", step);
		
	}

	@Override
	public List<Step> listByRecipeId(int recipeid) {
		return sql.selectList("step.listByRecipeId", recipeid);
				
	}

	

	
}
