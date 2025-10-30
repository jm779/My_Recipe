package kr.ac.kopo.recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.recipe.model.Question;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	@Autowired
	SqlSession sql;
	
	@Override
	public List<Question> getAllQuestions() {
		return sql.selectList("question.qlist");
	}

	@Override
	public void save(Question question) {
		sql.insert("question.save",question);
	}
	
}
