package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired
	private SqlSession king;
	
	@Override
	public int commentInsert(Comment comm) {
		return king.insert("comment.commentInsert",comm);
	}

	@Override
	public List<Comment> commentList(int number) {
		return king.selectList("comment.commentList",number);
	}

	@Override
	public int commentUpdate(Comment comm) {
		return king.update("comment.commentUpdate",comm);
	}

	@Override
	public int commentDelete(int coNumber) {
		return king.delete("comment.commentDelete",coNumber);
	}

	@Override
	public int commentReply(Comment comm) {
		return king.insert("comment.commentReply",comm);
	}

	@Override
	public int commentReplyUp(Comment comm) {
		return king.update("comment.commentReplyUp",comm);
	}
	
}
