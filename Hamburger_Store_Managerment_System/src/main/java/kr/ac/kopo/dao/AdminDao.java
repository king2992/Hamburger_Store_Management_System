package kr.ac.kopo.dao;

import java.util.Map;

import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.BusinessNumCheck;

public interface AdminDao {

	Admin adminIdCk(Map<String, Object> map);

	void adminSignUp(Admin admin);


	void joinConfirm(Map<String, Object> map);

	String adminLogin(Map<String, Object> map);

	Admin adminMyPage(String adminId);

	void authKeyUpdate(Map<String, Object> map);

	BusinessNumCheck businessAuth(String businessNum);

	void businessAuthInsert(Map<String, Object> businessNumMap);

	void businessAuthStatusUpdate(Map<String, Object> businessStatusMap);

	Admin authConfirm(String adminId);


}
