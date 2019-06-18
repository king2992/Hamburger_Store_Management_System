package kr.ac.kopo.dao;

import java.util.HashMap;

public interface KioskDao {

	void orderMenuAdd(HashMap<String, Object> map);

	void orders(HashMap<String, Object> map);

}
