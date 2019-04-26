package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.TicketingDao;
import kr.ac.kopo.model.Seat;
import kr.ac.kopo.model.Ticketing;
import kr.ac.kopo.model.reservedTime;
@Service
public class TicketingServiceImpl implements TicketingService {
@Autowired
TicketingDao ticketdao;


@Override
public List<Ticketing> ticketingSuccessCheck(String id) {
	return ticketdao.ticketingSuccessCheck(id);
}

@Override
public int ticketingAdd(HashMap<String, Object> map) {
	
	ticketdao.ticketingAdd(map);
	
	return 1;
}

@Override
public void ticketDelete(String time1) { 
	 ticketdao.ticketDelete(time1);
}

@Override
public List<Ticketing> reservedTimeList() {
	return ticketdao.reservedTimeList();
}

@Override
public List<Seat> seatList() {
	return ticketdao.seatList();
}

@Override
public int reservationTime(HashMap<String, Object> map) {
	ticketdao.reservationTime(map);
	return 1;
}

@Override
public List<reservedTime> reservationTimeList() {
	return ticketdao.reservationTimeList();
}

@Override
public List<reservedTime> timeKey(String timeKey) {
	return ticketdao.timeKeyList(timeKey);
}











	

}
