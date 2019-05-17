package kr.ac.kopo.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.UserDao;
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
	public boolean login(User user) {
		return dao.login(user);
	}
	
	

}
