package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.ordersMenuList;

public interface PosService {

	List<Menu> getList();

	void add(Menu item);

	Menu positem(int menuId);

	int pDelete(int menuId);


	void ordersMenuAdd(HashMap<String, Object> map);

	void orders(HashMap<String, Object> map);

	List<Orders> reservedList();

	List<ordersMenuList> reservedListCheck(int orderId);

	List<Orders> dateSort(String regDate);

	void reservedListStatus(int orderId);

}
