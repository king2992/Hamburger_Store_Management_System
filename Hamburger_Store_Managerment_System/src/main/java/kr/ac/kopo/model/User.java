package kr.ac.kopo.model;

public class User {
	String userId;
	String userPassword;
	int userCommentStatus;
	int userBoardStatus;
	int boardNum;
	
	
	
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
