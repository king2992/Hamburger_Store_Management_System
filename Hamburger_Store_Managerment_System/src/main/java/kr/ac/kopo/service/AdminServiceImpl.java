package kr.ac.kopo.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.dao.AdminDao;
import kr.ac.kopo.model.Admin;
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
				// mail �ۼ� ���� 
				MailUtils sendMail = new MailUtils(mailSender);

				sendMail.setSubject("[M-SA] ȸ������ �̸��� ����");
				sendMail.setText(new StringBuffer().append("<h1>[�̸��� ����]</h1>")
						.append("<p>������ �ڵ带 �Է��ϼ��� : " + authkey + "</p>")
						.toString());
//				sendMail.setFrom("������","dlwlsdn0801@gmail.com");
				sendMail.setTo(admin.getAdminEmail());
				sendMail.send();
				
				
	}
	@Override
	public void joinConfirm(String authkey) {
		dao.joinConfirm(authkey);
	}
	@Override
	public String adminLogin(Map<String, Object> map) {
		return dao.adminLogin(map);
	}
	
	
}
