package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Pos;
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.TakeoutReservedMenu;
import kr.ac.kopo.model.ordersMenuList;
import kr.ac.kopo.model.setSideDrink;


@Repository
public class PosDaoImpl implements PosDao {

	@Autowired
	SqlSession sql;

	@Override
	public void add(Menu item) {
		sql.insert("pos.add",item);
	}

	@Override
	public Menu positem(int menuId) {
		return sql.selectOne("pos.positem",menuId);
	}

	@Override
	public void update(Menu item) {
		sql.update("pos.update",item);
	}

	@Override
	public int pDelete(int menuId) {
		return sql.delete("pos.pDelete",menuId);
	}

	@Override
	public void orderMenuAdd(HashMap<String, Object> map) {
		sql.insert("pos.orderMenuAdd", map);
	}

	@Override
	public void orders(HashMap<String, Object> map) {
		sql.insert("pos.orders",map);		
	}

	@Override
	public List<Orders> reservedList() {
		return sql.selectList("pos.ordersList");
	}

	@Override
	public List<ordersMenuList> reservedListCheck(int orderId) {
		return sql.selectList("pos.reservedListCheck", orderId);
	}

	@Override
	public List<Orders> dateSort(String regDate) {
		return sql.selectList("pos.dateSort", regDate);
	}

	@Override
	public void reservedListStatus(int orderId) {
		sql.update("pos.reservedListStatus", orderId);
	}


	@Override
	public List<Menu> chickenList() {
		return sql.selectList("pos.chickenList");
	}

	@Override
	public List<Menu> burgerList() {
		return sql.selectList("pos.burgerList");
	}

	@Override
	public List<Menu> sideMenuList() {
		return sql.selectList("pos.sideMenuList");
	}

	@Override
	public List<Menu> drinkMenuList() {
		return sql.selectList("pos.drinkMenuList");
	}

	@Override
	public List<TakeOutReserved> takeoutReservedList() {
		return sql.selectList("pos.takeoutReservedList");
	}

	@Override
	public List<TakeoutReservedMenu> takeoutReservedCheck(int takeoutId) {
		return sql.selectList("pos.takeoutReservedCheck", takeoutId);
	}

	@Override
	public void takeoutReservedListStatus(int takeoutId) {
		sql.update("pos.takeoutReservedListStatus", takeoutId);
	}

	@Override
	public List<TakeOutReserved> takeoutDateSort(String reservedDate) {
		 return sql.selectList("pos.takeoutDateSort", reservedDate);
	}

	@Override
	public void setMenuAdd(setSideDrink item) {
		sql.insert("pos.setMenuAdd", item);
	}

	@Override
	public String takeoutSales(String regDate) {
		return sql.selectOne("pos.takeoutSales", regDate);
	}

	@Override
	public String ordersSales(String regDate) {
		return sql.selectOne("pos.ordersSales", regDate);
	}

	@Override
	public List<setSideDrink> getSetSide() {
		return sql.selectList("pos.setSideList");
	}

	@Override
	public List<setSideDrink> getSetDrink() {
		return sql.selectList("pos.setDrinkList");
	}

	

}
