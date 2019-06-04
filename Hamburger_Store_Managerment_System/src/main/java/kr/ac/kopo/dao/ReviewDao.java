package kr.ac.kopo.dao;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.model.Like;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Review;
  
public interface ReviewDao {
 
	List<Review> reviewList(Paging paging);

	void reviewAdd(Review reviewAdd);

	Review update(int number);

	void reviewUp(Review reviewUp);

	void delete(int groupNum);

	void ref(int number);

	int total(Paging paging);

	void replyUpdate(Review review);

	void reply(Review review);

	void likeAdd(Map<String, Object> map);

	Like likeFunc(Map<String, Object> map);

	void likeDel(Map<String, Object> map);

	void likeRun(Map<String, Object> map);

	void likeCnt(int number);

	void likeMin(Map<String, Object> map);

	void likeAdd2(Map<String, Object> map);

	void likeAdd3(Map<String, Object> map);
 
}
