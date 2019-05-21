package kr.ac.kopo.model;

public class TakeOutReserved {
	int takeoutId;
	String reservedName;
	String reservedPhone;
	String userId;
	int totalPrice;
	String reservedDate;
	String reservedTime;
	String status;
	String frcName;
	
	
	public String getFrcName() {
		return frcName;
	}
	public void setFrcName(String frcName) {
		this.frcName = frcName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getTakeoutId() {
		return takeoutId;
	}
	public void setTakeoutId(int takeoutId) {
		this.takeoutId = takeoutId;
	}
	public String getReservedName() {
		return reservedName;
	}
	public void setReservedName(String reservedName) {
		this.reservedName = reservedName;
	}
	public String getReservedPhone() {
		return reservedPhone;
	}
	public void setReservedPhone(String reservedPhone) {
		this.reservedPhone = reservedPhone;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getReservedDate() {
		return reservedDate;
	}
	public void setReservedDate(String reservedDate) {
		this.reservedDate = reservedDate;
	}
	public String getReservedTime() {
		return reservedTime;
	}
	public void setReservedTime(String reservedTime) {
		this.reservedTime = reservedTime;
	}
	
}
