package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.MenuInfo;
import kr.ac.kopo.service.MenuIntroduceService;

@Controller
@RequestMapping("/menuIntroduce")
public class MenuIntroduceContorller {
	@Autowired
	MenuIntroduceService service;
	@RequestMapping("/menuList")
	String menuList(Model model) {
		List<Menu> setList = service.setList();
		List<Menu> burgerList = service.burgerList();
		List<Menu> sideList = service.sideList();
		List<Menu> drinkList = service.drinkList();
		
		model.addAttribute("setList", setList);
		model.addAttribute("burgerList", burgerList);
		model.addAttribute("sideList", sideList);
		model.addAttribute("drinkList", drinkList);
		return "/menuIntroduce/menuList";
	}
	@RequestMapping("/menuInfo")
	String menuInfo(int menuId, Model model) {
		MenuInfo menuInfo = service.menuInfo(menuId);
		model.addAttribute("menuInfo", menuInfo);
		return "/menuIntroduce/menuInfo";
	}
}
