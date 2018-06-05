package zhou.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zhou.database.DataProcess;

/**
 * Servlet implementation class CommentCommodityServlet
 */
@WebServlet("/CommentCommodityServlet")
public class CommentCommodityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentCommodityServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		String commodityID = request.getParameter("commodityID");
		String orderID = request.getParameter("orderID");
		String content = request.getParameter("content");
//		System.out.println(commodityID);
//		System.out.println(orderID);
//		System.out.println(content);
		new DataProcess(this.getServletContext().getInitParameter("DBName")).CommentCommodity(orderID, content, commodityID);
		response.sendRedirect("pages/comment/comment.jsp?commodityID="+commodityID);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
