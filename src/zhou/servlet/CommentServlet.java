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
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
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
			User user = (User)session.getAttribute("userInfo");
			String logout = request.getParameter("logout");
			if(user != null)
			{
			//	System.out.println(logout);
				if(logout != null && logout.equals("1"))
				{
					session.setAttribute("userInfo",null);
					response.sendRedirect("IndexServlet");
				}
			}
			ArrayList<Comment> commentList =null;
			request.removeAttribute("commentList");
			if(commodityID != null)
			{
				commentList = new DataProcess(this.getServletContext().getInitParameter("DBName")).getCommentInfo(commodityID);
			}
			//System.out.println(commodityList.size());
//			if(commentList != null)
//			{		
		///		for (Comment comment : commentList) {
//					System.out.println(comment.getCommentConent());
//					System.out.println(comment.getCommentTime());
//					System.out.println(comment.getCommodityName());
//					System.out.println(comment.getUserPhoneNum());
//					System.out.println("----------------------------------------");
//				}
//			}
			
			request.setAttribute("commentList", commentList);
			
			request.getRequestDispatcher("pages/comment/comment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
