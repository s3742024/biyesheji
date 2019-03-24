package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import net.sf.json.JSONObject;
import service.TransactionService;
import util.UUIDUtils;

@WebServlet("/HouseImage")
public class HouseImage extends HttpServlet {

	public HouseImage() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JSONObject json = new JSONObject();
		String houseBaseId = request.getHeader("houseBaseId");

		ArrayList<bean.HouseImage> houseImages = new ArrayList<bean.HouseImage>();

		FileItemFactory factory = new DiskFileItemFactory();

		// 创建文件上传处理器
		ServletFileUpload upload = new ServletFileUpload(factory);

		// 开始解析请求信息
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 对所有请求信息进行判断
		Iterator<FileItem> iter = items.iterator();
		while (iter.hasNext()) {
			FileItem item = (FileItem) iter.next();
			// 信息为普通的格式
			if (item.isFormField()) {
				String fieldName = item.getFieldName();
				String value = item.getString();
				request.setAttribute(fieldName, value);
			}
			// 信息为文件格式
			else {
				String suffix = item.getName().substring(item.getName().lastIndexOf(".") + 1);
				String fileName = UUIDUtils.getUUID()+"."+suffix;
				bean.HouseImage houseImage = new bean.HouseImage(fileName, "1", null, houseBaseId);
				houseImages.add(houseImage);
				String basePath = "E:\\毕业设计\\houseImages";
				File file = new File(basePath, fileName);
				try {
					item.write(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		TransactionService transactionService = new TransactionService();
		if (transactionService.updateHouseImages(houseImages) == true) {
			json.put("code", 0);
			json.put("message", "修改成功");
		} else {
			json.put("code", 1);
			json.put("message", "修改失败");
		}
		out.print(json);
		out.close();
	}

}
