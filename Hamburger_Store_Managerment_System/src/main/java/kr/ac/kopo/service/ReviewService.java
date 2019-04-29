package kr.ac.kopo.service;

import java.util.List;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Review;

public interface ReviewService {

	List<Review> reviewList(Paging paging);

	void reviewAdd(Review reviewAdd) throws Exception;

	Review update(int number);

	void reviewUp(Review reviewUp) throws Exception;

	void delete(int number) throws Exception;

	void ref(int number);

	void like(int number);

}
