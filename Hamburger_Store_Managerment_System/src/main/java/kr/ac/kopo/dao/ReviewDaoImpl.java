package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public void like(int number) {
		db.update("review.reLike",number);
	}

	@Override
	public int total(Paging paging) {
		
		int total = db.selectOne("review.total",paging);
		
		return total;
	}

}
