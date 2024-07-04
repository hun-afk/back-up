package controller.study;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.vo.Student;

@WebServlet("/study/about-core-2")
public class AboutCore2Controller extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setAttribute("message", "<h2>하이하이</h2");
		request.setAttribute("body", "<script>window.alert('ㅋㅋㅋㅋㅋ')</script>");
		
		List<Student> students = 
				List.of(
						new Student("22-70002801", "길형민", "항공정비", 21),
						new Student("23-54641378", "박원화", "항공정비", 20), 
						new Student("21-12202807", "김도훈", "항공정비", 22)
					);

		request.setAttribute("students", students);
		
		
		
		request.getRequestDispatcher("/WEB-INF/view/study/about-core-2.jsp").forward(request, response);
	}

}
