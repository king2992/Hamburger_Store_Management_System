package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/about")
public class AboutController {
	@RequestMapping("/aboutUs")
	String aboutUs() {
		return "/about/aboutUs";
	}
}
