package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.Like;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Review;
import kr.ac.kopo.service.FileService;
import kr.ac.kopo.service.ReviewService;
   
@Controller
@RequestMapping("/review")
public class ReviewController {

	final String uploadpath = "c://upload/";

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private FileService fileService;
	
	//	게시판 목록
	@RequestMapping("/reviewList")	
	String reviewList(Model model, Paging paging) {	

		List<Review> reviewList = reviewService.reviewList(paging);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("paging", paging);
		
		System.out.println(reviewList.toString());
		return "review/reviewList";
	}
	

// 글 등록
	@RequestMapping("/reviewAdd")	
	String reviewAdd() {		
		return "review/reviewAdd";
	}
	
	@RequestMapping(value="/reviewAdd", method=RequestMethod.POST)	
	String reviewAdd(Review reviewAdd, HttpSession session) throws Exception{	
		reviewAdd.setUserId((String)session.getAttribute("user"));
			reviewService.reviewAdd(reviewAdd);
			
		return "redirect:reviewList";
	}
	
// 글 수정
	@RequestMapping(value ="/reviewUp")
	String reviewUp(int number, Model model){
		
		Review reviewUp = reviewService.update(number);
		model.addAttribute("reviewUp", reviewUp);
		
		return "review/reviewUp";
	}
	
	
	@RequestMapping(value ="/reviewUp", method = RequestMethod.POST)
	String reviewUp(Review reviewUp, HttpSession session) throws Exception{
		
		reviewUp.setUserId((String)session.getAttribute("user"));
		
		reviewService.reviewUp(reviewUp);
		return "redirect:reviewList";
	}
	
// 글 삭제
	@RequestMapping("/delete") 
	String delete(int number) throws Exception {
		
		reviewService.delete(number);

		return "redirect:reviewList";

	}
// 글 보기	
	@RequestMapping("/view")
	String view(int number, Model model) throws Exception {
		
		reviewService.ref(number);
		
		Review view = reviewService.update(number);
		
		List<String> fileList = fileService.getArticleFiles(number);
		model.addAttribute("fileList",fileList);
		model.addAttribute("view", view);
		
		return "review/view";
	}
	
// 글 추천
	@ResponseBody
	@RequestMapping("/likeCnt")
	int likeCnt(@RequestParam int number, Review review) {
		reviewService.likeCnt(number);
		return 1;
	}
	@ResponseBody
	@RequestMapping(value="/likeAdd")
	int like(@RequestParam("number") int number,HttpSession session) {
	    String userId = (String)session.getAttribute("user");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("number",number); 
		map.put("userId", userId);
		reviewService.likeAdd(map);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value="/likeFunc" ,method= {RequestMethod.GET,RequestMethod.POST})
	Object likeFunc(@RequestParam (value="number") int number, HttpSession session) {
		String userId = (String)session.getAttribute("user");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("number",number);
		map.put("userId",userId);
		Like like = reviewService.likeFunc(map);
		return like;
	}
	@ResponseBody
	@RequestMapping(value="/likeDel", method= {RequestMethod.GET,RequestMethod.POST})
	int likeDel(@RequestParam (value="number")int number, HttpSession session) {
		Map<String,Object> map = new HashMap<String,Object>();
		String userId = (String)session.getAttribute("user");
		map.put("number",number);
		map.put("userId",userId);
		reviewService.likeDel(map);
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="/likeRun", method= {RequestMethod.GET,RequestMethod.POST})
	int likeRun(@RequestParam int number, HttpSession session) {
		Map<String,Object> map = new HashMap<String,Object>();
		String userId = (String)session.getAttribute("user");
		map.put("number",number);
		map.put("userId",userId);
		reviewService.likeRun(map);
		return 1;
		
	}
// 계층형 답글	
	@RequestMapping("/reply")
		String reply(Review review, Model model) {
		
		System.out.println(">>>>>>>>>>>>>>>" + review);
		
		model.addAttribute("reply",review);
		
		return "review/reply";
	}
	
	@RequestMapping(value ="/reply", method = RequestMethod.POST)
	
	String reply(Review review, HttpSession session) {
		
		review.setUserId((String)session.getAttribute("user"));
		
		reviewService.reply(review);
		return "redirect:reviewList";
	}
	
}