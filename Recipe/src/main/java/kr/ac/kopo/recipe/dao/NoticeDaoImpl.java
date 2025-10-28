package kr.ac.kopo.recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.recipe.model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<Notice> list() {
		return sql.selectList("notice.list");
		
	}

}