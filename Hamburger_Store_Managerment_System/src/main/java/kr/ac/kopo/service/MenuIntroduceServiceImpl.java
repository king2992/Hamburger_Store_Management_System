package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.MenuIntroduceDao;
import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.MenuInfo;
@Service
public class MenuIntroduceServiceImpl implements MenuIntroduceService {
	@Autowired
	MenuIntroduceDao dao;
	@Override
	public List<Menu> setList() {
		return dao.setList();
	}

	@Override
	public List<Menu> burgerList() {
		return dao.burgerList();
	}

	@Override
	public List<Menu> sideList() {
		return dao.sideList();
	}

	@Override
	public List<Menu> drinkList() {
		return dao.drinkList();
	}

	@Override
	public MenuInfo menuInfo(int menuId) {
		return dao.menuInfo(menuId);
	}

}
