package kr.ac.kopo.controller;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
		String userPassword = user.getUserPassword();
		String userPhone1 = user.getUserPhone1();
		String userPhone2 = user.getUserPhone2();
		user.setUserPhone("010"+userPhone1 + userPhone2);
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(userPassword.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();
			for(int i=0; i<hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length()==1) hexString.append('0');
				hexString.append(hex);
			}
			user.setUserPassword(hexString.toString());
			service.signUp(user);
		}catch(Exception ex) {
			throw new RuntimeException(ex);
		}
		
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
		
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(userPassword.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();
			
			for(int i=0; i<hash.length;i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length()==1) hexString.append('0');
				hexString.append(hex);
			}
			map.put("userPassword", hexString.toString());
		}catch(Exception ex) {
			throw new RuntimeException(ex);
		}
		map.put("userId", userId);
		
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
	String myPage(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("user");
		User userInfo = service.personalInfomationChange(userId);
		
		String phone1 = userInfo.getUserPhone();
		String phone2 = phone1.substring(3,7);
		
		String phone3 = userInfo.getUserPhone();
		String phone4 = phone3.substring(7);
		
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone4", phone4);
		
		model.addAttribute("user", userInfo);
		
		List<Review> myWrittenList = service.myWritten(userId);
		model.addAttribute("myWrittenList", myWrittenList);
		
		List<TakeOutReserved> takeoutReservedList = service.takeoutReservedList(userId);
		model.addAttribute("takeoutReservedList", takeoutReservedList);
		
		PayInfo card = service.myCard(userId);
		
		model.addAttribute("card", card);
		
		return "/user/myPage";
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
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(nowPw.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();
			for(int i=0; i<hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length()==1) hexString.append('0');
				hexString.append(hex);
			}
			map.put("userPassword", hexString.toString());
		}catch(Exception ex) {
			throw new RuntimeException(ex);
		}
		String userId = (String) session.getAttribute("user");
		
		map.put("userId", userId);
		
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
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(userPassword.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();
			for(int i=0; i<hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length()==1) hexString.append('0');
				hexString.append(hex);
			}
			map.put("userPassword", hexString.toString());
		}catch(Exception ex) {
			throw new RuntimeException(ex);
		}
		
		map.put("userId", userId);
		
		service.userPwUpdate(map);
		return 1; 
	}
	@ResponseBody
	@RequestMapping("/userInfoUpdate")
	int userInfoUpdate(HttpSession session, @RequestParam(value="userPhone1") String userPhone1,
			@RequestParam(value="userPhone2") String userPhone2,
			@RequestParam(value="userName") String userName) {
		String userId = (String) session.getAttribute("user");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("userPhone", "010" + userPhone1 + userPhone2);
		map.put("userName", userName);
		System.out.println(userName);
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
	@RequestMapping("/myWrittenDelete")
	String myWrittenDelete(int number) {
			service.myWrittenDelete(number);
		return "redirect:/user/myPage";
	}
	@ResponseBody
	@RequestMapping("/userWithdrawal")
	int userWithdrawal(HttpSession session, @RequestParam(value="userPassword") String userPassword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String userId = (String)session.getAttribute("user");
		map.put("userId", userId);
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(userPassword.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();
			for(int i=0; i<hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length()==1) hexString.append('0');
				hexString.append(hex);
			}
			map.put("userPassword", hexString.toString());
		}catch(Exception ex) {
			throw new RuntimeException(ex);
		}
		User user = service.userWithdrawal(map);
		if(user == null) {
			return 0;
		}
		return 1;
	}
	@Transactional
	@ResponseBody
	@RequestMapping("/userDelete")
	int userDelete (HttpSession session) {
		String userId = (String)session.getAttribute("user");
		
		service.userDelete(userId);
		service.userBoardDelete(userId);
		service.userCommentDelete(userId);
		service.userTakeoutReservedListDelete(userId);
		service.userPayCardDelete(userId);
		service.likeToDelete(userId);
		session.invalidate();
		
		return 1;
	}
	@ResponseBody
	@RequestMapping("/cardDelete")
	int cardDelete(@RequestParam(value="userId") String userId, HttpSession session) {
		service.cardDelete(userId);
		return 1;
	}
}
