package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.dao.FileDao;
import kr.ac.kopo.dao.ReviewDao;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
  
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private FileDao fileDao;
	
	@Override
	public List<Review> reviewList(Paging paging) {
		int total = (int) reviewDao.total(paging);
			paging.setTotal(total);
		return reviewDao.reviewList(paging);
	}
	@Transactional
	@Override
	public void reviewAdd(Review reviewAdd) throws Exception {
		
		// 게시글 입력처리
		reviewDao.reviewAdd(reviewAdd);
		String[] files = reviewAdd.getFiles();
		
		if (files == null) {
			return;
		}
		// 게시글 첨부파일 입력처리
		for (String fileName : files) {
			fileDao.addFile(fileName);
		}
	}

	@Override
	public Review update(int number) {
		return reviewDao.update(number);
	}
	
	@Transactional
	@Override
	public void reviewUp(Review reviewUp) throws Exception {
		int number = reviewUp.getNumber();
		String[] files = reviewUp.getFiles();
		
		reviewDao.reviewUp(reviewUp);
		fileDao.deleteFiles(number);
		
		if (files == null)
			return;
		for (String fileName : files)
			fileDao.replaceFile(fileName, number);
	}
	// 게시글 삭제 처리
	@Transactional
	@Override
	public void delete(int number) throws Exception {
		fileDao.deleteFiles(number);
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
	//	트랜지션 - 두개의 쿼리를 실행해서 하나라도 false 면 false 같이 true 가 되야 쿼리 처리된다.
	@Transactional
	@Override
	public void reply(Review review) {
		reviewDao.replyUpdate(review);
		reviewDao.reply(review);
	}
}
