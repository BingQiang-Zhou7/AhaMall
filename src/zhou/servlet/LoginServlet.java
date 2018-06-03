package zhou.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zhou.dao.User;
import zhou.database.DataAccess;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String phoneNum = request.getParameter("phoneNum");
		String password = request.getParameter("password");
//		PrintWriter out = response.getWriter();
//		out.print(account);
//		out.print(password);
		//验证用户信息 并转到主页
		Object[] list = new Object[] {phoneNum,password};
		DataAccess db = new DataAccess(this.getServletContext().getInitParameter("DBName"));
		//System.out.println(db.getErrorStr());
		try {
			//用户不存在
				//System.out.println("nihao");
				ResultSet resultSet = db.DatabaseOperations("Call VerifyLogin(?,?)",list);
				if (resultSet.next() == true) {
					String userPhoneNum = resultSet.getString("userPhoneNum");
					String userID = resultSet.getString("userID");
					String userName = resultSet.getString("userName");
					String userPassword = resultSet.getString("userPassword");
					User user = new User(userPhoneNum, userID, userName, userPassword);
					//System.out.println(userPhoneNum);
					db.colseConnect();
					request.getSession().setAttribute("userInfo", user);
					response.sendRedirect("pages/jump/jump.jsp");
				}else {
					db.colseConnect();
					response.sendRedirect("pages/login/login.htm?error=UserIsExist");
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
