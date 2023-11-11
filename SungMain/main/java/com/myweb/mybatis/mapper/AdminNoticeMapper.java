package com.myweb.mybatis.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.dto.AdminNoticeDTO;
import com.myweb.dto.MoveDTO;
import com.myweb.dto.ReplyDTO;

@Mapper
public interface AdminNoticeMapper {	
	
	public AdminNoticeDTO getBoradone(int idx);	
	
	public MoveDTO getMove(int idx);	
	
	List<AdminNoticeDTO> getBoradlist() throws Exception;
	int getBoardcount(String search) throws Exception;

	List<AdminNoticeDTO> getMemberPaging(Map<String, Object> pstr);
	
	int insertFile(AdminNoticeDTO dto) throws Exception;

	int updatecount(AdminNoticeDTO dto) throws Exception;

	int getMove(AdminNoticeDTO dto) throws Exception;
	
	ArrayList<ReplyDTO> replyList(ReplyDTO dto);
	
	ArrayList<ReplyDTO> showrereply(ReplyDTO dto);

	
	int pictureWriteReReply(ReplyDTO dto) throws Exception;

	int pictureWriteReply(ReplyDTO dto) throws Exception;
	
	int DeleteReply(ReplyDTO dto) throws Exception;
	
	int DeleteReReply(ReplyDTO dto) throws Exception;
	
	int p_reply_max_no() throws Exception;
 	
	int picture_reply_check(ReplyDTO dto) throws Exception;
	
	int pictureWriteReplyupdate(ReplyDTO dto) throws Exception;
	
	int p_reply_max_Grps(ReplyDTO dto) throws Exception;
	
	int pictureWriteReplyupdateGrpas(ReplyDTO dto) throws Exception;


	ArrayList<ReplyDTO> replyanswerList(ReplyDTO dto);

}
