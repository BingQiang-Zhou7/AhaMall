package zhou.servlet;

import zhou.database.*;
import zhou.dao.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CommentCommodityPageServlet
 */
@WebServlet("/CommentCommodityPageServlet")
public class CommentCommodityPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentCommodityPageServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		//获取商品信息
		String commodityID = request.getParameter("commodityID");
		String orderID = request.getParameter("orderID");
		User user = (User)session.getAttribute("userInfo");
		String logout = request.getParameter("logout");
		if(user != null)
		{
		//	System.out.println(logout);
			if(logout != null && logout.equals("1"))
			{
				session.setAttribute("userInfo",null);
			}
		}
		Commodity commodity = new DataProcess(this.getServletContext().getInitParameter("DBName")).SearchOrderCommodityByID(commodityID,orderID);
		request.setAttribute("commodity", commodity);
		
		
		request.getRequestDispatcher("pages/commentCommodity/commentCommodity.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
