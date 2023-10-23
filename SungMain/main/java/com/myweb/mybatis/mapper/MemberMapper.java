package com.myweb.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.dto.MemberDTO;

@Mapper
public interface MemberMapper {	

	public List<MemberDTO> getMemberList();	

	public int insert(MemberDTO dto);

	public int update(MemberDTO dto);

	public int delete(MemberDTO dto);

	public int deleteMember(String[] id);

	public MemberDTO getMembermapper(MemberDTO dto); 
	
	public int nameCheck(String name) throws Exception;
	
	public int idCheck(String id) throws Exception;
	
	
}
