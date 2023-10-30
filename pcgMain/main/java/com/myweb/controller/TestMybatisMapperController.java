package com.myweb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;
import com.myweb.dto.ImgDTO;
import com.myweb.dto.MemberDTO;
import com.myweb.dto.PagingDTO;
import com.myweb.dto.TestDTO;
import com.myweb.service.IImgService;
import com.myweb.service.IMemberService;
import com.myweb.service.ITestService;


@Controller
@RequestMapping("test")
public class TestMybatisMapperController{
	
	String view;
	
	@Autowired
	@Qualifier("TestMybatisMapperServiceImpl")
	ITestService service;
	
	@Autowired
	@Qualifier("ImgMybatisMapperServiceImpl")
	IImgService servicefile;
//	@RequestMapping(value = "request", method = RequestMethod.GET)
//	public String request() {
//		System.out.println("request");
//		
//		return "test/request";
//		
//	}
	
//	@RequestMapping(value = "get", method = RequestMethod.GET)
//	public String get(@RequestParam String id) {
//		System.out.println("getRequst");
//		System.out.println("id : " + id);
//		return "test/request";		
//	}
	
	@RequestMapping("response")
	public String memberListpaging(Model model, 
			@RequestParam Map<String, String> map){
		
		System.out.println("response이 최초 불러짐");
		System.out.println(map); // 현재 맵에 들어있는값 모두
		TestDTO tdto = null;
		Map<String, Object> pstr= new HashMap<String, Object>();
		
		List<TestDTO> list = service.getTestList();
		
		model.addAttribute("list",list); // xml 에 paging dto값을 주고 원하는 페이지의 TestList값을 가져온다.
		
		System.out.println(list.get(0).getName());
		
		String name = list.get(0).getName();
		
		List<ImgDTO> flist =  servicefile.getImgList(name);
		
		System.out.println("파일 이름명 : "+flist);
		
		model.addAttribute("flist",flist); 
		
		System.out.println(model);
		view = "test/response";
		return view;		
	}
		
	


}
