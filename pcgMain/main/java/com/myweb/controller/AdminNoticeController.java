package com.myweb.controller;



import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.dto.AdminNoticeDTO;
import com.myweb.dto.PagingDTO;
import com.myweb.dto.ReplyDTO;
import com.myweb.service.AdminNoticeService;

import java.util.ArrayList;
import java.util.Date;
import java.io.File;
import java.text.SimpleDateFormat;
import com.oreilly.servlet.MultipartRequest;


@Controller
@RequestMapping("adminnotice")
public class AdminNoticeController{
	
	String view;
	
	@Autowired
	@Qualifier("AdminNoticeServiceImpl")
	AdminNoticeService service;
	
	
	
	

	
	
	
	
	@RequestMapping("adminlist")
	public String adminlist(Model model, 
			@RequestParam Map<String, String> map) throws Exception {
		
		System.out.println("memberList-paging 최초 페이징이 불러짐");
		System.out.println(map); // 현재 맵에 들어있는값 모두
		System.out.println(map.get("pageNum"));

		AdminNoticeDTO mdto = null;
		// 검색값 있는지 확인
		String search = "";
	
		if(map.get("slt") != null || map.get("str") != null ) {
		search = map.get("str"); // 검색 밸류
		}
		
		// 페이지값 확인
		int pageNum = 1;
		System.out.println("체크하자 체크1212" +map.get("pageNum"));
		if(map.get("pageNum") != null ) {
			pageNum = Integer.parseInt(map.get("pageNum"));
		}
		
		//검색값에 페이지값 세팅
		if(map.get("str") != null) {
			model.addAttribute("str",search);
		}
		
		
		
		// 페이지값 초기화 |pageNum을 제외한
		int totalCount = service.getBoardcount(search); // 멤버 총인원
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
		
		
		List<AdminNoticeDTO> list = service.getMemberPaging(pstr);
		
//		System.out.println("test"+ list);
		
		model.addAttribute("list",list); // xml 에 paging dto값을 주고 원하는 페이지의 memberlist값을 가져온다.
		
		
		
		view = "adminnotice/adminlist";
		return view;		
	}
	
	
	
	@GetMapping("adminview")
	public String adminview(Model model, int idx, int totalcount) throws Exception {
		
			totalcount = totalcount + 1;
		AdminNoticeDTO dto = new AdminNoticeDTO();
		dto.setTotalcount(totalcount);
		dto.setIdx(idx);
		service.updatecount(dto);
		
		model.addAttribute("one",service.getBoradone(idx));
		model.addAttribute("lastidx",service.getMove(idx).getLastidx());
		model.addAttribute("lasttitle",service.getMove(idx).getLasttitle());
		model.addAttribute("nextidx",service.getMove(idx).getNextidx());
		model.addAttribute("nexttitle",service.getMove(idx).getNexttitle());
		model.addAttribute("lasttotalcount",service.getMove(idx).getLasttotalcount());
		model.addAttribute("nexttotalcount",service.getMove(idx).getNexttotalcount());
		
//		model.addAttribute("before",service.getBoradone(idx).getTitle());
//			idx = idx + 2;
//			System.out.println("idx 3 체크 : " + idx);
//			model.addAttribute("next",service.getBoradone(idx).getTitle());
		
		
		
		view = "adminnotice/adminview";
		
		return view;				
	}
	
	
	
	

	@GetMapping("adminviewmove")
	public String adminviewmove(int idx,Model model,int totalcount) throws Exception {
		
		AdminNoticeDTO dto = new AdminNoticeDTO();
		dto.setTotalcount(totalcount);
		dto.setIdx(idx);
		service.updatecount(dto);
		
		model.addAttribute("one",service.getBoradone(idx));
		
			model.addAttribute("lastidx",service.getMove(idx).getLastidx());
			model.addAttribute("lasttitle",service.getMove(idx).getLasttitle());
			model.addAttribute("nextidx",service.getMove(idx).getNextidx());
			model.addAttribute("nexttitle",service.getMove(idx).getNexttitle());
			model.addAttribute("lasttotalcount",service.getMove(idx).getLasttotalcount());
			model.addAttribute("nexttotalcount",service.getMove(idx).getNexttotalcount());
		
		
		view = "adminnotice/adminview";
		
		return view;				
	}
	
	
	@ResponseBody
	@RequestMapping("picture_replyList")
	public ArrayList<ReplyDTO> reply_list(@RequestParam String idx, HttpSession session){
		
		ReplyDTO dto = new ReplyDTO();
		
		dto.setBidx(idx);
		
		ArrayList<ReplyDTO> replyList = new ArrayList();
		
		replyList = service.replyList(dto);
	
		
		
		return replyList;
	}

	

	
	
	@GetMapping("adminwrite")
	public String adminwrite() {
		
		view = "adminnotice/adminwrite";
		
		return view;				
	}
	
	
	@RequestMapping("fileUploadAction")
	public  String fileUploadAction(HttpServletRequest request, HttpServletResponse response) {
		try {
			String saveDirectory = "D:/kdigital12307/spring2/spring2/intermediate2/file";  // 저장할 디렉터리
			int maxPostSize = 1024 * 1000;  // 파일 최대 크기(1MB)
			String encoding = "UTF-8";  // 인코딩 방식
		    // 1. MultipartRequest 객체 생성
		    MultipartRequest mrequest = new MultipartRequest(request, saveDirectory,
		                                               maxPostSize, encoding);

		    // 2. 새로운 파일명 생성
		    String fileName = mrequest.getFilesystemName("attachedFile");  // 현재 파일 이름
		    String ext = fileName.substring(fileName.lastIndexOf("."));  // 파일 확장자
		    String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		    String newFileName = now + ext;  // 새로운 파일 이름("업로드일시.확장자")

		    // 3. 파일명 변경
		    File oldFile = new File(saveDirectory + File.separator + fileName);
		    File newFile = new File(saveDirectory + File.separator + newFileName);
		    oldFile.renameTo(newFile);

		    // 4. 다른 폼값 받기
		    String nickname = mrequest.getParameter("nickname");
		    System.out.println("nickname 확인 " + nickname);
		    String content = mrequest.getParameter("content");
		    System.out.println("content 확인 " + content);
		    String title = mrequest.getParameter("title");
		    System.out.println("title 확인 " + title);
		    String[] category = mrequest.getParameterValues("cate");
		    StringBuffer cateBuf = new StringBuffer();
		    if (category == null) {
		        cateBuf.append("선택 없음");
		    }
		    else {
		        for (String s : category) {
		            cateBuf.append(s + ", ");
		        }
		    }

		    	System.out.println("category 확인 :" + category.toString());
		    // 5. DTO 생성
		    AdminNoticeDTO dto = new AdminNoticeDTO();
		    dto.setNickname(nickname);
		    dto.setTitle(title);
		    dto.setContent(category.toString());
		    dto.setOfile(fileName);
		    dto.setSfile(newFileName);
		    dto.setContent(content);

		    // 6. DAO를 통해 데이터베이스에 반영
		    int rs = service.insertFile(dto);
		    System.out.println("rs 체크" + rs);
		    request.setAttribute("success", "파일 업로드 성공");

		    // 7. 파일 목록 JSP로 리디렉션
		    view = "redirect:/adminnotice/adminlist";
		}
		catch (Exception e) {
		    e.printStackTrace();
		    request.setAttribute("errorMessage", "파일 업로드 오류");
		    view = "/adminnotice/adminwrite";
		}
		return view;
	}


}
