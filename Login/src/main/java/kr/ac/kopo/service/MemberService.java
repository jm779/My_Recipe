package kr.ac.kopo.service;


import java.util.List;

import kr.ac.kopo.model.Member;

public interface MemberService {
	
	 List<Member> list();

	 void add(Member item);

	 void update(Member item);

	 void delete(String id);

	Member item(String id);

	boolean login(Member member);
}
