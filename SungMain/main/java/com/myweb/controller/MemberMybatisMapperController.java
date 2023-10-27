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
import com.myweb.dto.MemberDTO;
import com.myweb.dto.PagingDTO;
import com.myweb.service.IMemberService;


@Controller
@RequestMapping("membermybatis")
public class MemberMybatisMapperController{
	
	String view;
	
	@Autowired
	@Qualifier("memberMybatisMapperServiceImpl")
	IMemberService service;
	
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
	
	@RequestMapping("memberList-paging")
	public String memberListpaging(Model model, 
			@RequestParam Map<String, String> map){
		
		System.out.println("memberList-paging 최초 페이징이 불러짐");
		System.out.println(map); // 현재 맵에 들어있는값 모두
		System.out.println(map.get("pageNum"));
		MemberDTO mdto = null;
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
		int totalCount = service.totalCount(search); // 멤버 총인원
		int listNum = 10;
		if(map.get("listNum")!=null) {
			listNum = Integer.parseInt(map.get("listNum")); 
		}
		int blockNum = 10;
		PagingDTO pdto = new PagingDTO(totalCount, pageNum, listNum, blockNum);
		//페이징값 세팅
		pdto.setPaging();
//		int totalPage = pdto.getTotalPage();
//		pageNum = pdto.getPageNum();
//		listNum = pdto.getListNum();
//		blockNum = pdto.getBlockNum();
//		int startPage = pdto.getStartPage();
//		int endPage = pdto.getEndPage();
//		int start_rownum = pdto.getStart_rownum();
//		int end_rownum = pdto.getEnd_rownum();
//		boolean isPrev = pdto.getIsPrev();
//		boolean isNext = pdto.getIsNext();
//		boolean isBPrev = pdto.getIsBPrev();
//		boolean isBNext = pdto.getIsBNext();
		
		// 페이징값 넘기기
//		model.addAttribute("totalCount",totalCount); // 전체 데이터 값
//		model.addAttribute("pageNum",pageNum); // 현재 페이지
//		model.addAttribute("listNum",listNum); // 1페이지당 1다스 숫자
//		model.addAttribute("blockNum",blockNum); // 몇페이지를 한번에 띄울지
//		model.addAttribute("totalPage",totalPage); // 전체 페이지 숫자
//		model.addAttribute("startPage",startPage); // 시작 페이지
//		model.addAttribute("endPage",endPage); // 마지막 페이지
//		model.addAttribute("isPrev",isPrev); // 앞 페이지가 있는지 t/f
//		model.addAttribute("isNext",isNext);  // 다음 페이지가 있는지 t/f
//		model.addAttribute("isBPrev",isBPrev);  // 앞 10 페이지가 있는지 t/f
//		model.addAttribute("isBNext",isBNext); // 뒤 10 페이지가 있는지 t/f
		
		model.addAttribute("pdto",pdto); // xml 에 paging dto값을 주고 원하는 페이지의 memberlist값을 가져온다.
		
		// 있는 페이지 값으로 DB에서 원하는 List값 가져오기
		Map<String, Object> pstr= new HashMap<String, Object>();
		
		if(search == null) {
			search="";
		}
			pstr.put("search", search);
			pstr.put("listNum", pdto.getListNum());
			pstr.put("start_rownum", pdto.getStart_rownum()-1);
		
		
		List<MemberDTO> list = service.getMemberPaging(pstr);
//		System.out.println("test"+ list);
		
		model.addAttribute("list",list); // xml 에 paging dto값을 주고 원하는 페이지의 memberlist값을 가져온다.
		
		
		
		view = "membermybatis/memberList-paging";
		return view;		
	}
	
			
	@GetMapping("main-mapper")
	public String mainInteface() {
		System.out.println("main-mapper");		
		
		view = "membermybatis/main-mapper";
		
		return view;				
	}
		
	
	@GetMapping("memberList-mapper")
	public String memberList(Model model) throws Exception {
		System.out.println("memberList-mapper");
		
		List<MemberDTO> list = service.getMemberList();		
		model.addAttribute("list", list);
		view = "membermybatis/memberList-mapper";
		
		return view;		
		
	}
	
	

	@ResponseBody
	@PostMapping(value = "memberdelete")
	public int memberdelete(String[] user_id ,MemberDTO dto)  throws Exception {
//		Map<String, Object> resultMap = new HashMap<>();
//	    
//	    List<Integer> results = new ArrayList<>();
//	    for (int i = 0; i < user_id.length; i++) {
//	        dto.setUser_id(user_id[i]);
//	        System.out.println("dto 체크해보자 : " + dto);
//	        int result = service.deleteMember(dto);
//	        results.add(result);
//	        System.out.println("result 확인 : " + result);
//	    }
//	    
//	    resultMap.put("results", results);
//	    return resultMap;
//	}
		
		
		
		
			int result = 0;
		for(int i=0 ; i<user_id.length; i++) {
				
				dto.setUser_id(user_id[i]);
					System.out.println("dto체크해보자 : " + dto);
				result = service.deleteMember(dto);
				System.out.println("result 확인 : " + result);
				
				
				
		}
			return result;	
		
	}
	
	
	//회원가입
	@GetMapping("join-mapper")
	public String join() {
		
		view = "membermybatis/join-mapper";
		
		return view;		
	}
	//회원가입
//	 @ResponseBody
//	@PostMapping(value = "idCheckReal")
//	public int idCheck(String user_id) throws Exception{
//				int result = service.idCheck(user_id);
//				
//				return result;
//		
//	}
//	@ResponseBody
//	@PostMapping(value = "nameCheckReal")
//	public int nameCheck(String name) throws Exception{
//	
//				int result = service.nameCheck(name);
//				return result;
//		
//	}
	
	//회원가입
	@ResponseBody
	@PostMapping(value = "joinP")
	public int joinAction(MemberDTO dto) throws Exception {
		
		
			System.out.println("memberDTO" +  dto);
				
				
				
				
					dto.setUser_id(dto.getUser_id());
					dto.setPw(dto.getPw());
					dto.setName(dto.getName());
					dto.setNickname(dto.getNickname());
					dto.setEmail(dto.getEmail());
					dto.setPhoneNumber(dto.getPhoneNumber());
					
					System.out.println("memberDTO2" +  dto);
					int result = service.insert(dto);		
				
				System.out.println("result 확인 " + result);
				
				return result;		
	}
					
			

				
	
	@ResponseBody
	@PostMapping(value = "getMemberdata")
	public int getMemberdata(String user_id, MemberDTO dto) throws Exception{
				int rs=0;
					dto.setUser_id(user_id);
				dto = service.getMembermapper(dto);
			
				if(dto != null) {
					rs = 1;
				}
				return rs;
				
				
	} 
		
	
	
	
	
	
	
	
	//로그인
	@GetMapping("login-mapper")
	public String login() {
		
		view = "membermybatis/login-mapper";		
		
		return view;		
	}
	
	@PostMapping(value = "loginP")
	public String loginAction(MemberDTO dto, HttpSession session) {
	
		String user_id = dto.getUser_id();
		String pw = dto.getPw();		
		
		
		dto = service.getMembermapper(dto);
		
		if (dto != null) {
			if (dto.getPw().equals(pw)) {
				
				session.setAttribute("user_id", user_id);
				session.setAttribute("name", dto.getName());
				
				view = "redirect:main-mapper";
			}
		}
		
		return view;		
	}
	@GetMapping("update-mapper")
	public String update(Model model, HttpSession session) {
		
		String user_id = (String)session.getAttribute("user_id");

		MemberDTO dto = new MemberDTO();
		dto.setUser_id(user_id);

		model.addAttribute("dto", service.getMembermapper(dto));
		
		view = "membermybatis/update-mapper";		
		
		return view;		
	}
	
	@PostMapping("updateP")
	public String updateAction(MemberDTO dto, HttpSession session) {
		
		String user_id = (String)session.getAttribute("user_id");
		dto.setUser_id(user_id);
		System.out.println(dto);
		service.update(dto);
		
		session.setAttribute("name", dto.getName());
		
		view = "redirect:update-mapper";
		
		return view;
	}
	
	@GetMapping("delete-mapper")	
	public String delete() {		
		
		view = "membermybatis/delete-mapper";
		
		return view;		
		
	}
	
	@PostMapping("deleteP")
	public String deleteAction(MemberDTO dto, HttpSession session) {
		System.out.println("delete - post");
		
		String user_id = (String)session.getAttribute("user_id");
		String pw = dto.getPw();
		dto.setUser_id(user_id);		
		
		dto = service.getMembermapper(dto);
		
		if (dto != null) {
			if (dto.getPw().equals(pw)) {
				
				service.delete(dto);				
				session.invalidate();
				
				view = "redirect:main-mapper";
			}
		}
		
		return view;		
	}
	@GetMapping("logout-mapper")	
	public String logout(HttpSession session) {		
		System.out.println("logout - get");
		
		session.invalidate();
		
		view = "redirect:main-mapper";
		
		return view;		
		
	}	


}
