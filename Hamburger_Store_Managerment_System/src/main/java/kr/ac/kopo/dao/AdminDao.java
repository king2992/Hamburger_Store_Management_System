package kr.ac.kopo.dao;

import java.util.Map;

import kr.ac.kopo.model.Admin;

public interface AdminDao {

	Admin adminIdCk(Map<String, Object> map);

	void adminSignUp(Admin admin);


	void joinConfirm(String authkey);

	String adminLogin(Map<String, Object> map);

}
