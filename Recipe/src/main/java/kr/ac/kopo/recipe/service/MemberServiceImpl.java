package kr.ac.kopo.recipe.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.recipe.dao.MemberDao;
import kr.ac.kopo.recipe.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;	

	@Override
	public void add(Member item) {
		memberDao.add(item);
	}

	@Override
	public Member login(Member member) {
		Member loginMember = memberDao.item(member.getUserid());
		
		if(loginMember != null && loginMember.getUserpassword().trim().equals(member.getUserpassword().trim())) {
			return loginMember;
		}
		return null;
	}
	
	
	
}