package com.myweb.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.dto.AdminNoticeDTO;
import com.myweb.dto.MoveDTO;
import com.myweb.dto.ReplyDTO;
import com.myweb.mybatis.mapper.AdminNoticeMapper;
import com.myweb.service.AdminNoticeService;

@Service("AdminNoticeServiceImpl")
public class AdminNoticeServiceImpl implements AdminNoticeService{
	
	@Autowired
	AdminNoticeMapper admin;

	@Override
	public
	AdminNoticeDTO getBoradone(int idx) {
		return admin.getBoradone(idx);
	}
	@Override
	public
	MoveDTO getMove(int idx) {
		return admin.getMove(idx);
	}

	@Override
	public
	List<AdminNoticeDTO> getBoradlist() throws Exception{
		return admin.getBoradlist();
		} 
	
	@Override
	public
	int getBoardcount(String search)  throws Exception{
		return admin.getBoardcount(search);
	} 
	
	@Override
	public
	List<AdminNoticeDTO> getMemberPaging(Map<String, Object> pstr) {
		return admin.getMemberPaging(pstr);
	} 

	@Override
	public
	int insertFile(AdminNoticeDTO dto) throws Exception{
		return admin.insertFile(dto);
	} 
	@Override
	public
	int  updatecount(AdminNoticeDTO dto) throws Exception {
		return admin.updatecount(dto);
	}
	
	@Override
	public
	 ArrayList<ReplyDTO> replyList(ReplyDTO dto) {
		return admin.replyList(dto);
	} 
	@Override
	public
	ArrayList<ReplyDTO> showrereply(ReplyDTO dto) {
		return admin.showrereply(dto);
	} 
	@Override
	
	public int pictureWriteReReply(ReplyDTO dto) throws Exception{
 
		return admin.pictureWriteReReply(dto);
		
		
	} 
	@Override
	
	public int DeleteReply(ReplyDTO dto) throws Exception{
		
		return admin.DeleteReply(dto);
		
		
	} 
	@Override
	
	public int DeleteReReply(ReplyDTO dto) throws Exception{
		
		return admin.DeleteReReply(dto);
		
		
	} 
	@Override
	
	public int pictureWriteReply(ReplyDTO dto) throws Exception{
		System.out.println("dto.getIdx() 체크 : " + dto.getIdx());
		return admin.pictureWriteReply(dto) ;
	} 
	@Override
	
	public int p_reply_max_no() throws Exception{ 
		
		return admin.p_reply_max_no();
	} 
	@Override
	
	public int pictureWriteReplyupdate(ReplyDTO dto) throws Exception {
		return admin.pictureWriteReplyupdate(dto);
	}
	@Override
	
	public int p_reply_max_Grps(ReplyDTO dto) throws Exception {
		return admin.p_reply_max_Grps(dto);
	}
		
	@Override
	
	public int pictureWriteReplyupdateGrpas(ReplyDTO dto) throws Exception {
	
		return admin.pictureWriteReplyupdateGrpas(dto);
	}
	 
	
	
	@Override
	public
	ArrayList<ReplyDTO> replyanswerList(ReplyDTO dto) {
		return admin.replyanswerList(dto);
	} 
	
}
