package com.myweb.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myweb.dto.TestDTO;

@Service
public interface ITestService {

	List<TestDTO> getTestList();
	

}
