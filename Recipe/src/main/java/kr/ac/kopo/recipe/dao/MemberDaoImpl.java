package kr.ac.kopo.recipe.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.ac.kopo.recipe.model.Member;

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

}
