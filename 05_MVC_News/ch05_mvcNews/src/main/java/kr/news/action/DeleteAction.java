package kr.news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;
import kr.util.FileUtil;

public class DeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		//전송된 데이터 반환
		int num = Integer.parseInt(
				request.getParameter("num"));
		String passwd = request.getParameter("passwd");

		NewsDAO dao = NewsDAO.getInstance();
		//비밀번호 일치 여부 확인을 위해 글 번호로 한
		//건의 레코드를 반환받은 후 비밀번호 인증 작업
		//수행
		NewsVO db_news = dao.getNews(num);
		boolean check = false;
		if(db_news!=null) {
			//비밀번호 인증
			check = db_news.isCheckedPassword(passwd);
		}
		if(check) {//비밀번호 일치
			//글 삭제
			dao.deleteNews(num);
			//파일 삭제
			FileUtil.removeFile(request, db_news.getFilename());
		}
		//UI 처리를 위해서 check 저장
		request.setAttribute("check", check);
		//JSP 경로 반환
		return "/WEB-INF/views/delete.jsp";
	}

}










