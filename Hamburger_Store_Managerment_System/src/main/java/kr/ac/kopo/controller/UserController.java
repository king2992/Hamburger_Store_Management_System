package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.User;
import kr.ac.kopo.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	UserService service;
	//ȸ������
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
		
	  @RequestMapping(value="/signIn", method=RequestMethod.POST) 
	  String userLogin(HttpSession session, User user) { 
	  if (service.login(user)) {
	  session.setAttribute("user", user.getUserId());
	  return "redirect:../"; 
	   } 
	   else
	  {
	  }
	  return "redirect:../";
	   }
	 
	
	@RequestMapping("/userLogout")
	String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:../";
	}
}
