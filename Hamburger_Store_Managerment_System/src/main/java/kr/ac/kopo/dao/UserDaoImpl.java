package kr.ac.kopo.dao;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.PayInfo;
import kr.ac.kopo.model.Review;
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.TakeoutReservedMenu;
import kr.ac.kopo.model.User;
@Repository
public class UserDaoImpl implements UserDao {
@Autowired
SqlSession sql;
	@Override
	public void signUp(User user) {
		sql.insert("user.signUp", user);
	}
	@Override
	public int idCk(String userId) {
		return sql.selectOne("user.idCk", userId);
	}

	@Override
	public User personalInfomationChange(String userId) {
		return sql.selectOne("user.personalInfomationChange", userId);
	}
	@Override
	public User nowPwCheck(HashMap<String, Object> map) {
		return sql.selectOne("user.nowPwCheck", map);
	}
	@Override
	public void userPwUpdate(HashMap<String, Object> map) {
		sql.update("user.userPwUpdate", map);
	}
	@Override
	public void userInfoUpdate(HashMap<String, Object> map) {
		sql.update("user.userInfoUpdate", map);
	}
	@Override
	public List<TakeOutReserved> takeoutReservedList(String userId) {
		return sql.selectList("user.takeoutReservedList",userId);
	}
	@Override
	public List<TakeoutReservedMenu> userReservedCheck(int takeoutId) {
		return sql.selectList("user.userTakeoutReservedCheck", takeoutId);
	}
	@Override
	public List<Review> myWritten(String userId) {
		return sql.selectList("user.myWritten", userId);
	}
	@Override
	public void payInfoAdd(HashMap<String, Object> map) {
		sql.insert("user.payInfoAdd", map);
	}
	@Override
	public PayInfo cardCheck(HashMap<String, Object> map) {
		return sql.selectOne("user.cardCheck", map);
	}
	@Override
	public User signIn(HashMap<String, Object> map) {
		return sql.selectOne("user.signIn", map);
	}
	@Override
	public void myWrittenDelete(int number) {
		sql.delete("user.myWrittenDelete", number);
	}
	@Override
	public User userWithdrawal(HashMap<String, Object> map) {
		return sql.selectOne("user.userWithdrawal", map);
	}
	@Override
	public void userDelete(String userId) {
		sql.delete("user.userDelete", userId);
	}
	@Override
	public void userBoardDelete(String userId) {
		sql.delete("user.userBoardDelete", userId);
	}
	@Override
	public void userCommentDelete(String userId) {
		sql.delete("user.userCommentDelete", userId);
	}
	@Override
	public void userTakeoutReservedListDelete(String userId) {
		sql.delete("user.userTakeoutReservedListDelete", userId);
	}
	@Override
	public void userPayCardDelete(String userId) {
		sql.delete("user.userPayCardDelete", userId);
	}
	@Override
	public void likeToDelete(String userId) {
		sql.delete("user.likeToDelete", userId);
	}
	@Override
	public PayInfo myCard(String userId) {
		return sql.selectOne("user.myCard", userId);
	}
	@Override
	public void cardDelete(String userId) {
		sql.delete("user.cardDelete", userId);
	}
	
	
}
