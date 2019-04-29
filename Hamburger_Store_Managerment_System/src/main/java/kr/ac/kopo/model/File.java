package kr.ac.kopo.model;

import java.util.Date;

public class File {

	private String fileName; // 첨부파일 이름
	private int number; // 글 번호
	private Date regDate; //파일 업로드 날짜
	
	@Override
	public String toString() {
		return "File [fileName=" + fileName + ", number=" + number + ", regDate=" + regDate + "]";
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
