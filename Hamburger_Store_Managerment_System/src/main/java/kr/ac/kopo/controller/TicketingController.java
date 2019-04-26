package kr.ac.kopo.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.logging.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.config.CronTask;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.model.Seat;
import kr.ac.kopo.model.Ticketing;
import kr.ac.kopo.model.reservedTime;
import kr.ac.kopo.service.TicketingService;

@Controller
@RequestMapping("/seatReservation")
public class TicketingController {
	@Autowired
	TicketingService ticketservice;
	
	//Ticketing(예매 유저 테이블 ) 예매 내역 INSERT
	@ResponseBody
	@RequestMapping(value = "/ticketingSuccess", method = { RequestMethod.POST, RequestMethod.GET })
	int ticketingAdd(@RequestParam(value = "userId", required = false) String userId,
			@RequestParam(value = "seatName", required = false) String seatName,
			@RequestParam(value = "ticketPrice", required = false) String ticketPrice,
			@RequestParam(value = "reservedDate", required = false) String reservedDate,
			@RequestParam(value = "finishTime", required = false) String finishTime,
			@RequestParam(value = "reservedTime", required = false) String reservedTime) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("finishTime", finishTime);
		map.put("reservedTime", reservedTime);
		map.put("reservedDate", reservedDate);
		StringTokenizer st = new StringTokenizer(seatName, ",");
		StringTokenizer price = new StringTokenizer(ticketPrice, ",");
		// countTokens() 자른 토큰의 개수
		while (st.hasMoreTokens()) {
			while (price.hasMoreTokens()) {
				String seatNameTokens = st.nextToken();
				String priceTokens = price.nextToken();
				map.put("ticketPrice", priceTokens);
				map.put("seatName", seatNameTokens);
				ticketservice.ticketingAdd(map);
			}

		}
		return 1;
	}
	//예약 관리자용 테이블 INSERT
	@ResponseBody
	@RequestMapping(value = "/reservationTimeInsert", method = { RequestMethod.POST, RequestMethod.GET })
	int reservationTimeInsert(
			@RequestParam(value = "seatName", required = false) String seatName,
			@RequestParam(value = "ticketPrice", required = false) String ticketPrice,
			@RequestParam(value = "reservedDate", required = false) String reservedDate,
			@RequestParam(value = "finishTime", required = false) String finishTime,
			@RequestParam(value = "reservedTime", required = false) String reservedTime,
			@RequestParam(value = "timeKey", required = false) String timeKey) 
	{

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("finishTime", finishTime);
		map.put("reservedTime", reservedTime);
		map.put("reservedDate", reservedDate);
		map.put("timeKey", timeKey);
		StringTokenizer st = new StringTokenizer(seatName, ",");
		StringTokenizer price = new StringTokenizer(ticketPrice, ",");
		// countTokens() 자른 토큰의 개수
		while (st.hasMoreTokens()) {
			while (price.hasMoreTokens()) {
				String seatNameTokens = st.nextToken();
				String priceTokens = price.nextToken();
				map.put("ticketPrice", priceTokens);
				map.put("seatName", seatNameTokens);
				
				ticketservice.reservationTime(map);
			}
		}
		
		return 1;
	}
	//날짜,시간에 맞게 예약되어있는 좌석 표시를 위한 where time_key=#{timeKey} 비교후 예약 돼 있는 좌석 뽑아온다.
	@ResponseBody
	@RequestMapping(value = "/timeKey", method = { RequestMethod.POST, RequestMethod.GET })
	public List<reservedTime> timeKeyList(@RequestParam(value = "timeKey", required = false) String timeKey) {
		
		return ticketservice.timeKey(timeKey);
	}
	//좌석 정보 출력
	  @RequestMapping(value="/seatAppointment") 
	  String seatReservation( Model model) { 
		
		  List<Seat> list = ticketservice.seatList(); 
		  model.addAttribute("list", list);
		 
	  
	  return "/seatReservation/seatAppointment"; }
	 
	
	/* 필요 없는 듯 하다 . 나중에 삭제 예정
	 * @RequestMapping(value = "reservedTime")
	 * 
	 * @ResponseBody public List<Ticketing> reservedTimeList() { return
	 * ticketservice.reservedTimeList(); }
	 */
	//좌석 정보 ajax
	@RequestMapping(value = "seatList", method = RequestMethod.GET)
	@ResponseBody
	public List<Seat> seatAjax() {
		System.out.println();
		return ticketservice.seatList();
	}
	//예매 버튼을 누르면 "결제가 진행 중입니다." - 화면 출력
	@RequestMapping(value = "/ticketingSuccess2")
	String ticketSuccess2() {

		return "/seatReservation/ticketingSuccess2";
	}
	//예매 현황 확인 페이지
	@RequestMapping(value = "/ticketingSuccessCheck", method = RequestMethod.GET)
	String ticketingSuccessCheck(String id, Model model) {

		List<Ticketing> ticketingList = ticketservice.ticketingSuccessCheck(id);
		model.addAttribute("ticketingList", ticketingList);

		return "/seatReservation/ticketingSuccessCheck";
	}

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-ddHH:mm");
	//스케줄러 필요없을 시 삭제 예정
	@Scheduled(cron = "*/10 * * * * *") // 1시간 주기 1000*60*60 (1000 = 1초)
	public void doSomething() {

		Date time = new Date();
		String time1 = format.format(time);

		ticketservice.ticketDelete(time1);
	}

}
