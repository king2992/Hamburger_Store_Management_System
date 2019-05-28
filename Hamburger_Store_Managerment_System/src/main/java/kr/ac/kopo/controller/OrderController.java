package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.dao.orderDao;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.TakeOutReserved;

@Controller
@RequestMapping("/order")
public class OrderController {
@Autowired
orderDao dao;
	@RequestMapping(value="/orderDisplay", method = RequestMethod.GET)
	String orderDisplay(HttpSession session , Model model ) {
		session.removeAttribute("failed");
		List<Orders> list = dao.orderDisplay();
		model.addAttribute("list", list);
		
		List<Orders> successList = dao.orderDisplaySuccess();
		model.addAttribute("successList", successList);
		
		return "/order/orderDisplay";
	}
	@RequestMapping(value="/Page", method=RequestMethod.GET)
	String Page() {
		return "/order/Page";
	}
	@ResponseBody
	@RequestMapping("/orderDisplayOk")
	int orderDisplayOk(@RequestParam(value="orderId") int orderId) {
		dao.orderDisplayOk(orderId);
		return 1;
	}
}
