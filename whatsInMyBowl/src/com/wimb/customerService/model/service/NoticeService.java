package com.wimb.customerService.model.service;

import static com.wimb.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.admin.model.dao.bannerDao;
import com.wimb.common.model.vo.PageInfo;
import com.wimb.customerService.model.dao.NoticeDao;
import com.wimb.customerService.model.vo.Notice;

public class NoticeService {
	
	// 고객센터 사용자 화면을 보여주는 Service
	public ArrayList<Notice> selectNoticeUserView(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectNoticeUserView(conn, pi);
		close(conn);
		return list;
	}
	
	// 페이징바에 사용할 등록된 공지사항글의 총 갯수를 구하는 Service
	public int selectListCount() {
		 Connection conn = getConnection();
		 int listCount = new NoticeDao().selectListCount(conn);
		 close(conn);
		 
		 return listCount;
	}
	
	// 공지사항 클릭 시 조회수를 증가시키는 SerVice
	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	// 공지사항 글 클릭시 상세내용
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;
	}
	
	// 공지사항 관리자 화면을 보여주는 Service
	public ArrayList<Notice> selectAdminView(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectAdminView(conn, pi);
		close(conn);
		return list;
	}
	
	
	
	

}
