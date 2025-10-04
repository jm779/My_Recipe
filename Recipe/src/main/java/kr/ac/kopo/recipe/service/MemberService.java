package kr.ac.kopo.recipe.service;

import java.util.List;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Member;
import kr.ac.kopo.recipe.model.Step;

public interface MemberService{
	
	List<Cook> list();
	
	void add(Member item);

	Member login(Member member);

	Cook detail(int recipeid);

	Member getMemberitem(int recipeid);
	
	Step getStepByRecipeid(int recipeid);

	void update(Cook item, Step step);

	void delete(int recipeid);

	Cook item(int recipeid);

	Member item(String userid);

}