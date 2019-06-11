package kr.ac.kopo.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.UserDao;
import kr.ac.kopo.model.PayInfo;
import kr.ac.kopo.model.Review;
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.TakeoutReservedMenu;
import kr.ac.kopo.model.User;
@Service
public class UserServiceImpl implements UserService {
@Autowired
UserDao dao;
	@Override
	public void signUp(User user) {
		dao.signUp(user);
	}
	@Override
	public int idCk(String userId) {
		return dao.idCk(userId);
	}
	@Override
	public User personalInfomationChange(String userId) {
		return dao.personalInfomationChange(userId);
	}
	@Override
	public User nowPwCheck(HashMap<String, Object> map) {
		return dao.nowPwCheck(map);
	}
	@Override
	public void userPwUpdate(HashMap<String, Object> map) {
		dao.userPwUpdate(map);
	}
	@Override
	public void userInfoUpdate(HashMap<String, Object> map) {
		dao.userInfoUpdate(map);
	}
	@Override
	public List<TakeOutReserved> takeoutReservedList(String userId) {
		return dao.takeoutReservedList(userId);
	}
	@Override
	public List<TakeoutReservedMenu> userReservedCheck(int takeoutId) {
		return dao.userReservedCheck(takeoutId);
	}
	@Override
	public List<Review> myWritten(String userId) {
		return dao.myWritten(userId);
	}
	@Override
	public void payInfoAdd(HashMap<String, Object> map) {
		dao.payInfoAdd(map);
	}
	@Override
	public PayInfo cardCheck(HashMap<String, Object> map) {
		return dao.cardCheck(map);
	}
	@Override
	public User signIn(HashMap<String, Object> map) {
		return dao.signIn(map);
	}
	@Override
	public void myWrittenDelete(int number) {
		dao.myWrittenDelete(number);
	}
	@Override
	public User userWithdrawal(HashMap<String, Object> map) {
		return dao.userWithdrawal(map);
	}
	@Override
	public void userDelete(String userId) {
		dao.userDelete(userId);
	}
	@Override
	public void userBoardDelete(String userId) {
		dao.userBoardDelete(userId);
	}
	@Override
	public void userCommentDelete(String userId) {
		dao.userCommentDelete(userId);
	}
	@Override
	public void userTakeoutReservedListDelete(String userId) {
		dao.userTakeoutReservedListDelete(userId);
	}
	@Override
	public void userPayCardDelete(String userId) {
		dao.userPayCardDelete(userId);
	}
	@Override
	public void likeToDelete(String userId) {
		dao.likeToDelete(userId);
	}
	@Override
	public PayInfo myCard(String userId) {
		return dao.myCard(userId);
	}
	@Override
	public void cardDelete(String userId) {
		dao.cardDelete(userId);
	}
	
	
	

	

}
