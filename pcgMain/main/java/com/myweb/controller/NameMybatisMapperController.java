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
import com.myweb.dto.CultureDTO;
import com.myweb.dto.HotelDTO;
import com.myweb.dto.ImgDTO;
import com.myweb.dto.MemberDTO;
import com.myweb.dto.PagingDTO;
import com.myweb.dto.RestaurantDTO;
import com.myweb.dto.TestDTO;
import com.myweb.dto.TourDTO;
import com.myweb.service.ICultureService;
import com.myweb.service.IHotelService;
import com.myweb.service.IImgService;
import com.myweb.service.IMemberService;
import com.myweb.service.IRestaurantService;
import com.myweb.service.ITestService;
import com.myweb.service.ITourService;


@Controller
@RequestMapping("name")
public class NameMybatisMapperController{
	
	String view;
	
	@Autowired
	@Qualifier("TestMybatisMapperServiceImpl")
	ITestService service;
	
	@Autowired
	@Qualifier("ImgMybatisMapperServiceImpl")
	IImgService i_service;
	
	
	@Autowired
	@Qualifier("CultureMybatisMapperServiceImpl")
	ICultureService c_service;
	
	@Autowired
	@Qualifier("HotelMybatisMapperServiceImpl")
	IHotelService h_service;
	
	@Autowired
	@Qualifier("RestaurantMybatisMapperServiceImpl")
	IRestaurantService r_service;
	
	@Autowired
	@Qualifier("TourMybatisMapperServiceImpl")
	ITourService t_service;
	
	@RequestMapping("culturelist")
	public String Listpaging(Model model, 
			@RequestParam Map<String, String> map){
		System.out.println("culturelist 최초 불러짐");
		//리스트 가져오기
		List<CultureDTO> clist = c_service.getCulNameList(); // clist 값을 다가져옴

		System.out.println("map 불러옴"+map);
		System.out.println("clist 불러옴"+clist);
		
		//
		// 검색값 있는지 확인
		String search = "";
		if(map.get("slt") != null || map.get("str") != null ) {
		search = map.get("str"); // 검색 밸류
		}
		
		// 페이지값 확인
		int pageNum = 1;
		if(map.get("pageNum") != null ) {
			pageNum = Integer.parseInt(map.get("pageNum"));
		}
		

		
		//검색값에 페이지값 세팅
		if(map.get("str") != null) {
			model.addAttribute("str",search);
		}
		
		
		
		// 페이지값 초기화 |pageNum을 제외한
		int totalCount = c_service.getCulturetotalCount(search); // 컬쳐 총 밸류 수정 해야함
		
		int listNum = 10;
		if(map.get("listNum")!=null) {
			listNum = Integer.parseInt(map.get("listNum")); 
		}
		int blockNum = 10;
		PagingDTO pdto = new PagingDTO(totalCount, pageNum, listNum, blockNum);
		//페이징값 세팅
		pdto.setPaging();
		
		model.addAttribute("pdto",pdto); // xml 에 paging dto값을 주고 원하는 페이지의 memberlist값을 가져온다.
		
		// 있는 페이지 값으로 DB에서 원하는 List값 가져오기
		Map<String, Object> pstr= new HashMap<String, Object>();
		
		if(search == null) {
			search="";
		}
			pstr.put("search", search);
			pstr.put("listNum", pdto.getListNum());
			pstr.put("start_rownum", pdto.getStart_rownum()-1);
		
		//
			List<String> cnlist = new ArrayList<String>(); // 이름만 담을 리스트 만들고
			List<String> fnlist = new ArrayList<String>(); 
			
			// 페이징 값을 세팅 끝내고, name list 값을 가져옴
			
			cnlist = c_service.getCulturePaging(pstr);
			// name list 값에서 이미지 1개씩 이름을 찾아서 꺼내서 담음
			for(String iname : cnlist) {
				fnlist.add(i_service.getImgone(iname));	
			}
		
		model.addAttribute("cnlist",cnlist);
		model.addAttribute("fnlist",fnlist);
		model.addAttribute("fnlist",fnlist);
		model.addAttribute("listNum",listNum);
		
		view = "name/culturelist";
		return view;		
	}
		
	@RequestMapping("tourlist")
	public String loop(Model model, 
			@RequestParam Map<String, String> map){
		
		System.out.println("Tourlist 최초 불러짐");
		//리스트 가져오기
		List<TourDTO> tlist = t_service.getTourNameList(); // clist 값을 다가져옴

		System.out.println("map 불러옴"+map);
		System.out.println("tlist 불러옴"+tlist);
		
		//
		// 검색값 있는지 확인
		String search = "";
		if(map.get("slt") != null || map.get("str") != null ) {
		search = map.get("str"); // 검색 밸류
		}
		
		// 페이지값 확인
		int pageNum = 1;
		if(map.get("pageNum") != null ) {
			pageNum = Integer.parseInt(map.get("pageNum"));
		}
		

		
		//검색값에 페이지값 세팅
		if(map.get("str") != null) {
			model.addAttribute("str",search);
		}
		
		
		
		// 페이지값 초기화 |pageNum을 제외한
		int totalCount = t_service.getTourtotalCount(search); // 컬쳐 총 밸류 수정 해야함
		
		int listNum = 10;
		if(map.get("listNum")!=null) {
			listNum = Integer.parseInt(map.get("listNum")); 
		}
		int blockNum = 10;
		PagingDTO pdto = new PagingDTO(totalCount, pageNum, listNum, blockNum);
		//페이징값 세팅
		pdto.setPaging();
		
		model.addAttribute("pdto",pdto); // xml 에 paging dto값을 주고 원하는 페이지의 memberlist값을 가져온다.
		
		// 있는 페이지 값으로 DB에서 원하는 List값 가져오기
		Map<String, Object> pstr= new HashMap<String, Object>();
		
		if(search == null) {
			search="";
		}
			pstr.put("search", search);
			pstr.put("listNum", pdto.getListNum());
			pstr.put("start_rownum", pdto.getStart_rownum()-1);
		
		//
			List<String> tnlist = new ArrayList<String>(); // 이름만 담을 리스트 만들고
			List<String> fnlist = new ArrayList<String>(); 
			
			// 페이징 값을 세팅 끝내고, name list 값을 가져옴
			
			tnlist = t_service.getTourPaging(pstr);
			// name list 값에서 이미지 1개씩 이름을 찾아서 꺼내서 담음
			for(String iname : tnlist) {
				fnlist.add(i_service.getImgone(iname));	
			}
		
		model.addAttribute("tnlist",tnlist);
		model.addAttribute("fnlist",fnlist);
		model.addAttribute("listNum",listNum);
		
		
		view = "name/Tourlist";
		return view;
	}


}
