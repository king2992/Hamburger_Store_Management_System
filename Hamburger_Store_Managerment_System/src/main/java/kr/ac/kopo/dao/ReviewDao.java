package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Review;
  
public interface ReviewDao {

	List<Review> reviewList(Paging paging);

	void reviewAdd(Review reviewAdd);

	Review update(int number);

	void reviewUp(Review reviewUp);

	void delete(int groupNum);

	void ref(int number);

	void like(int number);

	int total(Paging paging);

	void replyUpdate(Review review);

	void reply(Review review);

}
