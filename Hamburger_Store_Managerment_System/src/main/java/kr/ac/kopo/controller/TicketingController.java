package kr.ac.kopo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.Seat;
import kr.ac.kopo.model.Ticketing;
import kr.ac.kopo.model.reservedTime;
import kr.ac.kopo.service.TicketingService;

@Controller
@RequestMapping("/seatReservation")
public class TicketingController {
	@Autowired
	TicketingService ticketservice;
	
	//Ticketing(���� ���� ���̺� ) ���� ���� INSERT
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
		// countTokens() �ڸ� ��ū�� ����
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
	//���� �����ڿ� ���̺� INSERT
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
		// countTokens() �ڸ� ��ū�� ����
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
	//��¥,�ð��� �°� ����Ǿ��ִ� �¼� ǥ�ø� ���� where time_key=#{timeKey} ���� ���� �� �ִ� �¼� �̾ƿ´�.
	@ResponseBody
	@RequestMapping(value = "/timeKey", method = { RequestMethod.POST, RequestMethod.GET })
	public List<reservedTime> timeKeyList(@RequestParam(value = "timeKey", required = false) String timeKey) {
		
		return ticketservice.timeKey(timeKey);
	}
	//�¼� ���� ���
	  @RequestMapping(value="/seatAppointment") 
	  String seatReservation( Model model) { 
		
		  List<Seat> list = ticketservice.seatList(); 
		  model.addAttribute("list", list);
		 
	  
	  return "/seatReservation/seatAppointment"; }
	 
	
	/* �ʿ� ���� �� �ϴ� . ���߿� ���� ����
	 * @RequestMapping(value = "reservedTime")
	 * 
	 * @ResponseBody public List<Ticketing> reservedTimeList() { return
	 * ticketservice.reservedTimeList(); }
	 */
	//�¼� ���� ajax
	@RequestMapping(value = "seatList", method = RequestMethod.GET)
	@ResponseBody
	public List<Seat> seatAjax() {
		System.out.println();
		return ticketservice.seatList();
	}
	//���� ��ư�� ������ "������ ���� ���Դϴ�." - ȭ�� ���
	@RequestMapping(value = "/ticketingSuccess2")
	String ticketSuccess2() {

		return "/seatReservation/ticketingSuccess2";
	}
	//���� ��Ȳ Ȯ�� ������
	@RequestMapping(value = "/ticketingSuccessCheck", method = RequestMethod.GET)
	String ticketingSuccessCheck(String id, Model model) {

		List<Ticketing> ticketingList = ticketservice.ticketingSuccessCheck(id);
		model.addAttribute("ticketingList", ticketingList);

		return "/seatReservation/ticketingSuccessCheck";
	}

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-ddHH:mm");
	//�����ٷ� �ʿ���� �� ���� ����
	@Scheduled(cron = "*/10 * * * * *") // 1�ð� �ֱ� 1000*60*60 (1000 = 1��)
	public void doSomething() {

		Date time = new Date();
		String time1 = format.format(time);

		ticketservice.ticketDelete(time1);
	}

}
