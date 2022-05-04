package com.chaerin.boot4.schedule;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.chaerin.boot4.board.BoardMapper;
import com.chaerin.boot4.board.BoardVO;
import com.chaerin.boot4.util.Pager;

@Component
public class TestSchedult {
	@Autowired
	private BoardMapper boardMapper;
	
	//@Scheduled(fixedRate =1000,initialDelayString="2000")
	public void fixRateSchedule()throws Exception{
		Calendar calendar = Calendar.getInstance();
		System.out.println(calendar.getTime());
		Thread.sleep(2000);
	}
	//@Scheduled(fixedDelay =1000,initialDelayString="2000")
	public void fixDelaySchedule()throws Exception{
		Calendar calendar = Calendar.getInstance();
		System.out.println(calendar.getTime());
		
	}
	//@Scheduled(cron="*/5 * * * * *")
		public void cronSchedule()throws Exception{
			Calendar calendar = Calendar.getInstance();
			System.out.println(calendar.getTime());
			Pager pager=new Pager();
			pager.makeRow();
			
			/*
			 * List<BoardVO> ar=boardMapper.getList(pager);
			 * 
			 * System.out.println(ar);
			 */
		}
	
}
