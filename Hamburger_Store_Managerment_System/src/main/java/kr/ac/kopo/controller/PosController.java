package kr.ac.kopo.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.Paging;
import kr.ac.kopo.model.Pos;
import kr.ac.kopo.service.PosService;

@Controller
@RequestMapping("/pos")
public class PosController {
	final String path = "pos/";
	
	@Autowired
	PosService posservice;
	
	@RequestMapping(value="/posmanagement")
	String pos(Model model) {
		List<Menu> list = posservice.getList();
		
		model.addAttribute("list",list);
		
		return path + "posmanagement";
	}
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	int delete(int menuId) {
		return posservice.pDelete(menuId);
	}
	@RequestMapping(value="/add")
	String add() {
		return path + "add";
	}
	@RequestMapping(value="/add", method=RequestMethod.POST)
	String add(Menu item) {
		String fileName = item.getFile().getOriginalFilename();
		String path = "C://upload/";
		String dataId = item.getMenuName();
			try {
				item.getFile().transferTo(new File(path + fileName));
				item.setMenuImg(fileName);
				item.setDataId(dataId);
			} catch(Exception e) {
				e.printStackTrace();
			}
		posservice.add(item);
		return "redirect:posmanagement";
	}
	@RequestMapping(value = "/OrderManagement", method = RequestMethod.GET)
	String OrderManagement() {
		return path + "OrderManagement";
	}
	@RequestMapping(value = "/ReservationManagement", method = RequestMethod.GET)
	String ReservationManagement() {
		return path + "ReservationManagement";
	}
	@RequestMapping(value="/orders",method=RequestMethod.GET)
	String orders() {
		return path + "orders";
	}
	@ResponseBody
	@RequestMapping(value="/orders",method=RequestMethod.POST)
	int orders(@RequestParam(value="payTotal") int payTotal ) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("payTotal", payTotal);
		posservice.orders(map);
		return 1;
	}
	//포스기에서 주문한 내역에 메뉴들을 INSERT
	@ResponseBody
	@RequestMapping(value="/menuAdd", method=RequestMethod.GET)
	int menuAdd(@RequestParam(value="menuNameArray[]") String menuNameArray[],
			@RequestParam(value="menuCntArray[]") String menuCntArray[]) {
		
				System.out.println("박수진박수쳐~~~~");
				
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			for(int i = 0; i < menuNameArray.length; i++ ) {
				map.put("menuName", menuNameArray[i]);
				map.put("menuCnt", menuCntArray[i]);
				posservice.ordersMenuAdd(map);
			}
			
		return 1;
	}
	
}
