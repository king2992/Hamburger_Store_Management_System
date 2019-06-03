package kr.ac.kopo.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.kopo.model.PayInfo;
import kr.ac.kopo.model.Review;
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.TakeoutReservedMenu;
import kr.ac.kopo.model.User;

public interface UserService {

	void signUp(User user);

	int idCk(String userId);
	
	User signIn(HashMap<String, Object> map);

	User personalInfomationChange(String userId);

	User nowPwCheck(HashMap<String, Object> map);

	void userPwUpdate(HashMap<String, Object> map);

	void userInfoUpdate(HashMap<String, Object> map);

	List<TakeOutReserved> takeoutReservedList(String userId);

	List<TakeoutReservedMenu> userReservedCheck(int takeoutId);

	List<Review> myWritten(String userId);

	void payInfoAdd(HashMap<String, Object> map);

	PayInfo cardCheck(HashMap<String, Object> map);


	





	

}
