package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.TakeOutUserReservedDao;
import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.TakeOutReserved;
@Service
public class TakeOutUserReservedServiceImpl implements TakeOutUserReservedService {
	@Autowired
	TakeOutUserReservedDao dao;

	@Override
	public void takeOutReservedListInsert(TakeOutReserved takeoutreserved) {
		dao.takeOutReservedListInsert(takeoutreserved);
	}

	@Override
	public void takeOutReservedMenuInsert(HashMap<String, Object> map) {
		dao.takeOutReservedMenuInsert(map);
	}

	@Override
	public void menuAdd(Menu menuadd) {
		dao.menuAdd(menuadd);
	}

	@Override
	public List<Menu> chickenList() {
		return dao.chickenList();
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
	public void menuListDel(int menuId) {
		dao.menuListDel(menuId); 
	}


	
	
}
