package com.myweb.serviceimpl;

import java.util.List;

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
	public List<MemberDTO> getMemberList() {
		
		return dao.getMemberList();
	}

	@Override
	public MemberDTO getMembermapper(MemberDTO dto) {
		
		return dao.getMembermapper(dto);
	}
		//사용중
	@Override
	public int insert(MemberDTO dto) {
		return dao.insert(dto);
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
	public int deleteMember(String[] id) {
		
		return dao.deleteMember(id);
	}
	
	@Override
	public int nameCheck(String name) throws Exception {
		return dao.nameCheck(name);
	}

	@Override
	public int idCheck(String id) throws Exception {
		
		return dao.idCheck(id);
	}


}
