package com.myweb.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.dto.MemberDTO;
import com.myweb.dto.PagingDTO;

@Mapper
public interface MemberMapper {	
	
	public int totalCount() ;
	
	public MemberDTO getMembermapper(MemberDTO dto); 

	public List<MemberDTO> getMemberList();	
	
	public int insert(MemberDTO dto);
	
	public int update(MemberDTO dto);
	
	public int delete(MemberDTO dto);
	
	public int deleteMember(MemberDTO dto) throws Exception;

	public int nameCheck(String name) throws Exception;

	public int idCheck(String user_id) throws Exception;

	
	
	
	
}
