package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.TakeOutReserved;

public interface orderDao {

	List<Orders> orderDisplay();

	List<Orders> orderDisplaySuccess();

	void orderDisplayOk(int orderId);

}
