package kr.ac.kopo.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class KioskDaoImpl implements KioskDao {

	@Autowired
	private SqlSession sql;
	@Override
	public void orderMenuAdd(HashMap<String, Object> map) {
		sql.insert("kiosk.orderMenuAdd", map);
	}

	@Override
	public void orders(HashMap<String, Object> map) {
		sql.insert("kiosk.orders",map);
	}

}
