package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;


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
		HttpSession session=request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userNickname=request.getParameter("uname");
		String userPassword=request.getParameter("upwd");
//		User loginUser=new User(userNickname,userPassword);
		UserService userService=new UserService();
		int result=userService.UserLoginCheck(userNickname, userPassword);
		if(result==1) {
			System.out.print("登陆成功");
			PrintWriter out=response.getWriter();
			out.println("<h2>出来了吗</h2>");
			session.setAttribute("userNickname","yxzt");
			
		}else if(result==0){
			session.setAttribute("msg","账号已被封禁");
			System.out.print("账号已被封禁");
		}else {
			session.setAttribute("msg","用户名或密码错误");
			System.out.print("用户名或密码错误");
		}
		response.sendRedirect("index.jsp");
		//request.getRequestDispatcher("/index.jsp").forward(request,response);
	}

}
