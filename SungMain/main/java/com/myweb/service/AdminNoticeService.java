package com.myweb.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.myweb.dto.AdminNoticeDTO;
import com.myweb.dto.MemberDTO;
import com.myweb.dto.MoveDTO;
import com.myweb.dto.PagingDTO;
import com.myweb.dto.ReplyDTO;




public interface AdminNoticeService {
	
	AdminNoticeDTO getBoradone(int idx);

	MoveDTO getMove(int idx);

	List<AdminNoticeDTO> getBoradlist() throws Exception;
	
	int getBoardcount(String search) throws Exception;
	
	public List<AdminNoticeDTO> getMemberPaging(Map<String, Object> pstr) ;
	
	int insertFile(AdminNoticeDTO dto) throws Exception;

	int updatecount(AdminNoticeDTO dto) throws Exception;
	
	
	public ArrayList<ReplyDTO> replyList(ReplyDTO dto) ;
	
	public ArrayList<ReplyDTO> showrereply(ReplyDTO dto) ;
	
	public int pictureWriteReReply(ReplyDTO dto) throws Exception;

	public int pictureWriteReply(ReplyDTO dto) throws Exception;

	public int p_reply_max_no() throws Exception;
	
	public int pictureWriteReplyupdate(ReplyDTO dto) throws Exception;
	
	public int p_reply_max_Grps(ReplyDTO dto) throws Exception;

	public int pictureWriteReplyupdateGrpas(ReplyDTO dto) throws Exception;

	public int DeleteReply(ReplyDTO dto) throws Exception;
	
	public int DeleteReReply(ReplyDTO dto) throws Exception;
	
	public ArrayList<ReplyDTO> replyanswerList(ReplyDTO dto) ;
	
}
