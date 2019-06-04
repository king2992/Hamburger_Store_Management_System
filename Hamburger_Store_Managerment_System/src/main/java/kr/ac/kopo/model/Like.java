package kr.ac.kopo.model;

public class Like {
 
	private int likeNo;  //추천번호
	private int likeCheck;  //추천상태
	private String userId;  // 아이디
	private int number; // 글번호
	 
	@Override
	public String toString() {
		return "Like [likeNo=" + likeNo + ", likeCheck=" + likeCheck + ", userId=" + userId + ", number=" + number
				+ "]";
	}
	
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getLikeCheck() {
		return likeCheck;
	}
	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
	
}
