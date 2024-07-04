package tutorial;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/pizza")
public class PizzaShare extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String query = req.getQueryString();	// ? 뒷부분 의 전체 문자열을 추출
		System.out.println("query : " + query);	// 없으면 null 이 뜸.
		// 특정이름으로 넘어온 밸류를 확인하려면...? split 를 직접할 필요는 없다.
		// WAS 가 queryString 을 분석해서 Map 형태로 처리를 해두기 때문에. 
		req.getParameterMap();
		String slice = req.getParameter("slice");	// 이름(키)만 주고 해당하는 이름의 값을 얻어낼수 있다.
													// 전부 String 으로 저장을 하고 있다.
		System.out.println(slice);
		String n = req.getParameter("n");
		if (slice == null || n == null) {
			
		} else {
			int islice = Integer.parseInt(slice);
			int iN = Integer.parseInt(n);
			int answer;
	        if(iN % islice == 0) {
	        	answer = iN / islice;
	        	out.println("정답은 " + answer + "입니다.");
	        } else {
	        	answer = iN / islice + 1;
	        	out.println("정답은 " + answer + "입니다.");
	        }
		}
		
		
	}
}
