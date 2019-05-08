package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	String pos(Model model,Paging paging) {
		List<Pos> list = posservice.getList(paging);
		
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		
		return path + "posmanagement";
	}
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	int delete(int pNumber) {
		return posservice.pDelete(pNumber);
	}
	@RequestMapping(value="/add")
	String add() {
		return path + "add";
	}
	@RequestMapping(value="/add", method=RequestMethod.POST)
	String add(Pos item) {
		posservice.add(item);
		return "redirect:posmanagement";
		
	}
	@RequestMapping(value="/update",method = RequestMethod.GET)
	String update(int pNumber,Model model) {
		Pos item = posservice.positem(pNumber);
		model.addAttribute("item",item);
		return path + "update";
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	String update(Pos item) {
		posservice.update(item);
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
	@RequestMapping(value="/orders",method=RequestMethod.POST)
	String orders(Orders order) {
		posservice.orders(order);
		return "redirect:posmanagement";
	}
	
	
	/*
	 * @RequestMapping(value = "chicken") String chicken(Model model, Paging paging)
	 * { List<Pos> list = posservice.chicken(paging);
	 * 
	 * model.addAttribute("list", list); model.addAttribute("paging",paging);
	 * 
	 * return path + "posmanagement"; }
	 * 
	 * @RequestMapping(value = "burger") String burger(Model model,Paging paging) {
	 * List<Pos> list = posservice.burger(paging);
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * return path + "posmanagement"; }
	 * 
	 * @RequestMapping(value = "side") String side(Model model,Paging paging) {
	 * List<Pos> list = posservice.side(paging);
	 * 
	 * model.addAttribute("list", list); return path + "posmanagement"; }
	 * 
	 * @RequestMapping(value = "drink") String drink(Model model,Paging paging) {
	 * List<Pos> list = posservice.drink(paging);
	 * 
	 * model.addAttribute("list", list); return path + "posmanagement"; }
	 */

}
