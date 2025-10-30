package kr.ac.kopo.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.ac.kopo.recipe.model.Question;

public interface QuestionService {

	List<Question> getAllQuestions();

	void save(Question question);
	
	
}
