package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/takeOutReservation")
public class TakeOutUserReservedController {

	@RequestMapping("/takeOutUserReservation")
	String seatAppointment() {
		
		return "/takeOutReservation/takeOutUserReservation";
	}
}
