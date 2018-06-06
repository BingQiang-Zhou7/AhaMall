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
		
		//���¹��ﳵ��Ʒ����
		String commodityId = request.getParameter("commodityId");
		String numOfCommodity = request.getParameter("numOfCommodity");
		//�˳���¼ �Լ� ��ȡ���ﳵ��Ʒ��Ϣ
		String logout = request.getParameter("logout");
		String url = request.getRequestURI();//��ȡ��ǰ����
		request.setAttribute("url", url);
		User user = (User)session.getAttribute("userInfo");//��ȡ�û���Ϣ
		ArrayList<Commodity> commodityCart =null;
		if(user != null)
		{
			if(logout != null && logout.equals("1"))
			{
				session.removeAttribute("userInfo");
			}
			else{
				//ɾ����Ʒ �Լ���չ��ﳵ
				if(commodityId != null && numOfCommodity == null)
				{
					new DataProcess(this.getServletContext().getInitParameter("DBName")).DeleteCommodityToShoppingCart(user.phoneNum, commodityId);
				}
				//�Ӽ���Ʒ
				else if(commodityId != null && numOfCommodity != null && Integer.parseInt(numOfCommodity) > 0)
				{
					new DataProcess(this.getServletContext().getInitParameter("DBName")).UpdateCommodityToShoppingCart(user.phoneNum, commodityId, numOfCommodity);
				}
				//��ѯ�û����ﳵ��Ʒ
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
