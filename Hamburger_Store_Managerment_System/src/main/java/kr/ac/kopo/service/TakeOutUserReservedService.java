package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.TakeOutReserved;

public interface TakeOutUserReservedService {


	void takeOutReservedListInsert(TakeOutReserved takeoutreserved);

	void takeOutReservedMenuInsert(HashMap<String, Object> map);

	void menuAdd(Menu menuadd);

	List<Menu> chickenList();

	List<Menu> burgerList();

	List<Menu> sideList();

	List<Menu> drinkList();

	void menuListDel(int menuId);


	

	

}
