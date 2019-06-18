package kr.ac.kopo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.KioskDao;
@Service
public class KioskServiceImpl implements KioskService {
	
	@Autowired
	private KioskDao dao;
	
	@Override
	public void ordersMenuAdd(HashMap<String, Object> map) {
		dao.orderMenuAdd(map);
	}

	@Override
	public void orders(HashMap<String, Object> map) {
		dao.orders(map);
	}

}
