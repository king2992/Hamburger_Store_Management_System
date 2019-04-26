package kr.ac.kopo.model;



public class Ticketing {
	int ticketId;
	String userId;
	String seatName;
	String ticketPrice;
	String reservedDate;
	String finishTime;
	String reservedTime;
	
	public String getReservedTime() {
		return reservedTime;
	}
	public void setReservedTime(String reservedTime) {
		this.reservedTime = reservedTime;
	}
	public String getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getTicketId() {
		return ticketId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public String getSeatName() {
		return seatName;
	}
	public void setSeatName(String seatNumber) {
		this.seatName = seatNumber;
	}
	
	public String getTicketPrice() {
		return ticketPrice;
	}
	public void setTicketPrice(String ticketPrice) {
		this.ticketPrice = ticketPrice;
	}
	public String getReservedDate() {
		return reservedDate;
	}
	public void setReservedDate(String reservedDate) {
		this.reservedDate = reservedDate;
	}	
}
