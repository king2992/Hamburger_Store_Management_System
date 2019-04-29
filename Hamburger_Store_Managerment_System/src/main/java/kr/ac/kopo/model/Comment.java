package kr.ac.kopo.model;

public class Comment {

	private int coNumber;
	private int number;
	private String id;
	private String content;
	private String coDate;
	private int coGroup; // 대댓글번호
	private int coOrd; // 대댓글순서
	private int coDepth; // 대댓글깊이
	
	
	@Override
	public String toString() {
		return "Comment [coNumber=" + coNumber + ", number=" + number + ", id=" + id + ", content=" + content
				+ ", coDate=" + coDate + ", coGroup=" + coGroup + ", coOrd=" + coOrd + ", coDepth=" + coDepth + "]";
	}
	
	public int getCoNumber() {
		return coNumber;
	}
	public void setCoNumber(int coNumber) {
		this.coNumber = coNumber;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCoDate() {
		return coDate;
	}
	public void setCoDate(String coDate) {
		this.coDate = coDate;
	}
	public int getCoGroup() {
		return coGroup;
	}
	public void setCoGroup(int coGroup) {
		this.coGroup = coGroup;
	}
	public int getCoOrd() {
		return coOrd;
	}
	public void setCoOrd(int coOrd) {
		this.coOrd = coOrd;
	}
	public int getCoDepth() {
		return coDepth;
	}
	public void setCoDepth(int coDepth) {
		this.coDepth = coDepth;
	}
	
	
	
	
}
