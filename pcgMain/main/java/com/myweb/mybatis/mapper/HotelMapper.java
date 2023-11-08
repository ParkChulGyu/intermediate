package com.myweb.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.dto.HotelDTO;

@Mapper
public interface HotelMapper {

	public List<HotelDTO> getHotelList();	
	public List<HotelDTO> getHotelNmaeList();	
	
	

}
