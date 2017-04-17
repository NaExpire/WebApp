package naexpire;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


public class DBManager {

	private Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://138.197.33.88:3306/naexpire", "root", "root");
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error 0");
			return null;
		}
		
	}
	
	public boolean update(String table, String column, String value, String id) {
		
		boolean res = false;
		
		Connection conn = getConnection();
		if (conn != null) {
			
			Statement stmt;
			try {
				stmt = conn.createStatement();
				stmt.executeQuery("UPDATE " + table + " SET " + column + "='" + value + "' WHERE id=" + id + ";");
				res = true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return res;
		
	}
	
	public boolean testConnection() {
		Connection conn = getConnection();
		boolean connectivity = (conn != null);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return connectivity;
	}
	
	public String[][] getUsers() {
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT * FROM users WHERE 1;");
				ResultSetMetaData rsmd = rs.getMetaData();
				if (!rs.next()) {
					rs.close();
					conn.close();
					String [][] res = null;
					return res;
				}
				else {
					rs.last();
					n = rs.getRow();
					rs.beforeFirst();
					m = rsmd.getColumnCount();
					results = new String[n][m];
					int i = 0;
					DateFormat df = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
					while (rs.next()) {
						for (int j = 0; j < m; j++) {
							results[i][j] = rs.getString(j+1);
						}
						i++;
					}
					rs.close();
					conn.close();
					return results;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("error 1");
				return null;
			}
		}
		else {
			System.out.println("error 2");
			return null;
		}
		
	}
	
	public String[][] getMonthPurchases() {
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n, m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT date, count(id) FROM purchases WHERE date > 2017-03-16 GROUP BY date ORDER BY date;");
				ResultSetMetaData rsmd = rs.getMetaData();
				if (!rs.next()) {
					return null;
				}
				else {
					rs.last();
					n = rs.getRow();
					rs.beforeFirst();
					m = rsmd.getColumnCount();
					results = new String[n][m];
					int i = 0;
					while (rs.next()) {
						for (int j = 0; j < m; j++) {
							results[i][j] = rs.getString(j+1);
						}
						i++;
					}
					rs.close();
					conn.close();
					return results;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		}
		else {
			return null;
		}
	}
	
	public String[][] getMonthSignups() {
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n, m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT registration-date, count(id) FROM users WHERE registration-date > 2017-03-16 GROUP BY registration-date ORDER BY registration-date;");
				ResultSetMetaData rsmd = rs.getMetaData();
				if (!rs.next()) {
					return null;
				}
				else {
					rs.last();
					n = rs.getRow();
					rs.beforeFirst();
					m = rsmd.getColumnCount();
					results = new String[n][m];
					int i = 0;
					while (rs.next()) {
						for (int j = 0; j < m; j++) {
							results[i][j] = rs.getString(j+1);
						}
						i++;
					}
					rs.close();
					conn.close();
					return results;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		}
		else {
			return null;
		}
	}
	
	public String[][] getRestaurants() {
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT * FROM restaurants WHERE 1;");
				ResultSetMetaData rsmd = rs.getMetaData();
				if (!rs.next()) {
					rs.close();
					conn.close();
					String [][] res = null;
					return res;
				}
				else {
					rs.last();
					n = rs.getRow();
					rs.beforeFirst();
					m = rsmd.getColumnCount();
					results = new String[n][m];
					int i = 0;
					while (rs.next()) {
						for (int j = 0; j < m; j++) {
							results[i][j] = rs.getString(j+1);
						}
						i++;
					}
					rs.close();
					conn.close();
					return results;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("error 1");
				return null;
			}
		}
		else {
			System.out.println("error 2");
			return null;
		}
		
	}
	
	public String[] getUserNames() {
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[] results;
			int n;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT email FROM users WHERE 1;");
				if (!rs.next()) {
					rs.close();
					conn.close();
					System.out.println("error 0");
					String[] error = new String[2];
					error[0] = "No results";
					error[1] = "Error 0";
					return error;
				}
				else {
					rs.last();
					n = rs.getRow();
					rs.beforeFirst();
					results = new String[n];
					int i = 0;
					while (rs.next()) {
						results[i] = rs.getString(1);
						i++;
					}
					rs.close();
					conn.close();
					return results;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("error 1");
				String[] error = new String[3];
				error[0] = "No results";
				error[1] = "Error 1";
				error[2] = e.toString();
				return error;
			}
		}
		else {
			System.out.println("error 2");
			String[] error = new String[2];
			error[0] = "No results";
			error[1] = "Error 2";
			return error;
		}
	}
	
}
