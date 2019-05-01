package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Pos;


@Repository
public class PosDaoImpl implements PosDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Paging paging) {
		
		int total = sql.selectOne("pos.total",paging);
		
		return total;
	}

	@Override
	public List<Pos> getList(Paging paging) {
		return sql.selectList("pos.getList",paging);
	}

	//@Override
	//public void delete(int pNumber) {
		//sql.delete("pos.delete",pNumber);
	//}

	@Override
	public void add(Pos item) {
		sql.insert("pos.add",item);
	}

	@Override
	public Pos positem(int pNumber) {
		return sql.selectOne("pos.positem",pNumber);
	}

	@Override
	public void update(Pos item) {
		sql.update("pos.update",item);
	}
	/*
	 * @Override public List<Pos> chicken(Paging paging) { return
	 * sql.selectList("pos.chicken",paging); }
	 * 
	 * @Override public List<Pos> burger(Paging paging) { return
	 * sql.selectList("pos.burger",paging); }
	 * 
	 * @Override public List<Pos> side(Paging paging) { return
	 * sql.selectList("pos.side",paging); }
	 * 
	 * @Override public List<Pos> drink(Paging paging) { return
	 * sql.selectList("pos.drink",paging); }
	 */

	@Override
	public int pDelete(int pNumber) {
		return sql.delete("pos.pDelete",pNumber);
	}

}
