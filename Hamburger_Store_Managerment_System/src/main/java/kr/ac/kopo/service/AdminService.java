package kr.ac.kopo.service;

import java.util.Map;

import kr.ac.kopo.model.Admin;

public interface AdminService {

	Admin adminIdCk(Map<String, Object> map);

	void adminSignUp(Admin admin) throws Exception;

	void joinConfirm(String authkey);

	String adminLogin(Map<String, Object> map);

}
