package kr.ac.kopo.recipe.service;

import java.util.List;

import kr.ac.kopo.recipe.model.Member;

public interface MemberService{
	
	// List<Member> list();
	
	void add(Member item);

	Member login(Member member);

	// void update(Member item);

	// void delete(String id);

	// Member item(String id);


}
