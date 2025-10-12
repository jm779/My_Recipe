package kr.ac.kopo.recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Member;
import kr.ac.kopo.recipe.model.Step;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public void add(Member item) {
		sql.insert("member.add", item);
	}

	@Override
	public Member item(String userid) {
		return sql.selectOne("member.item",userid);
	}

	@Override
	public Member getMemberByRecipeid(int recipeid) {
		return sql.selectOne("member.getMemberByRecipeid", recipeid);
	}
	
	@Override
	public Cook getCookByRecipeid(int recipeid) {
		return sql.selectOne("cook.getCookByRecipeid", recipeid);
	}
	
	@Override
	public List<Cook> list() {
		return sql.selectList("cook.list");
	}

	@Override
	public Cook detail(int recipeid) {
		return sql.selectOne("cook.detail", recipeid);
	}

	@Override
	public void update(Cook item, Step step) {
		sql.update("cook.update", item);
	}

	@Override
	public void delete(int recipeid) {
		sql.delete("cook.delete", recipeid);
	}

	@Override
	public Step getStepByRecipeid(int recipeid) {
		return sql.selectOne("cook.getStepByRecipeid", recipeid);
	}

	@Override
	public boolean exists(String userid) {
		Integer count = sql.selectOne("member.exists", userid);
		return count != null & count > 0;
	}

}
