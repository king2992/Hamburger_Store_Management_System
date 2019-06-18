package kr.ac.kopo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.service.KioskService;

@Controller
@RequestMapping("/kiosk")
public class KioskController {

	@Autowired
	private KioskService service;
	
	Date date = new Date();
	Date time = new Date();
	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat timeformat = new SimpleDateFormat("a hh:mm:ss");
	
	@RequestMapping("/screen")
	String screen(HttpSession session)	{
		session.removeAttribute("failed");
		return "kiosk/screen";
	}
	
	@ResponseBody
	@RequestMapping(value="/orders",method= {RequestMethod.GET,RequestMethod.POST})
	int orders(@RequestParam(value="payTotal") int payTotal) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("payTotal", payTotal);
		map.put("regDate", dateformat.format(date));

		service.orders(map);
		return 1;
	}
	@ResponseBody
	@RequestMapping(value="/menuAdd", method= {RequestMethod.GET,RequestMethod.POST})
	int menuAdd(@RequestParam(value="menuNameArray[]") String menuNameArray[],
			@RequestParam(value="menuCntArray[]") String menuCntArray[]) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			for(int i = 0; i < menuNameArray.length; i++ ) {
				map.put("menuName", menuNameArray[i]);
				map.put("menuCnt", menuCntArray[i]);
				service.ordersMenuAdd(map);
			}
			
		return 1;
	}
}
