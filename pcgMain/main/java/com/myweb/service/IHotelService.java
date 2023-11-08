package com.myweb.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myweb.dto.HotelDTO;
import com.myweb.dto.TestDTO;

public interface IHotelService {

	List<HotelDTO> getHotelList();
	List<HotelDTO> getHotelNmaeList();
	

}
