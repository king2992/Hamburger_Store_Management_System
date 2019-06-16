package kr.ac.kopo.service;

import java.util.Map;

import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.BusinessNumCheck;

public interface AdminService {

	Admin adminIdCk(Map<String, Object> map);

	void adminSignUp(Admin admin) throws Exception;

	void joinConfirm(Map<String, Object> map);

	String adminLogin(Map<String, Object> map);

	Admin adminMyPage(String adminId);

	void adminEmail(Admin admin) throws Exception;

	BusinessNumCheck businessAuth(String businessNum);

	void businessAuthInsert(Map<String, Object> businessNumMap);

	void businessAuthStatusUpdate(Map<String, Object> businessStatusMap);

	Admin authConfirm(String adminId);




}
