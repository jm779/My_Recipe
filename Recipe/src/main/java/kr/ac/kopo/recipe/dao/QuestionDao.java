package kr.ac.kopo.recipe.dao;

import java.util.List;

import kr.ac.kopo.recipe.model.Question;

public interface QuestionDao {

	List<Question> getAllQuestions();

	void save(Question question);

}
