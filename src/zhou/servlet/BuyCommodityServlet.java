package zhou.servlet;

import zhou.dao.User;
import zhou.functionclass.*;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BuyCommodityServlet
 */
@WebServlet("/BuyCommodityServlet")
public class BuyCommodityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyCommodityServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		User user = (User)request.getSession().getAttribute("userInfo");
		String strID = request.getParameter("id");
		String[] strings = strID.split("-");
		System.out.println(strID);
		ArrayList<String> commodityIDList = new ArrayList<String>();
		for (String string : strings) {
			if (!string.equals(" ")) {
				commodityIDList.add(string);
				System.out.println(string);
			}
		}
		RondomOrderNum.RondomOrderNumber(user.userID);
		//TODO �����ﳵ�����Ʒ��Ϣɾ��������Ϣ������������Ʒ�������붩���������ţ���ǰʱ�����������뵽�ֻ���nλ�м䣩
		//����ʱ��Ϊ��ǰʱ�������ݿ�ʵ�֣����û��ֻ��š��������Լ���Ʒid�����������
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
