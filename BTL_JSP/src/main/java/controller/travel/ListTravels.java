package controller.travel;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.TravelDaoImp;
import entity.Travels;

/**
 * Servlet implementation class ListTravels
 */
@WebServlet("/ListTravels")
public class ListTravels extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static TravelDaoImp travelDaoImp;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListTravels() {
        super();
        travelDaoImp = new TravelDaoImp();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int index = Integer.parseInt(request.getParameter("index"));
		int count = travelDaoImp.count();
		int pageSize = 4 ;
		int endPage = 0 ;
		endPage = count/pageSize;
		if(count % pageSize !=0) {
			endPage++;
		}
		List<Travels> dataListPaginate = travelDaoImp.getPaginate(index);
		request.setAttribute("list",dataListPaginate );
		request.setAttribute("endPage", endPage);
		request.setAttribute("index", index);
		request.getRequestDispatcher("admin/travel/travels.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
