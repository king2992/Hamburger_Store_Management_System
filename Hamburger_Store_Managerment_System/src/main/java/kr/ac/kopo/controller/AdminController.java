package kr.ac.kopo.controller;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.BusinessNumCheck;
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
	@ResponseBody // ������ ���̵� �ߺ� üũ
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
	//������ ȸ������
	@RequestMapping(value="adminSignUp", method=RequestMethod.POST)
	String adminSignUp(@ModelAttribute("Admin") Admin admin)throws Exception{
		String adminPhoneFirst = admin.getAdminPhoneFirst();//�̸���
		String adminPhoneCenter = admin.getAdminPhoneCenter();
		String adminPhoneLast = admin.getAdminPhoneLast();
		
		String adminEmailFirst = admin.getAdminEmailFirst();//��ȭ��ȣ
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
	//�̸��� ���� ������
	@RequestMapping(value="authSuccess", method=RequestMethod.POST)
	String joinConfirm(String authkey) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("authkey", authkey);
		System.out.println(map);
		service.joinConfirm(map);
		return "redirect:/admin/myPage";
	}
	//������ �α��� ������
	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)
	String adminLogin() {
		return "/admin/adminLogin";
	}
	//������ �α���
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
		String businessNum1 = admin.getBusinessNum();
		String businessNum2 = businessNum1.substring(0,3);
		
		String businessNum3 = admin.getBusinessNum();
		String businessNum4 = businessNum3.substring(3,8);
		
		String businessNum5 = admin.getBusinessNum();
		String businessNum6 = businessNum5.substring(8,15);
	
		model.addAttribute("businessNum2", businessNum2);
		model.addAttribute("businessNum4", businessNum4);
		model.addAttribute("businessNum6", businessNum6);
		
		return "/admin/myPage";
	}
	@RequestMapping(value="/afterEmailAuth", method=RequestMethod.GET)
	String afterEmailAuth(Admin admin, HttpSession session) throws Exception {
		admin.setAdminId((String)session.getAttribute("admin"));
		service.adminEmail(admin);
		
		return "/admin/afterEmailAuth";
	}
	@Transactional
	@ResponseBody
	@RequestMapping("/businessAuth")
	int businessAuth(Admin admin, HttpSession session) {
		String firstBuNum = admin.getFirstBuNum();
		String centerBuNum = admin.getCenterBuNum();
		String lastBuNum = admin.getLastBuNum();
		String businessNum = firstBuNum+centerBuNum+lastBuNum;
		BusinessNumCheck check = service.businessAuth(businessNum);
		if(check == null) {
			return 0;
		}else {
			Map<String, Object> businessNumMap = new HashMap<String,Object>();
			Map<String, Object> businessStatusMap = new HashMap<String,Object>();
			
			businessNumMap.put("businessNum", businessNum);
			businessNumMap.put("adminId", (String)session.getAttribute("admin"));
			businessStatusMap.put("adminId", (String)session.getAttribute("admin"));
			
			service.businessAuthInsert(businessNumMap);
			service.businessAuthStatusUpdate(businessStatusMap);
			return 1;
		}
	}
	@ResponseBody
	@RequestMapping("/authConfirm")
	Object authConfirm(String adminId) {
		System.out.println(adminId);
		Admin admin = service.authConfirm(adminId);
		return admin;
	}
}
