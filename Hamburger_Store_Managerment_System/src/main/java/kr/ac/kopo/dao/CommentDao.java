package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Comment;

public interface CommentDao {

	int commentInsert(Comment comm);

	List<Comment> commentList(int number);

	int commentUpdate(Comment comm);

	int commentDelete(int coNumber);

	int commentReply(Comment comm);

	int commentReplyUp(Comment comm);


}
