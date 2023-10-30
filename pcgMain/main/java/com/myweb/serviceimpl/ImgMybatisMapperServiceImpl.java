package com.myweb.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.dto.ImgDTO;
import com.myweb.dto.TestDTO;
import com.myweb.mybatis.mapper.ImgMapper;
import com.myweb.mybatis.mapper.TestMapper;
import com.myweb.service.IImgService;
import com.myweb.service.ITestService;

@Service("ImgMybatisMapperServiceImpl")
public class ImgMybatisMapperServiceImpl implements IImgService{
	
	@Autowired
	ImgMapper dao;


	@Override
	public List<ImgDTO> getImgList(String name) {
		
		return dao.getImgList(name);
	}

}
