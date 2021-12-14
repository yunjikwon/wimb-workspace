package com.wimb.mypage.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.mypage.model.vo.MyOrders;



public class MyPageService {
	
	public ArrayList<MyOrders> selectOrderList(int mCode) {
		Connection conn = getConnection();
		ArrayList<MyOrders> list = new MyPageDao().selectOrderList(conn, mCode);
		close(conn);
		return list;
	}
	
	
	
	
	
	
}