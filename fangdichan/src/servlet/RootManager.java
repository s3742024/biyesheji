package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.HouseBase;
import bean.RealInfo;
import bean.SellAudit;
import bean.SellInfo;
import bean.User;
import net.sf.json.JSONObject;
import service.RootService;


@WebServlet("/backManager/RootManager")
public class RootManager extends HttpServlet {

    public RootManager() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String method = request.getParameter("method");// 得到传入的值下面根据传入的值执行不同的方法！！
		System.out.println("method" + method);
		if ("queryUserInfo".equals(method)) {
			queryUserInfo(request, response);
		}else if ("queryPersonalData".equals(method)) {
			queryPersonalData(request, response);
		}else if ("QueryAllHouseBase".equals(method)) {
			QueryAllHouseBase(request, response);
		}else if ("QueryAllToBeAudited".equals(method)) {
			QueryAllToBeAudited(request, response);
		}else if ("audit".equals(method)) {
			audit(request, response);
		}
	}
	private void queryUserInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JSONObject json=new JSONObject();
		RootService rootService=new RootService();
		ArrayList<User> users = rootService.QueryAllUser();
		if(users!=null) {
			json.put("code",0);
			json.put("data",users);
		}else {
			json.put("code",1);
		}
		out.print(json);
		out.close();
	}
	private void UpdateUserInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JSONObject json=new JSONObject();
		User user=new User(request.getParameter("userId"), 
				null,
				null,
				null,
				null,
				null,
				request.getParameter("userType"), 
				request.getParameter("managerRemarks")
				);
		RootService rootService=new RootService();
		
		if(rootService.UpdateUserInfo(user)) {
			json.put("code",0);
			json.put("message","修改成功");
		}else {
			json.put("code",1);
			json.put("message","修改失败");
		}
		out.print(json);
		out.close();
	}
	private void queryPersonalData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JSONObject json=new JSONObject();
		RootService rootService=new RootService();
		ArrayList<RealInfo> realInfo = rootService.queryPersonalData();
		if(realInfo!=null) {
			json.put("code",0);
			json.put("data",realInfo);
		}else {
			json.put("code",1);
			json.put("message","查询失败");
		}
		out.print(json);
		out.close();
	}
	private void QueryAllHouseBase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JSONObject json=new JSONObject();
		RootService rootService=new RootService();
		ArrayList<HouseBase> houseBases= rootService.QueryAllHouseBase();
		if(houseBases!=null) {
			json.put("code",0);
			json.put("data",houseBases);
		}else {
			json.put("code",1);
			json.put("message","查询失败");
		}
		out.print(json);
		out.close();
	}
	private void QueryAllToBeAudited(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JSONObject json=new JSONObject();
		RootService rootService=new RootService();
		ArrayList<SellInfo> sellInfos= rootService.QueryAllToBeAudited();
		if(sellInfos!=null) {
			json.put("code",0);
			json.put("data",sellInfos);
		}else {
			json.put("code",1);
			json.put("message","查询失败");
		}
		out.print(json);
		out.close();
	}
	private void audit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JSONObject json=new JSONObject();
		SellAudit sellAudit=new SellAudit(request.getParameter("sellInfoId"), 
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()),
				request.getParameter("auditStatus"),
				request.getParameter("auditorId"),
				request.getParameter("auditorRemark")
				);
		RootService rootService=new RootService();
		if(rootService.updateSellAudit(sellAudit)) {
			json.put("code",0);
			json.put("message","审核成功");
		}else {
			json.put("code",1);
			json.put("message","审核事件失败");
		}
		out.print(json);
		out.close();
	}
}
