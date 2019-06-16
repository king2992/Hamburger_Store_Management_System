package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.dao.AdminDao;
import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.BusinessNumCheck;
import kr.ac.kopo.util.MailUtils;
import kr.ac.kopo.util.TempKey;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao dao;
	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public Admin adminIdCk(Map<String, Object> map) {
		return dao.adminIdCk(map); 
	}
	@Override
	public void adminSignUp(Admin admin) throws Exception{
				
				// ������ authkey ����
				String authkey = new TempKey().getKey(50, false);

				admin.setAuthkey(authkey);
				dao.adminSignUp(admin);
				
	}
	@Override
	public String adminLogin(Map<String, Object> map) {
		return dao.adminLogin(map);
	}
	@Override
	public Admin adminMyPage(String adminId) {
		return dao.adminMyPage(adminId);
	}
	@Override
	public void adminEmail(Admin admin) throws Exception {
		String authkey = new TempKey().getKey(50, false);
		String adminId = admin.getAdminId();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("authkey",authkey);
		map.put("adminId",adminId);
		
		dao.authKeyUpdate(map);
		
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[M-SA] ȸ������ �̸��� ����");
		sendMail.setText(new StringBuffer().append("<h1>[�̸��� ����]</h1>")
				.append("<p>������ �ڵ带 �Է��ϼ��� : " + authkey + "</p>")
				.toString());
		sendMail.setTo(admin.getAdminEmail());
		sendMail.send();
		
	}
	@Override
	public void joinConfirm(Map<String, Object> map) {
		dao.joinConfirm(map);
	}
	@Override
	public BusinessNumCheck businessAuth(String businessNum) {
		return dao.businessAuth(businessNum);
	}
	@Override
	public void businessAuthInsert(Map<String, Object> businessNumMap) {
		dao.businessAuthInsert(businessNumMap);
	}
	@Override
	public void businessAuthStatusUpdate(Map<String, Object> businessStatusMap) {
		dao.businessAuthStatusUpdate(businessStatusMap);
	}
	@Override
	public Admin authConfirm(String adminId) {
		return dao.authConfirm(adminId);
	}
	
	
	
	
}
