package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/store")
public class storeController {
	@RequestMapping(value="/storeFind", method=RequestMethod.GET)
	String storeFind() {
		return "/store/storeFind";
	}
}
