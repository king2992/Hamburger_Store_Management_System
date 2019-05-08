package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.PosDao;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Pos;

@Service
public class PosServiceImpl implements PosService {

	@Autowired
	PosDao posdao;

	@Override
	public List<Pos> getList(Paging paging) {
		int total = (int) posdao.total(paging);
		paging.setTotal(total);

		return posdao.getList(paging);
	}

	//@Override
	//public void delete(int pNumber) {
	//	posdao.delete(pNumber);
	//}

	@Override
	public void add(Pos item) {
		posdao.add(item);
	}

	@Override
	public Pos positem(int pNumber) {
		return posdao.positem(pNumber);
	}

	@Override
	public void update(Pos item) {
		posdao.update(item);
	}

	@Override
	public int pDelete(int pNumber) {
		return posdao.pDelete(pNumber);
	}

	@Override
	public void orders(Orders order) {
		posdao.orders(order);
	}



	/*
	 * @Override public List<Pos> chicken(Paging paging) { int total = (int)
	 * posdao.total(paging); paging.setTotal(total); return posdao.chicken(paging);
	 * }
	 * 
	 * @Override public List<Pos> burger(Paging paging) { int total = (int)
	 * posdao.total(paging); paging.setTotal(total); return posdao.burger(paging); }
	 * 
	 * @Override public List<Pos> side(Paging paging) { int total = (int)
	 * posdao.total(paging); paging.setTotal(total); return posdao.side(paging); }
	 * 
	 * @Override public List<Pos> drink(Paging paging) { int total = (int)
	 * posdao.total(paging); paging.setTotal(total); return posdao.drink(paging); }
	 */

}
