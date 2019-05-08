package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Pos;

public interface PosService {

	List<Pos> getList(Paging paging);

//	void delete(int pNumber);

	void add(Pos item);

	Pos positem(int pNumber);

	void update(Pos item);

	int pDelete(int pNumber);

	void orders(Orders order);



	/*
	 * List<Pos> chicken(Paging paging);
	 * 
	 * List<Pos> burger(Paging paging);
	 * 
	 * List<Pos> side(Paging paging);
	 * 
	 * List<Pos> drink(Paging paging);
	 */

}
