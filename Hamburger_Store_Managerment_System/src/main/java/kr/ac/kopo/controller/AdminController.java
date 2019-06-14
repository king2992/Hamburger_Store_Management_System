package kr.ac.kopo.controller;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.Admin;
import kr.ac.kopo.service.AdminService;
import kr.ac.kopo.util.MailUtils;

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
	//관리자 회원가입
	@RequestMapping(value="adminSignUp", method=RequestMethod.POST)
	String adminSignUp(@ModelAttribute("Admin") Admin admin)throws Exception{
		String adminPhoneFirst = admin.getAdminPhoneFirst();//이메일
		String adminPhoneCenter = admin.getAdminPhoneCenter();
		String adminPhoneLast = admin.getAdminPhoneLast();
		
		String adminEmailFirst = admin.getAdminEmailFirst();//전화번호
		String adminEmailLast = admin.getAdminEmailLast();
		admin.setAdminPhone(adminPhoneFirst + "-" + adminPhoneCenter + "-" + adminPhoneLast );
		admin.setAdminEmail(adminEmailFirst + "@" + adminEmailLast );
		String userPassword = admin.getAdminPassword();
		
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(userPassword.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();
			for(int i=0; i<hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length()==1) hexString.append('0');
				hexString.append(hex);
			}
			admin.setAdminPassword(hexString.toString());
			service.adminSignUp(admin);
		}catch(Exception ex) {
			throw new RuntimeException(ex);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/joinConfirm", method=RequestMethod.GET)
	String joinConfirm() {
		return "/user/joinConfirm";
	}
	//이메일 인증 했을때
	@RequestMapping(value="authSuccess", method=RequestMethod.POST)
	String joinConfirm(String authkey) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("authkey", authkey);
		System.out.println(map);
		service.joinConfirm(map);
		return "redirect:/admin/myPage";
	}
	//관리자 로그인 페이지
	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)
	String adminLogin() {
		return "/admin/adminLogin";
	}
	//관리자 로그인
	@ResponseBody
	@RequestMapping(value="/adminLogin", method= RequestMethod.POST)
	String adminLogin(@RequestParam(value="adminId", required=false)  String adminId ,
			@RequestParam(value="adminPassword", required=false)  String adminPassword,
			HttpSession session) {
		
			Map<String,Object> map = new HashMap<String,Object>();
				
				map.put("adminId", adminId);
				
				try {
					MessageDigest digest = MessageDigest.getInstance("SHA-256");
					byte[] hash = digest.digest(adminPassword.getBytes("UTF-8"));
					StringBuffer hexString = new StringBuffer();
					for(int i=0; i<hash.length; i++) {
						String hex = Integer.toHexString(0xff & hash[i]);
						if(hex.length()==1) hexString.append('0');
						hexString.append(hex);
					}
					map.put("adminPassword",hexString.toString() );
					
				}catch(Exception ex) {
					throw new RuntimeException(ex);
				}
				String authstatus = service.adminLogin(map);	
				String n = "n_auth";
				String y = "y_auth";
				
				if(n.equals(authstatus)) {
					session.setAttribute("admin", adminId);
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
	String myPage(HttpSession session, Model model) {
		String adminId = (String)session.getAttribute("admin");
		Admin admin = service.adminMyPage(adminId);
		model.addAttribute("admin", admin);
		return "/admin/myPage";
	}
	@RequestMapping(value="/afterEmailAuth", method=RequestMethod.GET)
	String afterEmailAuth(Admin admin, HttpSession session) throws Exception {
		admin.setAdminId((String)session.getAttribute("admin"));
		service.adminEmail(admin);
		
		return "/admin/afterEmailAuth";
	}
//	@RequestMapping("/emailConfirm")
//	String emailConfirm(HttpSession session) {
//		String adminId = (String)session.getAttribute("admin");
//		String adminEmail = service.adminEmailSelect(adminId);
//		
//		return "/admin/emailConfirm";
//	}
}
