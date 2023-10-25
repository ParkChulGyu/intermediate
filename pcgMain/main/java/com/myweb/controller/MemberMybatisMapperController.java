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
	
	@GetMapping("memberList-paging")
	public String memberListpaging(Model model){
		System.out.println("memberList-paging 최초 페이징이 불러짐");
		int coun = service.totalCount();
		model.addAttribute("coun",coun);
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
				int rs = service.insert(dto);		
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
