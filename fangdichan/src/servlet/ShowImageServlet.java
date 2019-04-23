package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ShowImageServlet")
public class ShowImageServlet extends HttpServlet {

    private static final String JPG="image/jpeg;charset=GB2312";
    
    /**
     * get方法
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 本地文件路径
    	String url =  request.getParameter("url");
    	System.out.println(url);
        String filePath = "E:\\毕业设计\\houseImages\\"+url;
        File file = new File(filePath);
        // 获取输出流
        OutputStream outputStream = response.getOutputStream();
        FileInputStream fileInputStream = new FileInputStream(file);
        // 读数据
        byte[] data = new byte[fileInputStream.available()];
        fileInputStream.read(data);
        fileInputStream.close();
        // 回写
        response.setContentType(JPG);
        outputStream.write(data);
        outputStream.flush();
        outputStream.close();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}