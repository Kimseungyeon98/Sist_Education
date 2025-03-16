package kr.story.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.story.vo.StoryVO;
import kr.util.DBUtil;

public class StoryDAO {
	//싱글턴 패턴
	private static StoryDAO instance = new StoryDAO();

	public static StoryDAO getInstance(){
		return instance;
	}

	private StoryDAO(){}

	//글 저장
	public void insert(StoryVO vo)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try{
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();

			//SQL문
			sql = "INSERT INTO story (snum,title,"
					+ "content,ip,num) "
					+ "VALUES (story_seq.nextval,?,?,?,?)";

			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getIp());
			pstmt.setInt(4, vo.getNum());

			//SQL문 실행
			pstmt.executeUpdate();

		}catch(Exception e){
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//글의 총 갯수
	public int getCount()throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;

		try{
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "select count(*) from story";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//SQL문을 실행해서 결과행을 ResultSet에 담음
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		}catch(Exception e){
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	//글 목록
	public List<StoryVO> getList(int startRow, int endRow)
			throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StoryVO> list = null;
		String sql = null;

		try{
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT * FROM (SELECT a.*, rownum rnum "
					+ "FROM(SELECT * FROM story JOIN semployee USING(num) ORDER BY "
					+ "snum DESC)a) WHERE rnum >= ? AND rnum <= ?";
			//PreparedStatement 객체
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			//SQL문 실행하고 결과행을 ResultSet에 담음
			rs = pstmt.executeQuery();
			list = new ArrayList<StoryVO>();
			while(rs.next()){
				StoryVO vo = new StoryVO();
				vo.setSnum(rs.getInt("snum"));
				vo.setTitle(rs.getString("title"));
				vo.setReg_date(rs.getDate("reg_date"));
				vo.setId(rs.getString("id"));

				//자바빈을 ArrayList에 등록
				list.add(vo);
			}
		}catch(Exception e){
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	//글 상세
	public StoryVO getStory(int snum)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoryVO vo = null;
		String sql = null;

		try{
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT * FROM story s JOIN semployee USING(num) WHERE snum=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 매칭
			pstmt.setInt(1, snum);
			//SQL문 반영하고 결과행을 ResultSet에 담음
			rs = pstmt.executeQuery();

			if(rs.next()){
				vo = new StoryVO();
				vo.setSnum(rs.getInt("snum"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setIp(rs.getString("ip"));
				vo.setReg_date(rs.getDate("reg_date"));
				vo.setNum(rs.getInt("num"));
				vo.setId(rs.getString("id"));
			}
		}catch(Exception e){
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return vo;
	}
	//글 수정
	public void update(StoryVO vo)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;

		try{
			//커넥션풀로부터 커넥션을 반환
			conn = DBUtil.getConnection();
			//SQL문 작성
			//name,email,content,ip 변경 가능 num으로 식별
			sql = "UPDATE story SET title=?, "
					+ "content=?,ip=? WHERE snum=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 매칭
			pstmt.setString(++cnt, vo.getTitle());
			pstmt.setString(++cnt, vo.getContent());
			pstmt.setString(++cnt, vo.getIp());
			pstmt.setInt(++cnt, vo.getSnum());
			//SQL문 반영
			pstmt.executeUpdate();

		}catch(Exception e){
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//글 삭제
	public void delete(int snum)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try{
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "DELETE FROM story WHERE snum=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 값 매칭
			pstmt.setInt(1, snum);
			//SQL문 반영
			pstmt.executeUpdate();
		}catch(Exception e){
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}

	}
}




