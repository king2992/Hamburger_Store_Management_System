package kr.ac.kopo.model;

public class User {
	String userId;
	String userPassword;
	String userPhone;
	String userPhone1;
	String userPhone2;
	String userName;
	int userCommentStatus;
	int userBoardStatus;
	int boardNum;
	
	public String getUserPhone1() {
		return userPhone1;
	}
	public void setUserPhone1(String userPhone1) {
		this.userPhone1 = userPhone1;
	}
	public String getUserPhone2() {
		return userPhone2;
	}
	public void setUserPhone2(String userPhone2) {
		this.userPhone2 = userPhone2;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getUserCommentStatus() {
		return userCommentStatus;
	}
	public void setUserCommentStatus(int userCommentStatus) {
		this.userCommentStatus = userCommentStatus;
	}
	public int getUserBoardStatus() {
		return userBoardStatus;
	}
	public void setUserBoardStatus(int userBoardStatus) {
		this.userBoardStatus = userBoardStatus;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	
	
}
