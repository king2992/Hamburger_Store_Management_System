package kr.ac.kopo.service;


import kr.ac.kopo.model.User;

public interface UserService {

	void signUp(User user);

	int idCk(String userId);

	boolean login(User user);
	

}
