package kr.ac.kopo.dao;

import java.util.HashMap;

import kr.ac.kopo.model.TakeOutReserved;

public interface TakeOutUserReservedDao {

	void takeOutReservedListInsert(TakeOutReserved takeoutreserved);

	void takeOutReservedMenuInsert(HashMap<String, Object> map);

}
