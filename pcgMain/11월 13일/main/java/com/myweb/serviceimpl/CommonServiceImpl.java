package com.myweb.serviceimpl;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.dto.AdminNoticeDTO;
import com.myweb.dto.MoveDTO;
import com.myweb.dto.ReplyDTO;
import com.myweb.mybatis.mapper.AdminNoticeMapper;
import com.myweb.mybatis.mapper.CommonMapper;
import com.myweb.mybatis.mapper.QnaMapper;
import com.myweb.service.AdminNoticeService;
import com.myweb.service.CommonService;
import com.myweb.service.QnaService;

@Service("CommonServiceImpl")
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	CommonMapper admin;
	
@Override
	
	public String upload(String category, MultipartFile file, HttpSession session) {
		//서버의 업로드할 물리적 위치
		// workspace/.metadata/....../wtpwebapps/iot/resources
		String resources = session.getServletContext().getRealPath("resources");
		String upload = resources + "/upload";
		
		//업로드할 파일의 형태 : .../upload/notice/2020/07/13/abc.txt
		//String folder = upload + "/upload/2020/07/13";
		String folder = upload + "/" + category + "/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		
		//폴더가 없다면 폴더를 생성
		File f = new File(folder);
		if(!f.exists()) { f.mkdirs(); } //폴더가 존재하지 않으면 경로 생성
		
		//동시 다발적 동일명의 파일 업로드를 위한 고유 ID 부여: afd324adfa_abc.txt
		String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		try {
			file.transferTo( new File(folder, uuid) );
		} catch (Exception e) {
			System.out.println(e.getMessage());		
		}
		
		// /upload/.../asdfadsfsa_abc.txt ▶ 업로드한 파일의 경로를 반환
		// ① folder.replace(resources, "")
		// ② folder.substring(resources.length()) + "/" + uuid;
		return folder.substring(resources.length()) + "/" + uuid;
	}

//첨부 파일 다운로드 처리///////////////////////////////////////////////////////
	public File download(String filename, String filepath, HttpSession session, HttpServletResponse response) {
		File file = new File(session.getServletContext().getRealPath("resources") + filepath);
		//filepath에 resources/ << 슬래쉬부터의 경로가 저장되어 있다
		String mime = session.getServletContext().getMimeType(filename);
		
		response.setContentType(mime);
		
		try {
			filename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");
			// + 는 기호라 \ 필요, \ 또한 기호라 \ 필요
			// %20 = 스페이스바
			
			response.setHeader("content-disposition", "attachment; filename=" + filename);
			
			ServletOutputStream out = response.getOutputStream();
			FileCopyUtils.copy(new FileInputStream(file), out);
			out.flush();
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return file;
	}





	


	
}
