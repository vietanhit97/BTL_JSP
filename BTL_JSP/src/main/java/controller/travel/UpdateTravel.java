package controller.travel;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TravelDaoImp;
import entity.Travels;

/**
 * Servlet implementation class UpdateTravel
 */
@WebServlet("/UpdateTravel")
public class UpdateTravel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTravel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("trId"));
		String nameString = request.getParameter("name");
		float price = Float.parseFloat(request.getParameter("price"));
		int days = Integer.parseInt(request.getParameter("days"));
		int catId= Integer.parseInt(request.getParameter("catId"));
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sFormat.parse(request.getParameter("startDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Travels travels = new Travels();
		travels.setTrId(id);
		travels.setName(nameString);
		travels.setPrice(price);
		travels.setDays(days);
		travels.setCatId(catId);
		travels.setStartDate(date);
		boolean bl = new TravelDaoImp().edit(travels);
		if (bl) {
			response.sendRedirect("admin/travel/index.jsp");
		}else {
			request.getRequestDispatcher("admin/travel/updateTravel.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
