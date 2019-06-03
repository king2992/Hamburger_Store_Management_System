package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.PayInfo;
import kr.ac.kopo.model.Review;
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.TakeoutReservedMenu;
import kr.ac.kopo.model.User;
import kr.ac.kopo.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	UserService service;
	//È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	String signUp() {
		return "/user/signUp";
	}
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	String signUp(User user) {
		service.signUp(user);
		return "redirect:/";
	}
	@RequestMapping(value="/idCk", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> idCk(@RequestBody String userId)  {
		int count = 0;
		Map<Object,Object> map = new HashMap<Object,Object>();
		count = service.idCk(userId);
		map.put("cnt", count);
		return map;
	}
		
	@ResponseBody
	@RequestMapping(value="signIn",method= {RequestMethod.GET,RequestMethod.POST})
	int signIn(HttpSession session, @RequestParam (value="userId") String userId,@RequestParam (value="userPassword") String userPassword ) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPassword", userPassword);
		User user = service.signIn(map);
		session.setAttribute("user", userId);
		
		if(user == null) {
			return 0;
		}
		
		return 1 ;
	}
	@RequestMapping("/userLogout")
	String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:../";
	}
	@RequestMapping("/myPage")
	String myPage() {
		return "/user/myPage";
	}
	//°³ÀÎÁ¤º¸º¯°æ
	@RequestMapping("/personalInfomationChange")
	String personalInfomationChange(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("user");
		User userInfo = service.personalInfomationChange(userId);
		model.addAttribute("user", userInfo);
		
		return "/user/personalInfomationChange";
	}
	//³»°¡ ÀÛ¼º ÇÑ ±Û
	@RequestMapping("/myWritten")
	String myWritten(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("user");
		List<Review> list = service.myWritten(userId);
		model.addAttribute("list", list);
		return "/user/myWritten";
	}
	//Takeout ¿¹¾à ³»¿ª
	@RequestMapping("/takeoutReservedList")
	String takeoutReservedList(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("user");
		List<TakeOutReserved> list = service.takeoutReservedList(userId);
		model.addAttribute("list", list);
		return "/user/takeoutReservedList";
	}
	@ResponseBody
	@RequestMapping("/reservedCheck")
	Object userReservedCheck(@RequestParam(value="takeoutId") int takeoutId) {
		List<TakeoutReservedMenu> list = service.userReservedCheck(takeoutId);
		
		return list;
	}
	//È¸¿øÅ»Åð
	@RequestMapping("/withdrawal")
	String withdrawal(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("user");
		model.addAttribute("userId", userId);
		return "/user/withdrawal";
	}
	//ºñ¹Ð¹øÈ£º¯°æ : ÇöÀçºñ¹Ð¹øÈ£Ã¼Å©
	@ResponseBody
	@RequestMapping("/nowPwCheck")
	int nowPwCheck(@RequestParam(value="nowPw") String nowPw, HttpSession session) {
		String userId = (String) session.getAttribute("user");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("userId", userId);
		map.put("userPassword", nowPw);
		User user = service.nowPwCheck(map);
		if(user == null) {
			return 0;
		}
		return 1 ;
	}
	@ResponseBody
	@RequestMapping("/userPwUpdate")
	int userPwUpdate(@RequestParam(value="userPassword") String userPassword, HttpSession session) {
		String userId = (String) session.getAttribute("user");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("userPassword", userPassword);
		service.userPwUpdate(map);
		return 1; 
	}
	@ResponseBody
	@RequestMapping("/userInfoUpdate")
	int userInfoUpdate(HttpSession session, @RequestParam(value="userPhone") String userPhone,
			@RequestParam(value="userName") String userName) {
		String userId = (String) session.getAttribute("user");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("userPhone", userPhone);
		map.put("userName", userName);
		
		service.userInfoUpdate(map);
		
		session.invalidate();
		return 1;
	}
	//°áÁ¦Á¤º¸µî·ÏÃ¢ ÆË¾÷
	@RequestMapping("/cardAdd")
	String userCardAdd() {
		return "/user/cardAdd";
	}
	//°áÁ¦Á¤º¸ INSERT
	@ResponseBody
	@RequestMapping("/payInfoAdd")
	int payInfoAdd(@RequestParam(value="bankName") String bankName, @RequestParam(value="cardNum") String cardNum,
			@RequestParam(value="validityMonth") String validityMonth,@RequestParam(value="validityYears") String validityYears,
			@RequestParam(value="securityCode") int securityCode, @RequestParam(value="cardPw") String cardPw, HttpSession session) {
		String userId = (String) session.getAttribute("user");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("bankName", bankName);
		map.put("cardNum", cardNum);
		map.put("validity", validityYears + "/"+ validityMonth);
		map.put("securityCode", securityCode);
		map.put("cardPw", cardPw);
		service.payInfoAdd(map);
		
		return 1;
	}
	@ResponseBody
	@RequestMapping("/cardCheck")
	int cardCheck(@RequestParam(value="bankName") String bankName, @RequestParam(value="cardNum") String cardNum,
			@RequestParam(value="validityMonth") String validityMonth,@RequestParam(value="validityYears") String validityYears,
			@RequestParam(value="securityCode") int securityCode, @RequestParam(value="cardPw") String cardPw, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bankName", bankName);
		map.put("cardNum", cardNum);
		map.put("validity",   validityMonth + "/"+ validityYears);
		map.put("securityCode", securityCode);
		map.put("cardPw", cardPw);
		PayInfo payinfo = service.cardCheck(map);
		if(payinfo == null) {
			return 0;
		}
		return 1;
	}
}
