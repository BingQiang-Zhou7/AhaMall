package zhou.database;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.lang.Exception;

public class DataAccess {
	private String user = "root";				//�û���
	private String password = "2018";			//�û�����
	private boolean isConnection = false;		//�Ƿ�������
	private Connection connDB = null;			//Connection����
	private String ErrorStr = null;				//������Ϣ
	
	
	//�������ݿ�
	public DataAccess(String DBName) {
		try {
			Class.forName("com.mysql.jdbc.Driver");//��������
			connDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+DBName+"?useSSL=false", user, password);//�������ݿ�
			if (connDB != null) {
				isConnection = true;
				//System.out.println("connect");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	//�ж��Ƿ��Ѿ�����
	public boolean isConnection() {
		return isConnection;
	}
	//���ݿ����
	public ResultSet DatabaseOperations(String SQLStatement, Object[] parameter)
	{
		try {
			ErrorStr = null;
			PreparedStatement pStatement = connDB.prepareStatement(SQLStatement);//����Statement
			//���ò���
			if (parameter != null) {
				for (int i = 0; i < parameter.length; i++) {
					pStatement.setString(i+1, (String)parameter[i]);
				}
			}
			boolean result = pStatement.execute();//ִ��SQL���
			//System.out.println("execute");
			if (result == true) {
				return pStatement.getResultSet();//���ؽ����
			}
		} catch (Exception e) {
			ErrorStr = e.getMessage();
		}
		return null;
	}
	//��ȡ������Ϣ
	public String getErrorStr() {
		return ErrorStr;
	}
	
	//�ر�����
	public void colseConnect() {
		if (connDB != null) {
			try {
				connDB.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
//	//����
//	public static void main(String[] args) {
//		DataAccess dataAccess = new DataAccess("ascentWeb");
//		ResultSet set =  dataAccess.DatabaseOperations("select * from user",null);
//		//set.next();
//		try {
//			while (set.next()) {
//				System.out.println(set.getString("username"));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		dataAccess.colseConnect();
//	}
}
