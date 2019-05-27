package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/kiosk")
public class KioskController {

	@RequestMapping("/screen")
	String screen(HttpSession session)	{
		session.removeAttribute("failed");
		return "kiosk/screen";
	}
}
