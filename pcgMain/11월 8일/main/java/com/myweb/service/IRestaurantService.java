package com.myweb.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myweb.dto.RestaurantDTO;
import com.myweb.dto.TestDTO;

public interface IRestaurantService {

	List<RestaurantDTO> getRestaurantList();
	List<RestaurantDTO> getResNameList();
	

}
