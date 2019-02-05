package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.userLogin;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("post");
		request.setCharacterEncoding("utf-8");
		String userNickname=request.getParameter("uname");
		String userPassword=request.getParameter("upwd");
		User loginUser=new User(userNickname,userPassword);
		int result=userLogin.login(loginUser);
		if(result>0) {
			System.out.print("成功");
			HttpSession session=request.getSession();
			session.setAttribute("userNickname","董涛");
		}else {
			System.out.print("失败");
		}
		response.sendRedirect("index.jsp");
	}

}
