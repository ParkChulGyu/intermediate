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
	
	@RequestMapping(value = "memberList-paging", method = RequestMethod.GET)
	public String memberListpaging(Model model,
			@RequestParam("pageNum") Integer pageNum){
		System.out.println("memberList-paging 최초 페이징이 불러짐");
		
		if(pageNum ==0 ) {
			pageNum = 1;
		}
		
		// 페이지값 초기화
		int totalCount = service.totalCount(); // 멤버 총인원
		int listNum = 10;
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
		List<MemberDTO> list = service.getMemberPaging(pdto);
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
	 @ResponseBody
	@PostMapping(value = "idCheckReal")
	public int idCheck(String user_id) throws Exception{
				int result = service.idCheck(user_id);
				
				return result;
		
	}
	@ResponseBody
	@PostMapping(value = "nameCheckReal")
	public int nameCheck(String name) throws Exception{
	
				int result = service.nameCheck(name);
				return result;
		
	}
	
	//회원가입
	@PostMapping(value = "joinP")
	public String joinAction(HttpServletResponse response,MemberDTO dto, RedirectAttributes ra,String name,String user_id, String pw2 ) throws Exception {
		
			int idResult = service.idCheck(user_id);
			int nameResult = service.idCheck(name);
		
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			
			
			if(dto.getPw().equals(pw2)) {
				
			
			if(idResult == 1 || nameResult == 1) {
				view = "redirect:join-mapper";
				
				
				out.println("<script>alert('회원가입에 실패하셨습니다'); location.href='/web/membermybatis/join-mapper';</script>");
				
				//out.flush();
			}else if(idResult == 0 && nameResult == 0){
//				System.out.println(dto.getNickname());
//				System.out.println(dto.getEmail());
//				System.out.println(dto.getPhoneNumber());
//				System.out.println(dto.getUser_id());
				int rs = 0;
				
				for(int i=0; i<10; i++) {
					dto.setUser_id(dto.getUser_id()+i);
					dto.setPw(dto.getPw()+i);
					dto.setName(dto.getName()+i);
					dto.setNickname(dto.getNickname()+i);
					dto.setEmail(dto.getEmail()+i);
					dto.setPhoneNumber(dto.getPhoneNumber()+i);
					
					rs = service.insert(dto);		
				}
				
				
				if (rs==1) {
					
					view = "redirect:main-mapper";		
					
					
					out.println("<script>alert('계정이 등록 되었습니다'); location.href='/web/membermybatis/main-mapper';</script>");
					
					out.flush();
					}
					
			}

				}else {
					out.println("<script>alert('비밀번호가 일치하지 않습니다');window.history.back();</script>");
					out.flush();
					
				}
			return view;		
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
