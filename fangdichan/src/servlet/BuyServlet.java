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

import bean.Contact;
import bean.Purchase;
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
		}else if ("buyContextInfo".equals(method)) {
			buyContextInfo(request, response);
		}
	}
	private void queryDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JSONObject json=new JSONObject();
		int page = Integer.parseInt(request.getParameter("page"));;
		int num = Integer.parseInt(request.getParameter("num"));
		int minPrice = Integer.parseInt(request.getParameter("minPrice")) ;
		int maxPrice = Integer.parseInt(request.getParameter("maxPrice")) ;
		int minArea = Integer.parseInt(request.getParameter("minArea")) ;
		int maxArea = Integer.parseInt(request.getParameter("maxArea")) ;
		TransactionService transactionService = new TransactionService();
		SellInfo[] sellInfos = transactionService.QuerySellInfoAlter(page, num,minPrice,maxPrice,minArea,maxArea);
		if(sellInfos!=null) {
			json.put("code",0);
			json.put("data",sellInfos);
		}else {
			json.put("code",1);
		}
		out.print(json);
		out.close();
	}
	private void buyContextInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JSONObject json=new JSONObject();
		TransactionService transactionService=new TransactionService();
		Contact contact = new Contact(request.getParameter("contactCall"), request.getParameter("contactPhone"));
		Purchase purchase = new Purchase(request.getParameter("sellInfoId"),new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()), request.getParameter("purchaseUserId"), request.getParameter("purchaseRemarks"));
		purchase.setContact(contact);
		Contact contact2 = transactionService.InputPurchaseInfo(purchase, request.getParameter("userNickname"));
		if(contact2 !=null){
			json.put("code",0);
			json.put("data",contact2);
		}else {
			json.put("code",1);
		}
		out.print(json);
		out.close();
	}
}
