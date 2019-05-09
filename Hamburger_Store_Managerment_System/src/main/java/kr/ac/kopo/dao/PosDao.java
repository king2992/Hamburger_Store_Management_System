package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Pos;

public interface PosDao {


	List<Menu> getList();

	//void delete(int pNumber);

	void add(Menu item);

	Menu positem(int menuId);

	void update(Menu item);
	/*
	 * List<Pos> chicken(Paging paging);
	 * 
	 * List<Pos> burger(Paging paging);
	 * 
	 * List<Pos> side(Paging paging);
	 * 
	 * List<Pos> drink(Paging paging);
	 */

	int pDelete(int menuId);

	void orders(HashMap<String, Object> map);

	void orderMenuAdd(HashMap<String, Object> map);

	

}
