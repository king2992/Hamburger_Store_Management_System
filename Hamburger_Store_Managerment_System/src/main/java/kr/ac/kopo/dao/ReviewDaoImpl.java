package kr.ac.kopo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Like;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Review;
  
@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession db;
	
	@Override
	public List<Review> reviewList(Paging paging) {
		return db.selectList("review.reviewList",paging);
	}

	@Override
	public void reviewAdd(Review reviewAdd) {
		db.insert("review.reviewAdd",reviewAdd);
	}

	@Override
	public Review update(int number) {
		return db.selectOne("review.update",number);
	}

	@Override
	public void reviewUp(Review reviewUp) {
		db.update("review.reviewUp",reviewUp);
	}

	@Override
	public void delete(int groupNum) {
		db.delete("review.delete",groupNum);
	}

	@Override
	public void ref(int number) {
		db.update("review.ref",number);
	}

	@Override
	public int total(Paging paging) {
		
		int total = db.selectOne("review.total",paging);
		
		return total;
	}

	@Override
	public void replyUpdate(Review review) {
		db.update("review.replyUpdate",review);
	}

	@Override
	public void reply(Review review) {
		db.insert("review.reply",review);
	}

	@Override
	public void likeAdd(Map<String, Object> map) {
		db.insert("review.likeAdd",map);
	}

	@Override
	public Like likeFunc(Map<String, Object> map) {
		return db.selectOne("review.likeFunc",map);
	}

	@Override
	public void likeDel(Map<String, Object> map) {
		db.update("review.likeDel",map);
	}

	@Override
	public void likeRun(Map<String, Object> map) {
		db.update("review.likeRun",map);
	}

	@Override
	public void likeCnt(int number) {
		db.selectOne("review.likeCnt",number);
	}

	@Override
	public void likeMin(Map<String, Object> map) {
		db.update("review.likeMin",map);
	}

	@Override
	public void likeAdd2(Map<String, Object> map) {
		db.update("review.likeAdd2",map);
	}

	@Override
	public void likeAdd3(Map<String, Object> map) {
		db.update("review.likeAdd3",map);
	}
 
}
