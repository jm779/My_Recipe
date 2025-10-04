package kr.ac.kopo.recipe.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.ac.kopo.recipe.dao.CookDao;
import kr.ac.kopo.recipe.model.Cook;

@Service
public class CookServiceImpl implements CookService {
	@Autowired
	private CookDao cookDao;

	@Override
	public void add(Cook cook) {
		cookDao.add(cook);
	}

	@Override
	public List<Cook> list() {
		return cookDao.list();
	}

	@Override
	public Cook item(int recipeid) {
		return cookDao.item(recipeid);
	}

	@Override
	public void update(Cook item) {
		cookDao.update(item);
	}

	@Override
	public void delete(int recipeid) {
		cookDao.delete(recipeid);
	}

	@Override
	public Cook detail(int recipeid) {
		return cookDao.detail(recipeid);
	}

	
}