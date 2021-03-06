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
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.TakeoutReservedMenu;
import kr.ac.kopo.model.ordersMenuList;
import kr.ac.kopo.model.setSideDrink;

@Service
public class PosServiceImpl implements PosService {

	@Autowired
	PosDao posdao;

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
	@Override
	public List<Orders> reservedList() {
		return posdao.reservedList();
	}
	@Override
	public List<ordersMenuList> reservedListCheck(int orderId) {
		return posdao.reservedListCheck(orderId);
	}
	@Override
	public List<Orders> dateSort(String regDate) {
		return posdao.dateSort(regDate);
	}
	@Override
	public void reservedListStatus(int orderId) {
		posdao.reservedListStatus(orderId);
	}
	@Override
	public List<Menu> getChickenList() {
		return posdao.chickenList();
	}
	@Override
	public List<Menu> getBurgerList() {
		return posdao.burgerList();
	}
	@Override
	public List<Menu> getSideMenuList() {
		return posdao.sideMenuList();
	}
	@Override
	public List<Menu> getDrinkMenuList() {
		return posdao.drinkMenuList();
	}
	@Override
	public List<TakeOutReserved> takeoutReservedList() {
		return posdao.takeoutReservedList();
	}
	@Override
	public List<TakeoutReservedMenu> takeoutReservedCheck(int takeoutId) {
		return posdao.takeoutReservedCheck(takeoutId);
	}
	@Override
	public void takeoutReservedListStatus(int takeoutId) {
		posdao.takeoutReservedListStatus(takeoutId);
	}
	@Override
	public List<TakeOutReserved> takeoutDateSort(String reservedDate) {
		return posdao.takeoutDateSort(reservedDate);
	}
	@Override
	public void setMenuAdd(setSideDrink item) {
		posdao.setMenuAdd(item);
	}
	@Override
	public String takeoutSales(String regDate) {
		return posdao.takeoutSales(regDate);
	}
	@Override
	public String ordersSales(String regDate) {
		return posdao.ordersSales(regDate);
	}
	@Override
	public List<setSideDrink> getSetSide() {
		return posdao.getSetSide();
	}
	@Override
	public List<setSideDrink> getSetDrink() {
		return posdao.getSetDrink();
	}
	

}
