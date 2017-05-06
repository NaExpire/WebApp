package naexpire;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

public class Utilities {
	
	public String[] getDateList(Date today) { // get list of days for month charts
			
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			cal.setTime(today);
			cal.add(Calendar.DATE, -30);
			Date dateBefore30Days = cal.getTime();
			String[] dateList = new String[31];
			Date newDate;for (int i = 0; i < 30; i++) {
				cal.setTime(dateBefore30Days);
				cal.add(Calendar.DATE, i);
				newDate = cal.getTime();
				dateList[i] = df.format(newDate);
			}
			
			dateList[30] = df.format(today);
			
			return dateList;
			
		}
	
	public String generateConfirmationCode() { // generate confirmation code for new user
		String chars = "0123456789";
		Random rand = new Random();
		String result = "";
		int n;
		System.out.println("Does console logging work?");
		for (int i = 0; i < 5; i++) {
			n = rand.nextInt(chars.length());
			result += chars.charAt(n);
		}
		return result;
	}
	
	public void sendConfirmation(String code, String email) { // email confirmation code to new user
		
		String from = "naexpire@gmail.com";
		String host = "localhost";
		Properties properties = System.getProperties();
		properties.setProperty("mail.smtp.host", host);
		Session session = Session.getDefaultInstance(properties);
		System.out.println("Email attempt incoming.");
		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);
			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));
			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// Set Subject: header field
			message.setSubject("Confirm Email");
			// Now set the actual message
			message.setText("<a href=\"localhost:8080/NAExpire/confirm\">Please click here</a> to confirm your email with Cafe Redux.<br /><h2>Your confirmation code is:</h2><h1>" + code + "</h1>");
			// Send message
			Transport.send(message);
			System.out.println("Sent message successfully....");
		}catch (MessagingException mex) {
			mex.printStackTrace();
		}
		
		return;
		
	}
	
	public boolean confirmPassword(String password, int id) { // check that pw is a match
		
		DBManager dbm = new DBManager();
		
		String passcode = dbm.getPasscode(id);
		
		boolean res = BCrypt.checkpw(password, passcode);
		
		return res;
		
	}
	
	public void emailPassword(String password, int id) { // email new pw to user
		
		DBManager dbm = new DBManager();
		String email = dbm.getEmail(id);
		
		String from = "naexpire@gmail.com";
		String host = "localhost";
		Properties properties = System.getProperties();
		properties.setProperty("mail.smtp.host", host);
		Session session = Session.getDefaultInstance(properties);
		System.out.println("Email attempt incoming.");
		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);
			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));
			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// Set Subject: header field
			message.setSubject("Confirm Email");
			// Now set the actual message
			message.setText("Your new email is " + password + ".");
			// Send message
			Transport.send(message);
			System.out.println("Sent message successfully....");
		}catch (MessagingException mex) {
			mex.printStackTrace();
		}
		
		return;
		
	}
	
	public boolean isAdmin(String un) { // check if user is admin
		
		DBManager dbm = new DBManager();
		return dbm.isAdmin(un);
		
	}
	
	public boolean attemptLogin(String un, String password) { // attempt to login a user to admin panel
		
		DBManager dbm = new DBManager();
		String id = dbm.getId(un);
		return confirmPassword(password, Integer.parseInt(id));
		
	}
	
	public String generatePassword() { // generate new pw for pw reset
		
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		String newpass = "";
		for (int i = 0; i < (Math.random() * 4 + 8); i++) {
			newpass += characters.charAt((int)(Math.round(Math.random() * characters.length() + 1)));
		}
		
		return newpass;
		
	}
	
	public String encryptPass(String password) { // encrypt a password
		
		return BCrypt.hashpw(password, BCrypt.gensalt(14));
		
	}
	
}
