package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.dao.CommentDao;
import kr.ac.kopo.model.Comment;
@Service
public class CommentServiceImpl implements CommentService {
 
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public List<Comment> commentList(int number) {
		return commentDao.commentList(number);
	}

	@Override
	public int commentInsert(Comment comm) {
		return commentDao.commentInsert(comm);
	}

	@Override
	public int commentUpdate(Comment comm) {
		return commentDao.commentUpdate(comm);
	}

	@Override
	public int commentDelete(int coNumber) {
		return commentDao.commentDelete(coNumber);
	}
	
	@Transactional
	@Override
	public int commentReply(Comment comm) {
		 commentDao.commentReplyUp(comm);
		 return commentDao.commentReply(comm);
	}

}
