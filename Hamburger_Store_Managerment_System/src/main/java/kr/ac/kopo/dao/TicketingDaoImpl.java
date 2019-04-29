package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Seat;
import kr.ac.kopo.model.Ticketing;
import kr.ac.kopo.model.reservedTime;
@Repository
public class TicketingDaoImpl implements TicketingDao {
@Autowired
SqlSession sql;

@Override
public List<Ticketing> ticketingSuccessCheck(String id) {
	return sql.selectList("ticket.ticketList", id);
}

@Override
public int ticketingAdd(HashMap<String, Object> map) {
	
	sql.insert("ticket.ticketAdd", map);
	
	return 1;
}



@Override
public void ticketDelete(String time1) {
	 sql.delete("ticket.ticketDelete", time1);
}

@Override
public List<Ticketing> reservedTimeList() {
	return sql.selectList("ticket.reservedTimeList");
}

@Override
public List<Seat> seatList() {
	return sql.selectList("ticket.seatList");
}

@Override
public int reservationTime(HashMap<String, Object> map) {
	sql.insert("ticket.reservationTimeList", map);
	return 1;
}

@Override
public List<reservedTime> reservationTimeList() {
	return sql.selectList("ticket.reservationTime");
}

@Override
public List<reservedTime> timeKeyList(String timeKey) {
	return sql.selectList("ticket.timeKeyList", timeKey);
}







}
