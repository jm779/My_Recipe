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

	@Override
	public void save(Notice notice) {
		noticeDao.insert(notice);
	}

	@Override
	public Notice getById(int noticeid) {
		return noticeDao.get(noticeid);
	}

	@Override
	public void update(Notice notice) {
		noticeDao.update(notice);
	}

	@Override
	public void delete(int noticeid) {
		noticeDao.delete(noticeid);
	}
	
	
}
