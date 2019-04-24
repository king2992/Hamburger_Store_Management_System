package kr.ac.kopo.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public boolean login(User user) {
		if(sql.selectOne("user.userLogin", user) == null)
			return false;
			
		return true;
	}
	

}
