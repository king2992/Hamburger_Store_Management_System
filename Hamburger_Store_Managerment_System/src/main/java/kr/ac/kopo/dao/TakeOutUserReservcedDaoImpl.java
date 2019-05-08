package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.TakeOutReserved;
@Repository
public class TakeOutUserReservcedDaoImpl implements TakeOutUserReservedDao {
@Autowired
SqlSession sql;

@Override
public void takeOutReservedListInsert(TakeOutReserved takeoutreserved) {
	sql.insert("takeOutReservedList.insert",takeoutreserved);
}

@Override
public void takeOutReservedMenuInsert(HashMap<String, Object> map) {
	sql.insert("takeOutReservedList.menuInsert", map);
}

@Override
public void menuAdd(Menu menuadd) {
	sql.insert("takeOutReservedList.menuAdd", menuadd);
}

@Override
public List<Menu> chickenList() {
	return sql.selectList("takeOutReservedList.chickenList");
}

@Override
public List<Menu> burgerList() {
	return sql.selectList("takeOutReservedList.burgerList");
}

@Override
public List<Menu> sideList() {
	return sql.selectList("takeOutReservedList.sideList");
}

@Override
public List<Menu> drinkList() {
	return sql.selectList("takeOutReservedList.drinkList");
}

@Override
public void menuListDel(int menuId) {
	sql.delete("takeOutReservedList.menuListDel", menuId);
}
}
