package kr.ac.kopo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.TakeOutUserReservedDao;
import kr.ac.kopo.model.TakeOutReserved;
@Service
public class TakeOutUserReservedServiceImpl implements TakeOutUserReservedService {
	@Autowired
	TakeOutUserReservedDao dao;

	@Override
	public void takeOutReservedListInsert(TakeOutReserved takeoutreserved) {
		dao.takeOutReservedListInsert(takeoutreserved);
	}

	@Override
	public void takeOutReservedMenuInsert(HashMap<String, Object> map) {
		dao.takeOutReservedMenuInsert(map);
	}
	
}
