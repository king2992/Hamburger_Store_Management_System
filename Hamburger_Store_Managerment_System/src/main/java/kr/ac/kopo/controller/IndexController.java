package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping(value="/")
	String Index(HttpSession session) {
		String places = (String)session.getAttribute("places");
		
		session.removeAttribute(places);
		
		return "index";
	}

}
