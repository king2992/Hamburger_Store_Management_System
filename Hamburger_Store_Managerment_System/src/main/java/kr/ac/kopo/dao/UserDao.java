package kr.ac.kopo.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.TakeoutReservedMenu;
import kr.ac.kopo.model.User;

public interface UserDao {

	void signUp(User user);

	int idCk(String userId);

	boolean login(User user);

	User personalInfomationChange(String userId);

	User nowPwCheck(HashMap<String, Object> map);

	void userPwUpdate(HashMap<String, Object> map);

	void userInfoUpdate(HashMap<String, Object> map);

	List<TakeOutReserved> takeoutReservedList(String userId);

	List<TakeoutReservedMenu> userReservedCheck(int takeoutId);







}
