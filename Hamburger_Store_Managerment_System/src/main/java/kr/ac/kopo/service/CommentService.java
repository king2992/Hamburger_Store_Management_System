package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Comment;

public interface CommentService {

	List<Comment> commentList(int number);

	int commentInsert(Comment comm);

	int commentUpdate(Comment comm);

	int commentDelete(int coNumber);

	int commentReply(Comment comm);

}
