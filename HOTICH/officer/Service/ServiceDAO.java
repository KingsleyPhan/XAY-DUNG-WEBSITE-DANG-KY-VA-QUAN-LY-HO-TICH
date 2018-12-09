package Service;

import java.sql.Connection;
import java.sql.SQLException;

import DAO.ConnectDAO;

public class ServiceDAO extends ConnectDAO{

	public ServiceDAO(String URL, String Username, String Password) {
		super(URL, Username, Password);
	}
	
	public Connection getConnection() {
		try {
			Connection();
			return DBConnection;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
