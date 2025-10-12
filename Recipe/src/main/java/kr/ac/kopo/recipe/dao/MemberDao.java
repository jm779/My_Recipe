package kr.ac.kopo.recipe.dao;

import java.util.List;

import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Member;
import kr.ac.kopo.recipe.model.Step;

public interface MemberDao {
	
    void add(Member item);

    Member item(String userid);

    Member getMemberByRecipeid(int recipeid); 

    Cook getCookByRecipeid(int recipeid); 
    List<Cook> list();

    Cook detail(int recipeid);

    void update(Cook item, Step step);

    void delete(int recipeid);

    Step getStepByRecipeid(int recipeid);

	boolean exists(String userid);
}

