package zhou.servlet;

import java.util.ArrayList;
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
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCartServlet() {
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
		
		//更新购物车商品数据
		String commodityId = request.getParameter("commodityId");
		String numOfCommodity = request.getParameter("numOfCommodity");
		//退出登录 以及 获取购物车商品信息
		String logout = request.getParameter("logout");
		String url = request.getRequestURI();//获取当前链接
		request.setAttribute("url", url);
		User user = (User)session.getAttribute("userInfo");//获取用户信息
		ArrayList<Commodity> commodityCart =null;
		if(user != null)
		{
			if(logout != null && logout.equals("1"))
			{
				session.removeAttribute("userInfo");
			}
			else{
				//删除商品 以及清空购物车
				if(commodityId != null && numOfCommodity == null)
				{
					new DataProcess(this.getServletContext().getInitParameter("DBName")).DeleteCommodityToShoppingCart(user.phoneNum, commodityId);
				}
				//加减商品
				else if(commodityId != null && numOfCommodity != null && Integer.parseInt(numOfCommodity) > 0)
				{
					new DataProcess(this.getServletContext().getInitParameter("DBName")).UpdateCommodityToShoppingCart(user.phoneNum, commodityId, numOfCommodity);
				}
				//查询用户购物车商品
				commodityCart = new DataProcess(this.getServletContext().getInitParameter("DBName")).getCartCommodityInfo(user.phoneNum);
				request.setAttribute("commodityCart", commodityCart);
//				for (Commodity commodity : commodityCart) {
//					System.out.println(commodity.getCommodityID());
//					System.out.println(commodity.getCommodityName());
//					System.out.println(commodity.getCommodityType());
//					System.out.println(commodity.getCommodityPrice());
//					System.out.println(commodity.getCommodityAddressOfImage());
//					System.out.println(commodity.getCommodityNumberOfComment());
//					System.out.println(commodity.getCommodityAddTime());
//					System.out.println(commodity.getCommodityDescription());
//					System.out.println(commodity.getCommodityIsRecommend());
//					System.out.println(commodity.getCommodityNumber());
//					System.out.println("----------------------------------------");
//				}
			}
		}
		request.getRequestDispatcher("pages/shoppingCart/shoppingCart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
