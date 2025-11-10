package kr.ac.kopo.recipe.dao;

import java.util.List;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Member;
import kr.ac.kopo.recipe.model.Step;
import kr.ac.kopo.recipe.pager.Pager;

public interface MemberDao {
	
    void add(Member item);
    
    Member login(Member member);

    Member item(String userid);

    Member getMemberByRecipeid(int recipeid); 

    Cook getCookByRecipeid(int recipeid); 

    Cook detail(int recipeid);

    void update(Cook item, Step step);

    void delete(int recipeid);

    Step getStepByRecipeid(int recipeid);

	int total(Pager pager);

	List<Cook> list(Pager pager);
	
	
}