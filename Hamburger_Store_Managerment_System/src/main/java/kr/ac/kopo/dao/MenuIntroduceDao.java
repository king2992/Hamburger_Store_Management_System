package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.MenuInfo;

public interface MenuIntroduceDao {

	List<Menu> setList();

	List<Menu> burgerList();

	List<Menu> sideList();

	List<Menu> drinkList();

	MenuInfo menuInfo(int menuId);

}
