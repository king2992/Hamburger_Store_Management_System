package kr.ac.kopo.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.service.TakeOutUserReservedService;

@Controller
@RequestMapping(value="/takeOutReservation")
public class TakeOutUserReservedController {
	@Autowired
	TakeOutUserReservedService service;
	@RequestMapping("/takeOutUserReservation")
	String seatAppointment() {
		
		return "/takeOutReservation/takeOutUserReservation";
	}
	
	@ResponseBody
	@RequestMapping(value="/takeOutReservedListInsert", method= {RequestMethod.GET,RequestMethod.POST})
	int takeOutReservedListInsert(TakeOutReserved takeoutreserved) {
	
		service.takeOutReservedListInsert(takeoutreserved);
				
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value = "/takeOutReservedMenuInsert",method= {RequestMethod.GET,RequestMethod.POST})
	int takeOutReservedMenuInsert(@RequestParam(value="cntArray[]") String cntArray[],
			@RequestParam(value="menuNameArray[]") String menuNameArray[] ) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			for(int i = 0; i < cntArray.length; i++) {
				map.put("menuName", menuNameArray[i]);
				map.put("menuCnt", cntArray[i]);
				service.takeOutReservedMenuInsert(map);
			}
			
		return 1;
	}

	@RequestMapping(value="ticketingSuccess")
	String ticketingSuccess(){
		return "/takeOutReservation/ticketingSuccess";
	}
	
}
