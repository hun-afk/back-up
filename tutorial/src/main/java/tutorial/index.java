package tutorial;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class index extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String addr = req.getRemoteAddr(); // 요청보낸 클라이언트의 ip address
		System.out.println("Hello service) called" + addr);
		
		PrintWriter out = resp.getWriter();
		out.println("환영합니다 나의 집에 오신것을");
		out.println("부족합니다 아직은 많이");
		
		out.close();
	}
}
