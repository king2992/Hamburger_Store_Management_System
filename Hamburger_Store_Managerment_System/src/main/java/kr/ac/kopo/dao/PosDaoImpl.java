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
import kr.ac.kopo.model.ordersMenuList;


@Repository
public class PosDaoImpl implements PosDao {

	@Autowired
	SqlSession sql;
	

	@Override
	public List<Menu> getList( ) {
		return sql.selectList("pos.getList");
	}

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

}
