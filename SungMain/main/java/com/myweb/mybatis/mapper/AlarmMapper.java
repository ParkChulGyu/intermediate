package com.myweb.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.dto.AlarmDTO;
import com.myweb.dto.QnaDTO;

@Mapper
public interface AlarmMapper {	
	

	public QnaDTO getQnaOne(int idx)  throws Exception;


	public void insertAlram(AlarmDTO dto) throws Exception;
	
	
	public List<AlarmDTO> alramList(String toid);
	
	public void alarmRemove(int idx) throws Exception;
	
	
	public QnaDTO alarmClick(QnaDTO Qna) throws Exception;
	
	
	
	public int checkcount(String toid) throws Exception;
			
			
			
}
