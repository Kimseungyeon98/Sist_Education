package kr.spring.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.board.vo.BoardFavVO;
import kr.spring.board.vo.BoardReFavVO;
import kr.spring.board.vo.BoardReplyVO;
import kr.spring.board.vo.BoardResponseVO;
import kr.spring.board.vo.BoardVO;

@Mapper
public interface BoardMapper {
	//부모글
	public List<BoardVO> selectList(Map<String,Object> map);
	public Integer selectRowCount(Map<String,Object> map);
	public void insertBoard(BoardVO board);
	public BoardVO selectBoard(Long board_num);
	public void updateHit(Long board_num);
	public void updateBoard(BoardVO board);
	public void deleteBoard(Long board_num);
	public void deleteFile(Long board_num);
	
	
	//부모글 좋아요
	public BoardFavVO selectFav(BoardFavVO fav);
	public Integer selectFavCount(Long board_num);
	public void insertFav(BoardFavVO fav);
	public void deleteFav(BoardFavVO fav);
	public void deleteFavByBoardNum(Long board_num);
	
	
	//댓글

	public List<BoardReplyVO> selectListReply(Map<String, Object> map);
	public Integer selectRowCountReply(Map<String, Object> map);
	public BoardReplyVO selectReply(Long re_num);
	public void insertReply(BoardReplyVO boardReply);
	public void updateReply(BoardReplyVO boardReply);
	public void deleteReply(Long re_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	public void deleteReplyByBoardNum(Long board_num);
	//부모글 삭제시 댓글의 답글이 존재하면 댓글 번호를 구해서 답글 삭제시 사용
	public List<Long> selectReNumsByBoard_num(Long board_num);

	
	//댓글 좋아요
	@Select("SELECT * FROM spreply_fav WHERE re_num=#{re_num} AND mem_num=#{mem_num}")
	public BoardReFavVO selectReFav(BoardReFavVO fav);
	@Select("SELECT COUNT(*) FROM spreply_fav WHERE re_num=#{re_num}")
	public Integer selectReFavCount(Long re_num);
	@Insert("INSERT INTO spreply_fav (re_num,mem_num) VALUES(#{re_num},#{mem_num})")
	public void insertReFav(BoardReFavVO fav);
	@Delete("DELETE FROM spreply_fav WHERE re_num=#{re_num} AND mem_num=#{mem_num}")
	public void deleteReFav(BoardReFavVO fav);
	@Delete("DELETE FROM spreply_fav WHERE re_num=#{re_num}")
	public void deleteReFavByReNum(Long re_num);
	@Delete("DELETE FROM spreply_fav WHERE re_num IN (SELECT re_num FROM spboard_reply WHERE board_num=#{board_num}")
	public void deleteReFavByBoardNum(Long board_num);
	
	//답글
	public List<BoardResponseVO> selectListResponse(Long re_num);
	public BoardResponseVO selectResponse(Long te_num);
	public void insertResponse(BoardResponseVO boardResponse);
	public void updateResponse(BoardResponseVO boardResponse);
	public void deleteResponse(Long te_num);
	//댓글 삭제시 자식글인 답글을 모두 삭제
	public void deleteResponseByReNum(Long re_num);
	public void deleteResponseByBoardNum(Long board_num);
	
}