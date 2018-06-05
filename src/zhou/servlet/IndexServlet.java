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
 * Servlet implementation class IndexServlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
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
		ArrayList<Commodity> commodityList =null;
		User user = (User)session.getAttribute("userInfo");
		if(user != null)
		{
		//	System.out.println(logout);
			if(logout != null && logout.equals("1"))
			{
				session.setAttribute("userInfo",null);
			}
		}
		//当前URL
		String url = "?";
		if(request.getQueryString() != null)
		{
			url+=request.getQueryString()+"&";
		}
		request.setAttribute("url", url);
		
		// 获取商品信息
		String categoryName = request.getParameter("categoryName");	
		String sortName = request.getParameter("sortName");
		String fuzzyStr = request.getParameter("fuzzyStr");
		
		//获取加入购物车相关信息
		String commodityId = request.getParameter("commodityID");

		if(commodityId != null)
		{
			url = url.substring(0, url.indexOf("commodityID"));//清除URL商品信息
			new DataProcess(this.getServletContext().getInitParameter("DBName")).InsertcommodityToshoppingCart(user.phoneNum,commodityId,"1"); 
		}
		
		if(categoryName != null && sortName != null)
		{
			request.setAttribute("categoryName", categoryName);
			request.setAttribute("sortName", sortName);
			request.setAttribute("fuzzyStr", fuzzyStr);
		}
		else
		{
			categoryName = (String)request.getAttribute("categoryName");
			sortName = (String)request.getAttribute("sortName");
			fuzzyStr = (String)request.getAttribute("fuzzyStr");
		}

//		if(user != null)
//		System.out.println(user.userName);
		request.removeAttribute("commodityList");
		if(categoryName == null||sortName == null||fuzzyStr == null)
		{
			commodityList = new DataProcess(this.getServletContext().getInitParameter("DBName")).getCommodityInfo("全部", "默认", "false");
		}
		else
		{
//			System.out.println(categoryName);
//			System.out.println(sortName);
//			System.out.println(fuzzyStr);
			commodityList = new DataProcess(this.getServletContext().getInitParameter("DBName")).getCommodityInfo(categoryName, sortName,fuzzyStr);
		}
		//System.out.println(commodityList.size());
		request.setAttribute("commodityList", commodityList);
//		for (Commodity commodity : commodityList) {
//			System.out.println(commodity.getCommodityID());
//			System.out.println(commodity.getCommodityName());
//			System.out.println(commodity.getCommodityType());
//			System.out.println(commodity.getCommodityPrice());
//			System.out.println(commodity.getCommodityAddressOfImage());
//			System.out.println(commodity.getCommodityNumberOfComment());
//			System.out.println(commodity.getCommodityAddTime());
//			System.out.println(commodity.getCommodityDescription());
//			System.out.println("----------------------------------------");
//		}
//		System.out.println(commodityList.size());
		
//		String path = request.getContextPath();
//		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//		request.setAttribute("basePath",basePath);
//		System.out.println(basePath);
		
		
		request.getRequestDispatcher("pages/index/index.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
