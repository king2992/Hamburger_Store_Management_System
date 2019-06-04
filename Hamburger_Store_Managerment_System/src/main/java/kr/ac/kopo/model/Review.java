package kr.ac.kopo.model;

import java.util.Arrays;
import java.util.Date;
  

public class Review {
	  
	private int number; // 글번호
	private String title; // 제목
	private String contents; // 내용
	private String userId; // 아이디
	private Date date; // 등록일자
	private int ref;  // 조회수
	private int coNum; //댓글 갯수
	private int groupNum; // 답글 번호
	private int groupOrd; // 답글 순서
	private int groupDepth; //답글 깊이
	private String[] files; // 첨부파일 
	private int fileCnt; // 파일갯수
	private int likeCnt; // 좋아요갯수
	
	@Override
	public String toString() {
		return "Review [number=" + number + ", title=" + title + ", contents=" + contents + ", userId=" + userId
				+ ", date=" + date + ", ref=" + ref + ", coNum=" + coNum + ", groupNum=" + groupNum + ", groupOrd="
				+ groupOrd + ", groupDepth=" + groupDepth + ", files=" + Arrays.toString(files) + ", fileCnt=" + fileCnt
				+ ", likeCnt=" + likeCnt + "]";
	}
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getCoNum() {
		return coNum;
	}
	public void setCoNum(int coNum) {
		this.coNum = coNum;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public int getGroupOrd() {
		return groupOrd;
	}
	public void setGroupOrd(int groupOrd) {
		this.groupOrd = groupOrd;
	}
	public int getGroupDepth() {
		return groupDepth;
	}
	public void setGroupDepth(int groupDepth) {
		this.groupDepth = groupDepth;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	
}