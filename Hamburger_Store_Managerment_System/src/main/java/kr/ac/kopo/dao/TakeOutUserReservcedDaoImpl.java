package kr.ac.kopo.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	
}
