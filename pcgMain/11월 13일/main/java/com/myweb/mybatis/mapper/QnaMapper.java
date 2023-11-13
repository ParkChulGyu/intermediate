package com.myweb.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.dto.QnaDTO;

@Mapper
public interface QnaMapper {	
	
	
	public List<QnaDTO> Qna_list();	
	
			
	public void insertFile(QnaDTO dto);
	
	public int read(int idx)  throws Exception;
	
	
	public QnaDTO detail(int idx) throws Exception;
	
	public void delete(int idx) throws Exception;
	
	public void update(QnaDTO dto);
	
	
	
	public void stepupdate(QnaDTO dto);
	
	public void insertQna(QnaDTO dto);

	public void rootupdate();


}
