package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.TakeoutReservedMenu;
import kr.ac.kopo.model.ordersMenuList;
import kr.ac.kopo.model.setSideDrink;

public interface PosService {


	void add(Menu item);

	Menu positem(int menuId);

	int pDelete(int menuId);

	void ordersMenuAdd(HashMap<String, Object> map);

	void orders(HashMap<String, Object> map);

	List<Orders> reservedList();

	List<ordersMenuList> reservedListCheck(int orderId);

	List<Orders> dateSort(String regDate);

	void reservedListStatus(int orderId);

	List<Menu> getChickenList();

	List<Menu> getBurgerList();

	List<Menu> getSideMenuList();

	List<Menu> getDrinkMenuList();

	List<TakeOutReserved> takeoutReservedList();

	List<TakeoutReservedMenu> takeoutReservedCheck(int takeoutId);

	void takeoutReservedListStatus(int takeoutId);

	List<TakeOutReserved> takeoutDateSort(String reservedDate);

	void setMenuAdd(setSideDrink item);

	String takeoutSales(String regDate);

	String ordersSales(String regDate);


}
