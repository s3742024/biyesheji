package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.HouseBase;
import bean.SellInfo;
import net.sf.json.JSONObject;
import service.TransactionService;

@WebServlet("/SellServlet")
public class SellServlet extends HttpServlet {

	public SellServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
//		
//		PrintWriter out=response.getWriter();
//
//		
//		out.write("{\r\n" + 
//				"  \"code\": 0\r\n" + 
//				"  ,\"msg\": \"\"\r\n" + 
//				"  ,\"data\": {\r\n" + 
//				"    \"src\": \"http://cdn.layui.com/123.jpg\"\r\n" + 
//				"  }\r\n" + 
//				"}  ");
//		out.close();
		String method = request.getParameter("method");// 得到传入的值下面根据传入的值执行不同的方法！！
		System.out.println("method" + method);
		if ("baseInfo".equals(method)) {
			baseInfo(request, response);
		}else if ("getHouseBases".equals(method)) {
			getHouseBases(request, response);
		}else if ("houseInfo".equals(method)) {
			updateHouseInfo(request, response);
		}

	}

	private void baseInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HouseBase houseBase=new HouseBase(request.getParameter("pId"), 
		request.getParameter("detailPosition"), 
		request.getParameter("maxFloorNum"), 
		request.getParameter("constructionArea"), 
		request.getParameter("houseLayout"), 
		request.getParameter("houseOrientation"), 
		request.getParameter("houseOrientation"), 
		request.getParameter("decorationDegree"), 
		request.getParameter("mortgageStatus"), 
		request.getParameter("completionDate"), 
		request.getParameter("eastLongitude"), 
		request.getParameter("northLatitude"));
		SellInfo sellInfo = new SellInfo(houseBase.getHouseBaseId(), 
				request.getParameter("sellTitle"), 
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()), //当前时间
				null,//用户id留空
				request.getParameter("sellPrice"), 
				request.getParameter("sellPoint"), 
				request.getParameter("sellMentality"), 
				null);
		TransactionService transactionService=new TransactionService();
		if(transactionService.updateHouseInfo(houseBase,sellInfo,request.getParameter("nickname"))) {
			out.print("添加成功");
		}else {
			out.print("添加失败");
		}
		out.close();
	}
	private void getHouseBases(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		TransactionService transactionService=new TransactionService();
		SellInfo[] sellInfos=transactionService.GetHouseBases(request.getParameter("nickname"));
		JSONObject json=new JSONObject();
		if(sellInfos!=null) {
			json.put("msg","true");
			json.put("sellInfos",sellInfos);
		}else {
			json.put("msg","false");
		}
		out.print(json);
		out.close();
	}
	private void updateHouseInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HouseBase houseBase=new HouseBase(request.getParameter("pId"), 
		request.getParameter("detailPosition"), 
		request.getParameter("maxFloorNum"), 
		request.getParameter("constructionArea"), 
		request.getParameter("houseLayout"), 
		request.getParameter("houseOrientation"), 
		request.getParameter("houseOrientation"), 
		request.getParameter("decorationDegree"), 
		request.getParameter("mortgageStatus"), 
		request.getParameter("completionDate"), 
		request.getParameter("eastLongitude"), 
		request.getParameter("northLatitude"));
		SellInfo sellInfo = new SellInfo(houseBase.getHouseBaseId(), 
				request.getParameter("sellTitle"), 
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()), //当前时间
				null,//用户id留空
				request.getParameter("sellPrice"), 
				request.getParameter("sellPoint"), 
				request.getParameter("sellMentality"), 
				null);
		sellInfo.setHouseBase(houseBase);//添加进去
		TransactionService transactionService=new TransactionService();
		if(transactionService.updateHouseInfo(sellInfo,request.getParameter("nickname"))) {
			out.print("添加成功");
		}else {
			out.print("添加失败");
		}
		out.close();
	}
	
}
