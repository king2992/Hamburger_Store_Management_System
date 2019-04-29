package kr.ac.kopo.dao;


import kr.ac.kopo.model.User;

public interface UserDao {

	void signUp(User user);

	int idCk(String userId);

	boolean login(User user);


}
