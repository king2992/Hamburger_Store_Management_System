package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.TakeOutReserved;
@Repository
public class orderDaoImpl implements orderDao {
@Autowired
SqlSession sql;
	@Override
	public List<Orders> orderDisplay() {
		return sql.selectList("takeOutReservedList.orderDisplay");
	}
	@Override
	public List<Orders> orderDisplaySuccess() {
		return sql.selectList("takeOutReservedList.orderDisplaySuccess");
	}
	@Override
	public void orderDisplayOk(int orderId) {
		sql.update("takeOutReservedList.orderDisplayOk", orderId);
	}

}
