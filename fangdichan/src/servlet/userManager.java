package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.RealInfo;
import service.UserService;

@WebServlet("/userManager")
public class userManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public userManager() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
//		PrintWriter out=response.getWriter();
//		String a= request.getSession().getServletContext().getRealPath("c_editNickName") ;
//		System.out.println(a);
//		
//		out.write("123");
//		out.close();
		String method = request.getParameter("method");// 得到传入的值下面根据传入的值执行不同的方法！！
		System.out.println("method" + method);
		if ("editPwd".equals(method)) {
			editPwd(request, response);// 执行login代码
		} else if("editNickname".equals(method)){
			// zhuce(request, response);//执行注册代码
			UpdateNickname(request, response);
		}else if("updateRealInfo".equals(method)){
			updateRealInfo(request, response);
		}else if("CheckRealInfo".equals(method)){
			CheckRealInfo(request, response);
		}
	}

	private void editPwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		String nickname = request.getParameter("nickname");
		String pwd = request.getParameter("password");
		boolean isSuccess = userService.EditPassword(nickname, pwd);
		PrintWriter out = response.getWriter();
		if (isSuccess) {
			out.print("修改成功");
		} else {
			out.print("修改失败");
		}
		out.close();
	}
	private void UpdateNickname(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserService userService = new UserService();
		String nickname = request.getParameter("nickname");
		String alterNickname = request.getParameter("alterNickname");
		int res = userService.UpdateNickname(nickname, alterNickname);
		PrintWriter out = response.getWriter();
		if (res==1) {
			out.print("修改成功");
			session.setAttribute("userNickname",alterNickname);
		} else if(res==0) {
			out.print("该昵称已存在");
		}else {
			out.print("修改失败");
		}
		out.close();
	}
	private void CheckRealInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UserService userService = new UserService();
		boolean isSuccess = userService.CheckRealInfo(request.getParameter("nickname"));
		if (!isSuccess) {
			out.print(true);
		} else {
			out.print(false);
		}
		out.close();
	}
	private void updateRealInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UserService userService = new UserService();
		RealInfo realInfo=new RealInfo(request.getParameter("realName"), request.getParameter("idCardNum"), request.getParameter("occupation"));
		int res = userService.UpdateRealInfo(request.getParameter("nickname"), realInfo);
		if (res==1) {
			out.print("更新成功");
		} else if(res==0) {
			out.print("信息已存在，不可修改");
		}else {
			out.print("更新失败");
		}
		out.close();
	}
}
