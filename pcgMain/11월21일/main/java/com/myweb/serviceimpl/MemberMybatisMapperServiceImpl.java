package com.myweb.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.dto.MemberDTO;
import com.myweb.mybatis.mapper.MemberMapper;
import com.myweb.service.IMemberService;

@Service
public class MemberMybatisMapperServiceImpl implements IMemberService{
	
	@Autowired
	MemberMapper dao;

	@Override
	public int totalCount(String search) {
		return dao.totalCount(search);
	} 
	
	public List<MemberDTO> getMemberPaging(Map<String, Object> pstr){
		return dao.getMemberPaging(pstr);
	} 
	
	@Override
	public List<MemberDTO> getMemberList() {
		return dao.getMemberList();
	}

	@Override
	public MemberDTO getMembermapper(MemberDTO dto) {
		return dao.getMembermapper(dto);
	}
	
		//사용중
	@Override
	public int insertmember(MemberDTO dto)  throws Exception{
		return dao.insertmember(dto);
	}

	@Override
	public int update(MemberDTO dto) {
		
		return dao.update(dto);
	}

	@Override
	public int delete(MemberDTO dto) {
		
		return dao.delete(dto);
	}
	@Override
	public int deleteMember(MemberDTO dto) throws Exception {
		
		return dao.deleteMember(dto);
	}
	
	@Override
	public String idfind(String email) throws Exception {
		return dao.idfind(email);
	}

	@Override
	public int idfindcount(String email) throws Exception {
		return dao.nameCheck(email);
	}

	@Override
	public int nameCheck(String name) throws Exception {
		return dao.nameCheck(name);
	}

	@Override
	public int checkId(String user_id) throws Exception {
		
		return dao.checkId(user_id);
	}


}
