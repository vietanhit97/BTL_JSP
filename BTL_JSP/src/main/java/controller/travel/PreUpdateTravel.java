package controller.travel;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDaoImp;
import dao.TravelDaoImp;
import entity.Categories;
import entity.Travels;

/**
 * Servlet implementation class PreUpdateTravel
 */
@WebServlet("/PreUpdateTravel")
public class PreUpdateTravel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreUpdateTravel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		Travels travels = new TravelDaoImp().getById(id);
		List<Categories> categories = new CategoryDaoImp().getAll();
		request.setAttribute("list", categories);
		request.setAttribute("tr", travels);
		request.getRequestDispatcher("admin/travel/updateTravel.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
