package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/store")
public class storeController {
	@RequestMapping(value="/storeFind", method=RequestMethod.GET)
	String storeFind(HttpSession session) {
		session.removeAttribute("failed");
		return "/store/storeFind";
	}
}
