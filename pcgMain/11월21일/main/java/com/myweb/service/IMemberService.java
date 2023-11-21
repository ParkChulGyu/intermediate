package com.myweb.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.myweb.dto.MemberDTO;
import com.myweb.dto.PagingDTO;




public interface IMemberService {
	
	int totalCount(String search) ;
	public List<MemberDTO> getMemberPaging(Map<String, Object> pstr) ;
	List<MemberDTO> getMemberList();
	MemberDTO getMembermapper(MemberDTO dto) ;
	int insertmember(MemberDTO dto) throws Exception;
	int update(MemberDTO dto);
	int delete(MemberDTO dto);
	int deleteMember(MemberDTO dto) throws Exception;
	String idfind(String email) throws Exception;
	int idfindcount(String email) throws Exception;
	int nameCheck(String name) throws Exception;
	int checkId(String user_id) throws Exception;

}
