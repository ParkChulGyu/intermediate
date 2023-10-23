package com.myweb.service;

import java.util.List;

import com.myweb.dto.MemberDTO;

public interface IMemberService {

	List<MemberDTO> getMemberList();
	MemberDTO getMembermapper(MemberDTO dto);
	int insert(MemberDTO dto);
	int update(MemberDTO dto);
	int delete(MemberDTO dto);
	int deleteMember(String[] id);
	int nameCheck(String name) throws Exception;
	int idCheck(String id) throws Exception;

}
