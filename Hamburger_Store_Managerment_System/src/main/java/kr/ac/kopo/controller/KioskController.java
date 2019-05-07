package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/kiosk")
public class KioskController {

	@RequestMapping("/screen")
	String screen()	{
		return "kiosk"
				+ "/screen";
	}
}
