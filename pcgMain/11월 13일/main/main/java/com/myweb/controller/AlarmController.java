package com.myweb.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.dto.AlarmDTO;
import com.myweb.dto.QnaDTO;
import com.myweb.dto.ReplyDTO;
import com.myweb.service.AlarmService;



@Controller
@RequestMapping("alarm")
public class AlarmController{
	
	String view;
	
	@Autowired
	@Qualifier("AlarmServiceImpl")
	AlarmService service;
	
	
	
	
	
	@RequestMapping("insertAlram")
	public void insertAlram(HttpSession session, int idx, int root) throws Exception {
		
		int alram = 1;
		QnaDTO Qna = new QnaDTO();
		
		Qna = service.getQnaOne(idx);
		String category = "Qna";
		System.out.println(Qna);
		String fromid  = (String) session.getAttribute("nickname");
		AlarmDTO dto = new AlarmDTO();
		dto.setToid(Qna.getWriter());
		dto.setBidx(Qna.getIdx());
		dto.setTitle(Qna.getTitle());
		dto.setFromid(fromid);
		dto.setCategory(category);
		dto.setStep(Qna.getStep());
		
		 service.insertAlram(dto);
		
		
	} 
		
	//알람목록
	@ResponseBody
	@RequestMapping("alramList")
	public List<AlarmDTO> alramList(String toid) throws Exception{
						System.out.println("dfdfdf");
		System.out.println("toid 가 왔나? " + toid);
		
		return service.alramList(toid);
	}		
	
	
	//알람목록
	@ResponseBody
	@RequestMapping("checkcount")
	public int checkcount(String toid) throws Exception{
		System.out.println("dfdfdf");
		System.out.println("toid 가 왔나? " + toid);
		
		int checkcount = 0;
		
		checkcount = service.checkcount(toid);
			
					
			
		
		return checkcount;
	}			
		
	//알람목록
	@RequestMapping("alarmRemove")
	public void alarmRemove(int idx) throws Exception{
		
		System.out.println("idx : ::" + idx);
			service.alarmRemove(idx);
	
	
	}			
		
	@ResponseBody
	@RequestMapping("alarmClick")
	public QnaDTO alarmClick(int bidx) throws Exception{
		System.out.println("bidx 가 왔나? " + bidx);
	
		QnaDTO Qna = new QnaDTO();
		Qna.setIdx(bidx);
		Qna = service.getQnaOne(Qna.getIdx());
		//Qna.setStep(Step+1);
		
		System.out.println(Qna);
		Qna = service.alarmClick(Qna);
		
		
		return Qna;
	}			
	
	
	

	
	
	
	

}
