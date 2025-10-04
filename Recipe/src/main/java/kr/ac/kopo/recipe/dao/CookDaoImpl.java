package kr.ac.kopo.recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Step;

@Repository("cookDaoImpl")
public class CookDaoImpl implements CookDao {
	@Autowired
	SqlSession sql;

	@Override
	public void addCook(Cook cook) {
		sql.insert("cook.addCook", cook);
	}
	
	@Override
	public void addStep(Step step) {
		sql.insert("cook.addStep", step);
	}

	@Override
	public List<Cook> list() {
		return sql.selectList("cook.list");
	}

	@Override
	public Cook item(int recipeid) {
		return sql.selectOne("cook.item", recipeid);
	}

	@Override
	public void update(Cook item) {
		sql.update("cook.update", item);
	}

	@Override
	public void delete(int recipeid) {
		sql.delete("cook.delete", recipeid);		
	}

	@Override
	public Cook detail(int recipeid) {
		return sql.selectOne("cook.detail", recipeid);
	}

	@Override
	public List<Step> getStepsByRecipeid(int recipeid) {
		return sql.selectList("cook.getStepsByRecipeid", recipeid);
	}

}