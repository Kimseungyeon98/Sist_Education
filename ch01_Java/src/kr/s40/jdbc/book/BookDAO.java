package kr.s40.jdbc.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.util.DBUtil;

public class BookDAO {
	//관리자 도서 등록
	public void insertBook(String bk_name,String bk_category) {
		
	}
	//관리자 도서 목록 보기
	public void selectListBook() {
		
	}
	//관리자 회원 목록 보기
	public void selectListMember() {
		
	}
	//관리자 대출 목록 보기(대출 및 반납의 모든 데이터 표시)
	public void selectListReservation() {
		
	}
	
	//사용자 아이디 중복 체크(count가 0이면 미중복,count가 1이면 중복)
	public int checkId(String me_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		try {
			//JDBC 수행 1,2단계
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT me_id FROM member WHERE me_id=?";
			//JDBC 수행 3단계
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, me_id);
			//JDBC 수행 4단계
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = 1;//아이디 중복
			}
		}catch(Exception e) {
			count = 2;//오류 발생
			e.printStackTrace();
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	//사용자 회원 가입
	public void insertMember(String me_id,String me_passd,
			               String me_name,String me_phone) {
		
	}
	//사용자 로그인 체크
	public boolean loginCheck(String me_id,String me_passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			//JDBC 수행 1,2단계
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT me_id FROM member WHERE me_id=? AND me_passwd=?";
			//JDBC 수행 3단계
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, me_id);
			pstmt.setString(2, me_passwd);
			//JDBC 수행 4단계
			rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return flag;
	}
	//사용자 도서 대출 여부 확인(도서번호(bk_num)로 검색해서 re_status의 값이 0이면
	//대출 가능, 1이면 대출 불가능)
	public int getStatusReservation(int bk_num) {
		int count = -1;
		
		//sbook , reservation 조인
		
		return count;
	}
	//사용자 도서 대출 등록
	public void insertReservation(int bk_num,String me_id) {
		
	}
	//사용자 MY대출 목록 보기(현재 대출한 목록만 표시)
	public void selectMyList(String me_id) {
		
	}
	//사용자 반납 가능 여부(대출번호(re_num)와 회원아이디(me_id)를 함께 
	//조회해서 re_status가 1인 것은 반납 가능 re_status가 0이면 반납 불가능)
	public int getStatusBack(int re_num,String me_id) {
		int count = -1;
		
		//reservation 사용
		
		return count;
	}
	
	//사용자 반납 처리
	public void updateReservation(int re_num) {
		
	}
}






