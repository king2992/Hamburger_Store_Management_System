package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/include")
public class IncludeController {

	@RequestMapping("/header")
	String screen(HttpSession session)	{
		session.removeAttribute("failed");
		return "include/header";
	}
}
