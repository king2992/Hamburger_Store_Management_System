package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.PosDao;
import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Pos;

@Service
public class PosServiceImpl implements PosService {

	@Autowired
	PosDao posdao;

	@Override
	public List<Menu> getList( ) {
		return posdao.getList();
	}
	@Override
	public void add(Menu item) {
		posdao.add(item);
	}
	@Override
	public Menu positem(int menuId) {
		return posdao.positem(menuId);
	}
	
	@Override
	public int pDelete(int menuId) {
		return posdao.pDelete(menuId);
	}
	
	@Override
	public void ordersMenuAdd(HashMap<String, Object> map) {
		posdao.orderMenuAdd(map);
	}
	
	@Override
	public void orders(HashMap<String, Object> map) {
		posdao.orders(map);
	}

}
