package zhou.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import zhou.database.DataAccess;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		String phoneNum = request.getParameter("phoneNum");
		String userID = request.getParameter("userID");
		String userName = request.getParameter("userName");
		//String userName = new String(request.getParameter("userName").getBytes(), "UTF-8"); ;
		String password = request.getParameter("pw1");
		
		System.out.println(userName);
		
//		request.getRequestDispatcher("pages/register/register.htm?error=UserIsExist").forward(request, response);
//		PrintWriter out = response.getWriter();
//		out.print(phoneNum);
//		out.print(userID);
//		out.print(userName);
//		out.print(password);
//		out.print(this.getServletContext().getInitParameter("DBName"));
		//request.getRequestDispatcher("pages/jsp/ToLoginPage.jsp").forward(request, response);
		//验证用户是否已经存在存在则返回错误信息，不存在，则插入数据库 并5秒转到登录页面
		Object[] list = new Object[] {phoneNum,userID,userName,password};
		DataAccess db = new DataAccess(this.getServletContext().getInitParameter("DBName"));
		//System.out.println(db.getErrorStr());
		try {
			//用户不存在
				//System.out.println("nihao");
				ResultSet resultSet = db.DatabaseOperations("Call InsertUserInfo(?,?,?,?)",list);
				if (resultSet.next() == true) {
					System.out.println(resultSet.getInt(1));
					if (resultSet.getInt(1) == 0) {
						db.colseConnect();
						response.sendRedirect("pages/jump/jump.jsp?topage=login");
					}else {
						db.colseConnect();
						response.sendRedirect("pages/register/register.htm?error=UserIsExist");
					}
				}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
