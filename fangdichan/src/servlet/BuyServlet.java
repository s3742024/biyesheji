package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.SellInfo;
import net.sf.json.JSONObject;
import service.TransactionService;

@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {

	public BuyServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String method = request.getParameter("method");// 得到传入的值下面根据传入的值执行不同的方法！！
		System.out.println("method" + method);
		if ("default".equals(method)) {
			queryDefault(request, response);
		}
	}
	private void queryDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JSONObject json=new JSONObject();
		int page = Integer.parseInt(request.getParameter("page"));;
		int num = Integer.parseInt(request.getParameter("num"));
		TransactionService transactionService = new TransactionService();
		SellInfo[] sellInfos = transactionService.QuerySellInfo(page, num);
		if(sellInfos!=null) {
			json.put("code",0);
			json.put("data",sellInfos);
		}else {
			json.put("code",1);
		}
		out.print(json);
		out.close();
	}
}
