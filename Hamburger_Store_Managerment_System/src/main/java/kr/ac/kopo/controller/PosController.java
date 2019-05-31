package kr.ac.kopo.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.TakeOutReserved;
import kr.ac.kopo.model.TakeoutReservedMenu;
import kr.ac.kopo.model.ordersMenuList;
import kr.ac.kopo.model.setSideDrink;
import kr.ac.kopo.service.PosService;

@Controller
@RequestMapping("/pos")
public class PosController {
	final String path = "pos/";

	@Autowired
	PosService posservice;
	
	@RequestMapping(value="/posmanagement")
	String pos(Model model , HttpSession session) {
		session.removeAttribute("failed");
		List<Menu> chicken = posservice.getChickenList();
		List<Menu> burger = posservice.getBurgerList();
		List<Menu> sideMenu = posservice.getSideMenuList();
		List<Menu> drinkMenu = posservice.getDrinkMenuList();
		
		model.addAttribute("chicken",chicken);
		model.addAttribute("burger",burger);
		model.addAttribute("sideMenu",sideMenu);
		model.addAttribute("drinkMenu",drinkMenu);
		
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
	@RequestMapping(value="/setMenuAdd", method=RequestMethod.POST)
	String setMenuAdd(setSideDrink setsidedrink) {
		String setFileName = setsidedrink.getFile().getOriginalFilename();
		String path = "C://upload/";
		String setDataId = setsidedrink.getMenuName();
			try {
				setsidedrink.getFile().transferTo(new File(path + setFileName));
				setsidedrink.setMenuImg(setFileName);
				setsidedrink.setDataId(setDataId);
			} catch(Exception e) {
				e.printStackTrace();
			}
		posservice.setMenuAdd(setsidedrink);
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
	Date date = new Date();
	Date time = new Date();
	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat timeformat = new SimpleDateFormat("a hh:mm:ss");
	
	@ResponseBody
	@RequestMapping(value="/orders",method=RequestMethod.POST)
	int orders(@RequestParam(value="payTotal") int payTotal , @RequestParam(value="regTime") String regTime) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("payTotal", payTotal);
		map.put("regDate", dateformat.format(date));
		map.put("regTime", regTime);

		posservice.orders(map);
		return 1;
	}
	//포스기에서 주문한 내역에 메뉴들을 INSERT
	@ResponseBody
	@RequestMapping(value="/menuAdd", method=RequestMethod.GET)
	int menuAdd(@RequestParam(value="menuNameArray[]") String menuNameArray[],
			@RequestParam(value="menuCntArray[]") String menuCntArray[]) {
		
				
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			for(int i = 0; i < menuNameArray.length; i++ ) {
				map.put("menuName", menuNameArray[i]);
				map.put("menuCnt", menuCntArray[i]);
				posservice.ordersMenuAdd(map);
			}
			
		return 1;
	}
	@RequestMapping(value="/reservedList", method=RequestMethod.GET)
	String reservedList(Model model) {
		
		List<Orders> orders = posservice.reservedList();
		model.addAttribute("orders",orders);
		
		List<TakeOutReserved> takeout = posservice.takeoutReservedList();
		model.addAttribute("takeout", takeout);
		
		return "/pos/reservedList";
	}
	@ResponseBody
	@RequestMapping(value="/reservedListCheck", method=RequestMethod.GET)
	Object reservedListCheck(@RequestParam(value="orderId") int orderId) {
			List<ordersMenuList> ordersmenulist = posservice.reservedListCheck(orderId); 
		return ordersmenulist; 
	}
	@ResponseBody
	@RequestMapping(value="/reservedListStatus", method= {RequestMethod.GET,RequestMethod.POST})
	int reservedListStatus(@RequestParam(value="orderId") int orderId) {
		posservice.reservedListStatus(orderId);
		return 1;
	}
	@ResponseBody
	@RequestMapping(value="takeoutReservedCheck", method = {RequestMethod.GET, RequestMethod.POST})
	Object takeoutReservedCheck(@RequestParam(value="takeoutId") int takeoutId) {
			List<TakeoutReservedMenu> takeoutReservedMenu = posservice.takeoutReservedCheck(takeoutId);
		return takeoutReservedMenu;
	}
	@ResponseBody
	@RequestMapping(value="/takeoutReservedListStatus")
	int takeoutReservedListStatus(@RequestParam(value="takeoutId") int takeoutId) {
			posservice.takeoutReservedListStatus(takeoutId);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value="/dateSort", method=RequestMethod.GET)
	Object dateSort(@RequestParam(value="regDate") String regDate) {
		List<Orders> dateSort = posservice.dateSort(regDate); 
		return dateSort;
	}
	@ResponseBody
	@RequestMapping(value="/takeoutDateSort", method=RequestMethod.GET)
	Object takeoutDateSort(@RequestParam(value="reservedDate") String reservedDate) {
		List<TakeOutReserved> takeoutreserved = posservice.takeoutDateSort(reservedDate); 
		return takeoutreserved;
	}
	@ResponseBody
	@RequestMapping(value="/todaySales", method = {RequestMethod.GET, RequestMethod.POST})
	int todaySales(@RequestParam(value="regDate") String regDate) {
		
		String ordersSales = posservice.ordersSales(regDate);
		String takeoutSales = posservice.takeoutSales(regDate);
		int total = 0;
		if(takeoutSales == null) {
			takeoutSales = "0";
		}
		if(ordersSales == null) {
			ordersSales = "0";
		}
		total = Integer.parseInt(ordersSales) + Integer.parseInt(takeoutSales);

		
		return total;
	}
}
