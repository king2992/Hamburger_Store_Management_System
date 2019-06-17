package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.MenuInfo;

public interface MenuIntroduceService {

	List<Menu> setList();

	List<Menu> burgerList();

	List<Menu> sideList();

	List<Menu> drinkList();

	MenuInfo menuInfo(int menuId);

}
