package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/order")
public class OrderController {

	@RequestMapping(value="/orderDisplay", method = RequestMethod.GET)
	String orderDisplay() {
		return "/order/orderDisplay";
	}
	@RequestMapping(value="/Page", method=RequestMethod.GET)
	String Page() {
		return "/order/Page";
	}
}
