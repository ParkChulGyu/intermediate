package com.myweb.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.dto.RestaurantDTO;
import com.myweb.mybatis.mapper.RestaurantMapper;
import com.myweb.service.IRestaurantService;

@Service("RestaurantMybatisMapperServiceImpl")
public class RestaurantMybatisMapperServiceImpl implements IRestaurantService{
	
	@Autowired
	RestaurantMapper dao;


	@Override
	public List<RestaurantDTO> getRestaurantList() {
		
		return dao.getRestaurantList();
	}
	@Override
	public List<RestaurantDTO> getResNameList() {
		
		return dao.getResNameList();
	}

}
