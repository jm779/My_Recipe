package kr.ac.kopo.recipe.dao;

import java.util.List;

import kr.ac.kopo.recipe.model.Member;

public interface MemberDao {

	List<Member> list = null;

	void add(Member item);

	Member item(String userid);

	


}
