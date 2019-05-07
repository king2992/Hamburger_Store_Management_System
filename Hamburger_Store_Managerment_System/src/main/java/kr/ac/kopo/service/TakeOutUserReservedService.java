package kr.ac.kopo.service;

import java.util.HashMap;

import kr.ac.kopo.model.TakeOutReserved;

public interface TakeOutUserReservedService {


	void takeOutReservedListInsert(TakeOutReserved takeoutreserved);

	void takeOutReservedMenuInsert(HashMap<String, Object> map);

}
