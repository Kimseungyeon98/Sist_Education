package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		String emailForm = request.getParameter("emailForm");
		email+="@"+emailForm;
		String password = request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		
		if(email.equals("tmddus@naver.com")&&password.equals("1234")) {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>로그인 성공</title>");
			out.println("</head>");
			out.println("<body>");
			
			out.println(email+"님 반갑습니다.");
			
			out.println("</body>");
			out.println("</html>");
		} else {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>로그인 실패</title>");
			out.println("</head>");
			out.println("<body>");
			
			out.println("로그인에 실패하셨습니다.");
			
			out.println("</body>");
			out.println("</html>");
		}
		
	}
}
