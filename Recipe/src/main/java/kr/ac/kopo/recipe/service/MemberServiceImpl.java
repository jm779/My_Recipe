package kr.ac.kopo.recipe.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.recipe.dao.MemberDao;
import kr.ac.kopo.recipe.model.Cook;
import kr.ac.kopo.recipe.model.Member;
import kr.ac.kopo.recipe.model.Step;
import kr.ac.kopo.recipe.pager.Pager;

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

	@Override
	public List<Cook> list(Pager pager) {
		int total = memberDao.total(pager);
		
		pager.setTotal(total);
		
		return memberDao.list(pager);
	}

	@Override
	public Cook detail(int recipeid) {
		return memberDao.detail(recipeid);
	}

	@Override
	public void update(Cook item, Step step) {
		memberDao.update(item, step);
	}

	@Override
	public void delete(int recipeid) {
		memberDao.delete(recipeid);
	}

	@Override
	public Step getStepByRecipeid(int recipeid) {
		return memberDao.getStepByRecipeid(recipeid);
	}

	@Override
	public Member getMemberitem(int recipeid) {
		return memberDao.getMemberByRecipeid(recipeid);
	}
	
	@Override
	public Cook item(int recipeid) {
		return memberDao.detail(recipeid);
	}

	@Override
	public Member item(String userid) {
		return memberDao.item(userid);
	}

	@Override
	public boolean checkId(String id) {
		Member item = memberDao.item(id);
		
		if(item == null)
			return true;
		
		
		return false;
	}

	@Override
	public List<Step> listStepsByRecipeid(int recipeid) {
		return null;
	}

}