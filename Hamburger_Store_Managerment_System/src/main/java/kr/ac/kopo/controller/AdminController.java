package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.Admin;
import kr.ac.kopo.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService service;
	@RequestMapping("/adminAdd")
	String adminAdd() {
		return "/admin/adminAdd";
	}
	@ResponseBody // 관리자 아이디 중복 체크
	@RequestMapping("/adminIdCk")
	int adminIdCk(@RequestParam(value="adminId") String adminId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("adminId", adminId);
		Admin admin = service.adminIdCk(map);
		
		if(admin == null) {
			return 0;
		}
		
		return 1 ;
	}
	@RequestMapping(value="adminSignUp", method=RequestMethod.POST)
	String adminSignUp(@ModelAttribute("Admin") Admin admin)throws Exception{
		String adminPhoneFirst = admin.getAdminPhoneFirst();//이메일
		String adminPhoneCenter = admin.getAdminPhoneCenter();
		String adminPhoneLast = admin.getAdminPhoneLast();
		
		String adminEmailFirst = admin.getAdminEmailFirst();//전화번호
		String adminEmailLast = admin.getAdminEmailLast();
		admin.setAdminPhone(adminPhoneFirst + "-" + adminPhoneCenter + "-" + adminPhoneLast );
		admin.setAdminEmail(adminEmailFirst + "@" + adminEmailLast );
		
		service.adminSignUp(admin);
		
		return "/user/joinConfirm";
	}
	@RequestMapping(value="/joinConfirm", method=RequestMethod.GET)
	String joinConfirm() {
		return "/user/joinConfirm";
	}
	@ResponseBody
	@RequestMapping(value="authSuccess", method=RequestMethod.POST)
	String joinConfirm(String authkey) {
		service.joinConfirm(authkey);
		return "인증 되었습니다.";
	}
	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)
	String adminLogin() {
		return "/admin/adminLogin";
	}
	@ResponseBody
	@RequestMapping(value="/adminLogin", method= RequestMethod.POST)
	String adminLogin(@RequestParam(value="adminId", required=false)  String adminId ,
			@RequestParam(value="adminPassword", required=false)  String adminPassword,
			HttpSession session) {
		
			Map<String,Object> map = new HashMap<String,Object>();
				
				map.put("adminId", adminId);
				map.put("adminPassword", adminPassword);
				
			    String authstatus = service.adminLogin(map);	
				String n = "n_auth";
				String y = "y_auth";
				System.out.println(authstatus);
				System.out.println();
				if(n.equals(authstatus)) {
					
					return "auth";
				} 
				if(y.equals(authstatus)) {
					session.setAttribute("admin", adminId);
					return "loginSuccess";
				} else {
					return "noId";
				}
			
			
	}
	@RequestMapping("/adminLogout")
	String adminLogout(HttpSession session) {
		session.removeAttribute("admin");
		return "redirect:/";
	}
	@RequestMapping("/myPage")
	String myPage() {
		return "/admin/myPage";
	}
}
