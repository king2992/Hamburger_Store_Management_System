package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.model.Seat;
import kr.ac.kopo.model.Ticketing;
import kr.ac.kopo.model.reservedTime;

public interface TicketingService {

	int ticketingAdd(HashMap<String, Object> map);

	List<Ticketing> ticketingSuccessCheck(String id);

	void ticketDelete(String time1);

	List<Ticketing> reservedTimeList();

	List<Seat> seatList();

	int reservationTime(HashMap<String, Object> map);

	List<reservedTime> reservationTimeList();

	List<reservedTime> timeKey(String timeKey);



	

}
