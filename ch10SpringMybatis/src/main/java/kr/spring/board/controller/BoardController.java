package kr.spring.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.service.BoardService;
import kr.spring.board.vo.BoardVO;
import kr.spring.util.PagingUtil;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	//로그 처리(로그 대상 지정)
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	//유효성 체크를 위한 자바빈(VO) 초기화
	@ModelAttribute
	public BoardVO initCommand(){
		return new BoardVO();
	}
	
	//글쓰기 폼 호출
	@GetMapping("/insert.do")
	public String form() {
		return "insertForm";
	}
	//전송된 데이터 처리
	@PostMapping("/insert.do")
	public String submit(@Valid BoardVO vo, BindingResult result) {

		log.debug("<<BoardVO>> : " + vo);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		//글쓰기
		boardService.insertBoard(vo);
		
		return "redirect:/list.do";
	}
	
	@RequestMapping("/list.do")
	public ModelAndView getList(@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
		//총레코드 수
		int count = boardService.selectBoardCount();
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage,count,20,10,"list.do");
		
		//목록 호출
		List<BoardVO> list = null;
		if(count > 0) {
			Map<String,Integer> map = new HashMap<>();
			map.put("start",page.getStartRow());
			map.put("end",page.getEndRow());
			list = boardService.selectBoardList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		//뷰 이름 설정
		mav.setViewName("selectList");
		//데이터 저장
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("page",page.getPage());
		
		return mav;
	}
	//글 상세
	@RequestMapping("detail.do")
	public ModelAndView detail(int num) {
		BoardVO board = boardService.selectBoard(num);
		
		return new ModelAndView("selectDetail","board", board);
	}
}