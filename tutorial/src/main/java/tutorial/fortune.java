package tutorial;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class fortune extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");

		PrintWriter out = resp.getWriter();

		int number = 1 + (int) (Math.random() * 9); // 1 ~ 9

		String[] colors = "빨강,주황,노랑,초록,파랑".split(",");
		String color = colors[(int) (Math.random() * colors.length)];

		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<title>오늘의 운세</title>");
		out.print("</head>");
		out.print("<body>");
		if (Math.random() > 0.5) {
			out.print("<h2 style='color:green'>오늘은 기회와 도전이 가득한 날</h2>");
		} else {
			out.print("<h2 style='color:hotpink'>오늘은 행복과 만남이 가득한 날</h2>");
		}

		out.print("<p>행운의 숫자는 " + number + " 이고, 행운의 색깔은 " + color + "색이니 참고하세요.</p>");
		out.print("<p>오늘 하루 기쁨의 순간들을 즐기세요.</p>");
		out.print("</body>");
		out.print("</html>");
		out.close();
	}

}
