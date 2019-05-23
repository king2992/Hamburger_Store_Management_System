package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.setSideDrink;

public interface TakeOutUserReservedDao {

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

	

}
