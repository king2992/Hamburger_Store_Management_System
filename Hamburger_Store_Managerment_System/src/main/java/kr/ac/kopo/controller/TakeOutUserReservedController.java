package kr.ac.kopo.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.PayInfo;
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.setSideDrink;
import kr.ac.kopo.service.TakeOutUserReservedService;

@Controller
@RequestMapping(value="/takeOutReservation")
public class TakeOutUserReservedController {
	@Autowired
	TakeOutUserReservedService service;
	@RequestMapping("/takeOutUserReservation")
	String seatAppointment( Model model,String places, HttpSession session) {
		session.setAttribute("places", places);
		session.removeAttribute("failed");
		List<Menu> chickenList = service.chickenList();
		List<Menu> burger = service.burgerList();
		List<Menu> side = service.sideList();
		List<Menu> drink = service.drinkList();
		List<setSideDrink> setSide = service.setSideList();
		List<setSideDrink> setDrink = service.setDrinkList();
		
		model.addAttribute("chicken", chickenList);
		model.addAttribute("burger", burger);
		model.addAttribute("side", side);
		model.addAttribute("drink", drink);
		model.addAttribute("setSide", setSide);
		model.addAttribute("setDrink", setDrink);
		return "/takeOutReservation/takeOutUserReservation";
	}
	
	@ResponseBody
	@RequestMapping(value="/takeOutReservedListInsert", method= {RequestMethod.GET,RequestMethod.POST})
	int takeOutReservedListInsert(TakeOutReserved takeoutreserved, HttpSession session) {
		String places = (String)session.getAttribute("places");
		service.takeOutReservedListInsert(takeoutreserved);
		session.removeAttribute(places);
				
		return 1;
	}
	@ResponseBody
	@RequestMapping(value = "/takeOutReservedMenuInsert",method= {RequestMethod.GET,RequestMethod.POST})
	int takeOutReservedMenuInsert(@RequestParam(value="cntArray[]") String cntArray[],
			@RequestParam(value="menuNameArray[]") String menuNameArray[], HttpSession session ) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			for(int i = 0; i < cntArray.length; i++) {
				map.put("menuName", menuNameArray[i]);
				map.put("menuCnt", cntArray[i]);
				service.takeOutReservedMenuInsert(map);
			}
			String places = (String)session.getAttribute("places");
			session.removeAttribute(places);
			
		return 1;
	}
	@RequestMapping(value="/menuAdd",method= {RequestMethod.GET,RequestMethod.POST})
	String menuAdd(Menu menuadd) {
		String fileName = menuadd.getFile().getOriginalFilename();
		String path = "C://upload/";
		String dataId = menuadd.getMenuName();
		try {
			menuadd.getFile().transferTo(new File(path + fileName));
			menuadd.setMenuImg(fileName);
			menuadd.setDataId(dataId);
		} catch(Exception e) {
			e.printStackTrace();
		}
		service.menuAdd(menuadd);
		return "redirect:/takeOutReservation/takeOutUserReservation";
	}
	@ResponseBody
	@RequestMapping(value="/menuListDel",method= {RequestMethod.GET, RequestMethod.POST} )
	int menuListDel(@RequestParam(value="menuId") int menuId) {
			service.menuListDel(menuId);
		return 1;
	}
	@RequestMapping(value="ticketingSuccess")
	String ticketingSuccess(){
		return "/takeOutReservation/ticketingSuccess";
	}
	//���� ����� ī�� ���� �ҷ�����
	@ResponseBody
	@RequestMapping(value="/myCardLoad",method= {RequestMethod.GET, RequestMethod.POST})
	Object myCardLoad (HttpSession session) {
		String userId = (String) session.getAttribute("user");
		
		PayInfo payinfo = service.myCardLoad(userId);
		
		return payinfo;
	}
	//ī����� ��й�ȣ üũ
	@ResponseBody
	@RequestMapping(value="/cardPay", method= {RequestMethod.GET, RequestMethod.POST})
	int cardPay(@RequestParam(value="bankName") String bankName, @RequestParam(value="cardNum") String cardNum,
			@RequestParam(value="cardPw") String cardPw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bankName", bankName);
		map.put("cardNum", cardNum);
		map.put("cardPw", cardPw);
		
		PayInfo payinfo = service.cardPay(map);
		if(payinfo == null) {
			return 0;
		}
		return 1;	
	}
	//ī����� �����Է� ��й�ȣ üũ
		@ResponseBody
		@RequestMapping(value="/cardInputPay", method= {RequestMethod.GET, RequestMethod.POST})
		int cardInputPay(@RequestParam(value="bankName") String bankName, @RequestParam(value="cardNum") String cardNum,
				@RequestParam(value="cardPw") String cardPw,@RequestParam(value="validityMonth") String validityMonth,
				@RequestParam(value="validityYears") String validityYears,@RequestParam(value="securityCode") int securityCode) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("bankName", bankName);
			map.put("cardPw", cardPw);
			map.put("cardNum", cardNum);
			map.put("validity", validityMonth + "/"+ validityYears);
			map.put("securityCode", securityCode);
			
			
			PayInfo payinfo = service.cardInputPay(map);
			if(payinfo == null) {
				return 0;
			}
			return 1;	
		}
	
}
