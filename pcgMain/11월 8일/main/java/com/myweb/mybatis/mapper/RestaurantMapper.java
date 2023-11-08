package com.myweb.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.dto.RestaurantDTO;

@Mapper
public interface RestaurantMapper {

	public List<RestaurantDTO> getRestaurantList();	
	public List<RestaurantDTO> getResNameList();	
	
	

}
