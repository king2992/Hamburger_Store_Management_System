package kr.ac.kopo.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Admin;
@Repository
public class AdminDaoImpl implements AdminDao {
@Autowired
SqlSession sql;
	@Override
	public Admin adminIdCk(Map<String, Object> map) {
		return sql.selectOne("admin.adminIdCk", map);
	}
	@Override
	public void adminSignUp(Admin admin) {
		sql.insert("admin.adminSignUp", admin);
	}
	@Override
	public void joinConfirm(String authkey) {
		sql.update("admin.joinConfirm", authkey);
	}
	@Override
	public String adminLogin(Map<String, Object> map) {
		return sql.selectOne("admin.adminLogin", map);
	}


}
