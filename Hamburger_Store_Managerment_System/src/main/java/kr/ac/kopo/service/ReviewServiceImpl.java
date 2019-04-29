package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.dao.ReviewDao;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public List<Review> reviewList(Paging paging) {
		int total = (int) reviewDao.total(paging);
			paging.setTotal(total);
		return reviewDao.reviewList(paging);
	}
	@Transactional
	@Override
	public void reviewAdd(Review reviewAdd) throws Exception {
		
		reviewDao.reviewAdd(reviewAdd);
	}

	@Override
	public Review update(int number) {
		return reviewDao.update(number);
	}
	
	@Transactional
	@Override
	public void reviewUp(Review reviewUp) throws Exception {
		
		reviewDao.reviewUp(reviewUp);

	}
	// 게시글 삭제 처리
	@Transactional
	@Override
	public void delete(int number) throws Exception {
		reviewDao.delete(number);
	}

	@Override
	public void ref(int number) {
		reviewDao.ref(number);
	}

	@Override
	public void like(int number) {
		reviewDao.like(number);
	}

}
