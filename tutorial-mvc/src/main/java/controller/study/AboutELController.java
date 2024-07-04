package controller.study;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.vo.Soldier;
import model.vo.Student;

@WebServlet("/study/about-el")
public class AboutELController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Map<String, Integer> map = new HashMap<>();

		map.put("total", 127);
		map.put("start", 11);
		map.put("end", 20);

		request.setAttribute("pages", map);

		Soldier s = new Soldier("22-70002801", "박원화", 1111);
		request.setAttribute("soldier", s);

		Student std = new Student("22-70002801", "박원화", "항공정비", 20);
		request.setAttribute("student", std);

		String[] cates = new String[] { "일반행정", "통계", "문화/역사" };
		request.setAttribute("category", cates);

		List<Student> students = 
				List.of(
						new Student("22-70002801", "길형민", "항공정비", 20),
						new Student("22-70002801", "박원화", "항공정비", 20), 
						new Student("22-70002801", "김도훈", "항공정비", 20)
					);

		request.setAttribute("students", students);
		
		
		request.getRequestDispatcher("/WEB-INF/view/study/about-el.jsp").forward(request, response);
	}
}
