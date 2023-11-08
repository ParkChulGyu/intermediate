package com.myweb.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.dto.TourDTO;
import com.myweb.mybatis.mapper.TourMapper;
import com.myweb.service.ITourService;

@Service("TourMybatisMapperServiceImpl")
public class TourMybatisMapperServiceImpl implements ITourService{
	
	@Autowired
	TourMapper dao;


	@Override
	public List<TourDTO> getTourList() {
		
		return dao.getTourList();
	}
	@Override
	public List<TourDTO> getTourNameList() {
		
		return dao.getTourNameList();
	}
	@Override
	public int getTourtotalCount(String search) {
		// TODO Auto-generated method stub
		return dao.getTourtotalCount(search);
	}
	@Override
	public List<String> getTourPaging(Map<String, Object> pstr) {
		// TODO Auto-generated method stub
		return dao.getTourPaging(pstr);
	}

}
