package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.PayInfo;
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.setSideDrink;

public interface TakeOutUserReservedService {


	void takeOutReservedListInsert(TakeOutReserved takeoutreserved);

	void takeOutReservedMenuInsert(HashMap<String, Object> map);

	void menuAdd(Menu menuadd);

	List<Menu> chickenList();

	List<Menu> burgerList();

	List<Menu> sideList();

	List<Menu> drinkList();

	void menuListDel(int menuId);

	List<setSideDrink> setSideList();

	List<setSideDrink> setDrinkList();

	PayInfo myCardLoad(String userId);

	PayInfo cardPay(HashMap<String, Object> map);

	PayInfo cardInputPay(HashMap<String, Object> map);


	

	

}
