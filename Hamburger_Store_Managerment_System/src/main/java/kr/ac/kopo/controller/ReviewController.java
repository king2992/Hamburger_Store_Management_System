package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	//	후기게시판 목록
	@RequestMapping("/reviewList")	
	String reviewList(Model model, Paging paging) {		
		List<Review> reviewList = reviewService.reviewList(paging);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("paging", paging);
		
		System.out.println(reviewList.toString());
		return "review/reviewList";
	}
	

	// 글쓰기
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
	
//수정
	@RequestMapping(value ="/reviewUp")
	String reviewUp(int number, Model model) throws Exception {
		
		Review reviewUp = reviewService.update(number);
		
		List<String> fileList = fileService.getArticleFiles(number);
		model.addAttribute("fileList",fileList);
		
		model.addAttribute("reviewUp", reviewUp);
		
		return "review/reviewUp";
	}
	
	
	@RequestMapping(value ="/reviewUp", method = RequestMethod.POST)
	String reviewUp(Review reviewUp, HttpSession session) throws Exception{
		
		reviewUp.setUserId((String)session.getAttribute("user"));
		
		reviewService.reviewUp(reviewUp);
		return "redirect:reviewList";
	}
//삭제
	@RequestMapping("/delete") 
	String delete(int number) throws Exception {
		
		reviewService.delete(number);

		return "redirect:reviewList";

	}
//뷰	
	@RequestMapping("/view")
	String view(int number, Model model) throws Exception {
		
		reviewService.ref(number);

		Review view = reviewService.update(number);
		List<String> fileList = fileService.getArticleFiles(number);
		model.addAttribute("fileList",fileList);
		
		model.addAttribute("view", view);
		
		return "review/view";
	}
	
//좋아요
	@RequestMapping("/like")
	
	String like(int number, Review review) {
		
		reviewService.like(number);
		
		return "redirect:/review/view?number=" + review.getNumber();
	}
	
//계층형 답글	
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