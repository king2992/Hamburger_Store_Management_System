package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Pos;
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.TakeoutReservedMenu;
import kr.ac.kopo.model.ordersMenuList;
import kr.ac.kopo.model.setSideDrink;

public interface PosDao {



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

	List<Orders> reservedList();

	List<ordersMenuList> reservedListCheck(int orderId);

	List<Orders> dateSort(String regDate);

	void reservedListStatus(int orderId);

	List<Menu> chickenList();

	List<Menu> burgerList();

	List<Menu> sideMenuList();

	List<Menu> drinkMenuList();

	List<TakeOutReserved> takeoutReservedList();

	List<TakeoutReservedMenu> takeoutReservedCheck(int takeoutId);

	void takeoutReservedListStatus(int takeoutId);

	List<TakeOutReserved> takeoutDateSort(String reservedDate);

	void setMenuAdd(setSideDrink item);

	String takeoutSales(String regDate);

	String ordersSales(String regDate);

	List<setSideDrink> getSetSide();

	List<setSideDrink> getSetDrink();


	

}
