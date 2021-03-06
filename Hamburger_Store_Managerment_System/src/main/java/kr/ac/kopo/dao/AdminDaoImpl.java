package kr.ac.kopo.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.BusinessNumCheck;
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
	public String adminLogin(Map<String, Object> map) {
		return sql.selectOne("admin.adminLogin", map);
	}
	@Override
	public Admin adminMyPage(String adminId) {
		return sql.selectOne("admin.adminMyPage", adminId);
	}
	@Override
	public void authKeyUpdate(Map<String, Object> map) {
		sql.update("admin.authKeyUpdate", map);
	}
	@Override
	public void joinConfirm(Map<String, Object> map) {
		sql.update("admin.joinConfirm", map);
	}
	@Override
	public BusinessNumCheck businessAuth(String businessNum) {
		return sql.selectOne("admin.businessAuth", businessNum);
	}
	@Override
	public void businessAuthInsert(Map<String, Object> businessNumMap) {
		sql.update("admin.businessNumInsert", businessNumMap);
	}
	@Override
	public void businessAuthStatusUpdate(Map<String, Object> businessStatusMap) {
		sql.update("admin.businessAuthStatusUpdate", businessStatusMap);
	}
	@Override
	public Admin authConfirm(String adminId) {
		return sql.selectOne("admin.authConfirm", adminId);
	}
	
}
