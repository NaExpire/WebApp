package naexpire;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.concurrent.TimeUnit;


public class DBManager {

	private Connection getConnection() { // opens a connection with the database
		
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
	
	public String[][] getSplash() { // get content for populating the splash page
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT columnname, content FROM splash WHERE 1;");
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
	
	public String[][] getContact() { // get contact info for the splash page
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT form, content FROM contact WHERE 1;");
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
	
	public boolean changeSplash(String col, String newValue) { // allows the admin to update the text on the splashpage
		
		boolean res = false;
		
		Connection conn = getConnection();
		if (conn != null) {
			
			PreparedStatement stmt;
			try {
				stmt = conn.prepareStatement("UPDATE splash SET content=? WHERE columnname=\"" + col + "\";");
				stmt.setString(1, newValue);
				stmt.execute();
				stmt.close();
				res = true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return res;
		
	}
	
	public boolean changeContact(String col, String newValue) { // allows the admin to update the text on the splashpage
		
		boolean res = false;
		
		Connection conn = getConnection();
		if (conn != null) {
			
			PreparedStatement stmt;
			try {
				stmt = conn.prepareStatement("UPDATE splash SET content=? WHERE columnname=\"" + col + "\";");
				stmt.setString(1, newValue);
				stmt.execute();
				stmt.close();
				res = true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return res;
		
	}
	
	public String generatePassword(int id) { // generate a random password, given the user's id
		
		Utilities util = new Utilities();
		
		String newPass = util.generatePassword();
		String newEncrypt = util.encryptPass(newPass);
		
		Connection conn = getConnection();
		if (conn != null) {
			
			PreparedStatement stmt;
			try {
				stmt = conn.prepareStatement("UPDATE users SET password=? WHERE id=" + id + ";");
				stmt.setString(1, newEncrypt);
				stmt.execute();
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		util.emailPassword(newPass, id);
		
		return newPass;
		
	}
	
	public String getFirstName(String un) {
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String result;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT firstname FROM users WHERE email=\"" + un + "\";");
				ResultSetMetaData rsmd = rs.getMetaData();
				if (rs.next()) {
					result = rs.getString(1);
					rs.close();
					conn.close();
					return result;
				}
				else {
					return "";
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("error 1");
				return "";
			}
		}
		else {
			System.out.println("error 2");
			return "";
		}
		
	}
	
	public boolean isAdmin(String un) {
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String result;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT type FROM users WHERE email=\"" + un + "\";");
				ResultSetMetaData rsmd = rs.getMetaData();
				if (rs.next()) {
					result = rs.getString(1);
					rs.close();
					conn.close();
					return result.equals("admin");
				}
				else {
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("error 1");
				return false;
			}
		}
		else {
			System.out.println("error 2");
			return false;
		}
		
	}
	
	public String attemptLogin(String un) {
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String result;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT password FROM users WHERE email=\"" + un + "\";");
				ResultSetMetaData rsmd = rs.getMetaData();
				if (rs.next()) {
					result = rs.getString(1);
					rs.close();
					conn.close();
					return result;
				}
				else {
					return null;
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
	
	public String getPasscode(int id) {
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String result;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT password FROM users WHERE id=" + Integer.toString(id) + ";");
				ResultSetMetaData rsmd = rs.getMetaData();
				if (rs.next()) {
					result = rs.getString(1);
					rs.close();
					conn.close();
					return result;
				}
				else {
					return null;
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
	
	public String getId(String un) {
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String result;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT id FROM users WHERE email=\"" + un + "\";");
				ResultSetMetaData rsmd = rs.getMetaData();
				if (rs.next()) {
					result = rs.getString(1);
					rs.close();
					conn.close();
					return result;
				}
				else {
					return null;
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
	
	public String getEmail(int id) {
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String result;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT email FROM users WHERE id=" + id + ";");
				ResultSetMetaData rsmd = rs.getMetaData();
				if (rs.next()) {
					result = rs.getString(1);
					rs.close();
					conn.close();
					return result;
				}
				else {
					return null;
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
	
	public boolean update(String table, String column, int value, String id) { // update entry in db; called by ajax
		
		boolean res = false;
		
		Connection conn = getConnection();
		if (conn != null) {
			
			PreparedStatement ps;
			try {
				ps = conn.prepareStatement("UPDATE " + table + " SET " + column + "=? WHERE id=" + id + ";");
				ps.setInt(1, value);
				ps.execute();
				ps.close();
				res = true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return res;
		
	}
	
	public boolean update(String table, String column, String value, String id) { // update entry in db; called by ajax
		
		boolean res = false;
		
		Connection conn = getConnection();
		if (conn != null) {
			
			PreparedStatement ps;
			try {
				ps = conn.prepareStatement("UPDATE " + table + " SET `" + column + "`=? WHERE id=" + id + ";");
				ps.setString(1, value);
				ps.execute();
				ps.close();
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
	
	public String[][] getMenu() { // get contents of the menu items table
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT * FROM menuitems WHERE 1;");
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
	
	public String[][] getDeals() { // get contents of the deals table
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT * FROM deals WHERE 1;");
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
	
	public String[][] getUsers() { // get contents of the user table
		
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
	
	public String[][] getMonthPurchases(String date, String today) { // get purchases for the last month
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n, m;
			try {
				statement = conn.createStatement();
				System.out.println(date);
				ResultSet rs = statement.executeQuery("SELECT c.caldate, count(p.id) FROM calendar c LEFT JOIN purchases p ON p.date = c.caldate WHERE c.caldate >= '" + date + "' AND c.caldate <= '" + today + "' GROUP BY c.caldate;");
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
	
	public String[][] getReviewedRestaurantCounts() { // get number of reviews per restaurant
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n,m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT r.name, COUNT(r.name) AS restaurants FROM restaurants r JOIN reviews s ON s.`restaurant-id` = r.id GROUP BY r.name ORDER BY r.id;");
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
	
	public String[][] getReviewScores() { // get avg score for each restaurant
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n, m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT r.name, AVG(s.score) AS average, COUNT(s.id) AS reviews FROM restaurants r JOIN reviews s ON s.`restaurant-id` = r.id GROUP BY r.name ORDER BY r.id;");
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
	
	public String[][] getMonthSignups(String date, String today) {
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			String[][] results;
			int n, m;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT c.caldate, count(u.id) FROM calendar c LEFT JOIN users u ON u.`registration-date` = c.caldate WHERE c.caldate >= '" + date + "' AND c.caldate <= '" + today + "' GROUP BY c.caldate;");
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
	
	public boolean nameTaken (String name) { // check if a username is taken
		
		boolean result = false;
		
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			try {
				statement = conn.createStatement();
				ResultSet rs = statement.executeQuery("SELECT id FROM users WHERE email=\"" + name + "\";");
				ResultSetMetaData rsmd = rs.getMetaData();
				if (rs.next()) {
					result = true;
					rs.close();
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
		
	}
	
	public int registerUser (String[] input) {
		
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(today);
		int idnum = 0;
		
		if (nameTaken(input[1])) {
			return idnum;
		}
		String id;
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			try {
				statement = conn.createStatement();
				Utilities util = new Utilities();
				String cc = util.generateConfirmationCode();
				PreparedStatement preparedStmt = conn.prepareStatement("INSERT INTO users (type, email, password, firstname, lastname, `registration-date`, `confirmation-code`, `cart-id`) VALUES (?, ?, ?, ?, ?, ?, ?, 1);", Statement.RETURN_GENERATED_KEYS);
				preparedStmt.setString(1, input[0]);
				preparedStmt.setString(2, input[1]);
				preparedStmt.setString(3, input[2]);
				preparedStmt.setString(4, input[3]);
				preparedStmt.setString(5, input[4]);
				preparedStmt.setString(6, date);
				preparedStmt.setString(7, cc);
				preparedStmt.execute();
				ResultSet rs = preparedStmt.getGeneratedKeys();
				if (rs.next()) {
					idnum = rs.getInt(1);
				} 
				preparedStmt.close();
				try {
					TimeUnit.SECONDS.sleep(1);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				rs.close();
				conn.close();
				return idnum;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return 0;
		
	}
	
	public boolean registerRestaurant (String[] input, int ownerid) {
		
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(today);
		String id;
		Connection conn = getConnection();
		if (conn != null) {
			Statement statement;
			try {
				statement = conn.createStatement();
				Utilities util = new Utilities();
				String cc = util.generateConfirmationCode();
				PreparedStatement preparedStmt = conn.prepareStatement("INSERT INTO restaurants (name, description, `registration-date`, address, city, state, zip, `phone-number`, ownerid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
				preparedStmt.setString(1, input[0]);
				preparedStmt.setString(2, input[1]);
				preparedStmt.setString(3, date);
				preparedStmt.setString(4, input[2]);
				preparedStmt.setString(5, input[3]);
				preparedStmt.setString(6, input[4]);
				preparedStmt.setInt(7, Integer.parseInt(input[5]));
				preparedStmt.setString(8, input[6]);
				preparedStmt.setInt(9, ownerid);
				preparedStmt.execute();
				conn.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return false;
		
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
	
}
