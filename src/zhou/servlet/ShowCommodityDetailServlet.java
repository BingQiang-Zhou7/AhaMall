package zhou.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zhou.dao.Comment;
import zhou.dao.Commodity;
import zhou.dao.User;
import zhou.database.DataProcess;

/**
 * Servlet implementation class ShowCommodityDetailServlet
 */
@WebServlet("/ShowCommodityDetailServlet")
public class ShowCommodityDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowCommodityDetailServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//退出登录
		String logout = request.getParameter("logout");
		User user = (User)session.getAttribute("userInfo");
		if(user != null)
		{
		//	System.out.println(logout);
			if(logout != null && logout.equals("1"))
			{
				session.setAttribute("userInfo",null);
			}
		}
		
		String commodityId = request.getParameter("commodityID");
		if (commodityId != null) {
			//获取商品相关信息
			Commodity commodity = new DataProcess(this.getServletContext().getInitParameter("DBName")).SearchCommodityByID(commodityId);
			request.setAttribute("commodity", commodity);
			
			//获取商品评论信息
			ArrayList<Comment> commentList = new DataProcess(this.getServletContext().getInitParameter("DBName")).getCommentInfo(commodityId);
			request.setAttribute("commentList", commentList);
			
			//获取推荐商品信息
			ArrayList<Commodity> commodityList = new DataProcess(this.getServletContext().getInitParameter("DBName")).getRecommendCommodityInfo(commodityId);
			request.setAttribute("commodityList", commodityList);
			
			//添加到购物车
			String number = request.getParameter("number");
			if (number != null && Integer.parseInt(number) > 0) {
				new DataProcess(this.getServletContext().getInitParameter("DBName")).InsertcommodityToshoppingCart(user.phoneNum,commodityId,number);
			}
		}
		
		request.getRequestDispatcher("pages/showCommodityDetail/showCommodityDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
