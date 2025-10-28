package kr.ac.kopo.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.recipe.dao.NoticeDao;
import kr.ac.kopo.recipe.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public List<Notice> getAll(){
		return noticeDao.list();
	}
	
	
}
