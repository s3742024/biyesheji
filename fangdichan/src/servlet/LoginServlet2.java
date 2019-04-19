package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.RootService;


@WebServlet("/backManager/LoginServlet2")
public class LoginServlet2 extends HttpServlet {
    public LoginServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userNickname=request.getParameter("uname");
		String userPassword=request.getParameter("upwd");
		RootService rootService=new RootService();
		Boolean issuccess=rootService.ManagerLoginCheck(userNickname, userPassword);
		if(issuccess) {
			session.setAttribute("msg","登录成功");
			session.setAttribute("managerId",1001);
		}else {
			session.setAttribute("msg","用户名或密码错误");
		}
		response.sendRedirect("backManagerIndex.jsp");
		//request.getRequestDispatcher("/index.jsp").forward(request,response);
	}

}
