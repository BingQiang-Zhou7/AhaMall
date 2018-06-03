package zhou.servlet;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zhou.database.DataAccess;

/**
 * Servlet implementation class FindPasswordServlet
 */
@WebServlet("/FindPasswordServlet")
public class FindPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPasswordServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String phoneNum = request.getParameter("phoneNum");
		String userID = request.getParameter("userID");
		String password = request.getParameter("password");
//		PrintWriter out = response.getWriter();
//		out.print(phoneNum);
//		out.print(userID);
//		out.print(password);
		// 查找用户是否存在，不存在，返回错误信息，存在则修改数据库信息并5秒转到登录页面
		Object[] list = new Object[] {userID,phoneNum,password};
		DataAccess db = new DataAccess(this.getServletContext().getInitParameter("DBName"));
		try {
			//用户存在
				ResultSet resultSet = db.DatabaseOperations("Call UpdateUserPassword(?,?,?)",list);
				if (resultSet.next() == true) {
					//System.out.println(resultSet.getInt(1));
					if (resultSet.getInt(1) == 1) {
						db.colseConnect();
						response.sendRedirect("pages/jump/jump.jsp");
					}else {
						db.colseConnect();
						response.sendRedirect("pages/findPassword/findPassword.htm?error=UserIsExist");
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
