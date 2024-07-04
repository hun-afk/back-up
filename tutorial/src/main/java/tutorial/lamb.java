package tutorial;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/lamb")
public class lamb extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String query = req.getQueryString();
		System.out.println("query : " + query);
		req.getParameterMap();
		String n = req.getParameter("n"); // 이름(키)만 주고 해당하는 이름의 값을 얻어낼수 있다.
		String k = req.getParameter("k"); // 전부 String 으로 저장을 하고 있다.

		resp.setContentType("text/html;charset=UTF-8");
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>양꼬치 계산</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>양꼬치 계산기</h2>");
		out.println("<p>양꼬치는 1인분에 12,000원, 음료수는 2,000원입니다.<p>");
		out.println("<p>10인분을 먹으면 음료수 하나를 서비스로 줍니다.</p>");

		if (n == null || k == null) {
			out.println("<p>사람수 (n) 와 음료수(k)를 다시 작성해주세요.</p>");
		} else {
			int nn = Integer.parseInt(n);
			int kk = Integer.parseInt(k);
			out.println("<ul>");
		        int bonus = nn/10;
		        int price = 12000*nn + 2000*(kk - bonus);
		        out.println("</ul>");
		        out.println("양꼬치 <b>" + nn +"</b>분과 음료수 <b>" + kk +"</b>개를 먹었다면");
				out.println("<p>내야하는 금액은 <b>" + String.format("%,d", price) +"</b>입니다.</p>");
			}
		
	}
}
