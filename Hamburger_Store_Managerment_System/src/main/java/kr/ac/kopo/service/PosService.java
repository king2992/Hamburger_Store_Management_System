package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.Orders;

public interface PosService {

	List<Menu> getList();

	void add(Menu item);

	Menu positem(int menuId);

	int pDelete(int menuId);


	void ordersMenuAdd(HashMap<String, Object> map);

	void orders(HashMap<String, Object> map);

}
