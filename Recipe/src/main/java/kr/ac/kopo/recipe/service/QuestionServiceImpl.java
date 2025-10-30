package kr.ac.kopo.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.recipe.dao.QuestionDao;
import kr.ac.kopo.recipe.model.Question;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	QuestionDao qDao;
	
	@Override
	public List<Question> getAllQuestions() {
		return qDao.getAllQuestions();
	}
	
	@Override
	public void save(Question question) { 
		qDao.save(question);
	}

	
}
