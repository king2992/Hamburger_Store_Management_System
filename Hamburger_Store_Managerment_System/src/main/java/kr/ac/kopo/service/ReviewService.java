package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.model.Like;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Review;

public interface ReviewService {
   
	List<Review> reviewList(Paging paging);

	void reviewAdd(Review reviewAdd) throws Exception;

	Review update(int number);

	void reviewUp(Review reviewUp) throws Exception;

	void delete(int number) throws Exception;

	void ref(int number);
 
	void likeCnt(int number);

	void reply(Review review);

	void likeAdd(Map<String, Object> map);

	Like likeFunc(Map<String, Object> map);

	void likeDel(Map<String, Object> map);

	void likeRun(Map<String, Object> map);

}
