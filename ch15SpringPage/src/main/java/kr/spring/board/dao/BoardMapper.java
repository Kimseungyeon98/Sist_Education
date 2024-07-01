package kr.spring.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.board.vo.BoardVO;

@Mapper
public interface BoardMapper {
	//부모글
	// XML
	public List<BoardVO> selectList(Map<String,Object> map);
	// XML
	public Integer selectRowCount(Map<String,Object> map);
	// XML
	public void insertBoard(BoardVO board);
	// XML
	public BoardVO selectBoard(Long board_num);
	// XML
	public void updateHit(Long board_num);
	// XML
	public void updateBoard(BoardVO board);
	public void deleteBoard(Long board_num);
	// XML
	public void deleteFile(Long board_num);
	//부모글 좋아요
	
	//댓글
	
	//댓글 좋아요
	
	//답글
}
