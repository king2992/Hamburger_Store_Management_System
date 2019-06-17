package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.MenuInfo;
@Repository
public class MenuIntroduceDaoImpl implements MenuIntroduceDao {
@Autowired
SqlSession sql;
	@Override
	public List<Menu> setList() {
		return sql.selectList("menuIntroduce.setList");
	}

	@Override
	public List<Menu> burgerList() {
		 return sql.selectList("menuIntroduce.burgerList");
	}

	@Override
	public List<Menu> sideList() {
		 return sql.selectList("menuIntroduce.sideList");
	}

	@Override
	public List<Menu> drinkList() {
		 return sql.selectList("menuIntroduce.drinkList");
	}

	@Override
	public MenuInfo menuInfo(int menuId) {
		return sql.selectOne("menuIntroduce.menuInfo", menuId);
	}

}
