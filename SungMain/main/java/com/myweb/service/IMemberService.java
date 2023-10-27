package com.myweb.service;

import java.util.List;
import java.util.Map;

import com.myweb.dto.MemberDTO;
import com.myweb.dto.PagingDTO;

public interface IMemberService {
	
	int totalCount(String search) ;
	public List<MemberDTO> getMemberPaging(Map<String, Object> pstr) ;
	List<MemberDTO> getMemberList();
	MemberDTO getMembermapper(MemberDTO dto) ;
	int insert(MemberDTO dto) throws Exception;
	int update(MemberDTO dto);
	int delete(MemberDTO dto);
	int deleteMember(MemberDTO dto) throws Exception;
	int nameCheck(String name) throws Exception;
	int idCheck(String user_id) throws Exception;

}
