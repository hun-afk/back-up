package tutorial;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Guugudan.h2")
public class Gugudan extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		int number = 2+(int)(Math.random()*8);
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<title>랜덤 구구단</title>");
		out.print("</head>");
		out.print("<body>");
		
		out.println("<h2>구구단 학습</h2>");
		out.println("<p>이번에 학습할 단은 " + number + "단입니다.</p>");
		out.println("<p>");
		for (int i = 1; i<10; i++) {
			System.out.println( number +" * " +  i  + " = " + number * i + "<br/>");
		}
		out.println("</ul>");
		out.println("<a href=\"https://www.w3schools.com\">This is a link</a>");
		out.println("</p>");
		out.print("</body>");
		out.print("</html>");
		out.close();
	}

}
