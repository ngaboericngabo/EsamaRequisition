/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package computer.zone.common;

import computer.zone.dao.impl.LoginImpl;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



/**
 *
 * @author RTAP4
 */
public class SendEmail {
    	 public   void sendEmail( String toAddress,String subject, String message) throws AddressException,MessagingException {
         

	        Properties properties = new Properties();
	        properties.put("mail.smtp.host","smtp.gmail.com");
	        properties.put("mail.smtp.port", "587");
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.starttls.enable", "true");
	
	        // creates a new session with an authenticator
	        Authenticator auth = new Authenticator() {
                    @Override
	            public PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("worldvisionvehicle@gmail.com", "world123");
	            }
	        };
	 
	        Session session = Session.getInstance(properties, auth);
	 
	        // creates a new e-mail message
	        Message msg = new MimeMessage(session);
	 
	        msg.setFrom(new InternetAddress("worldvisionvehicle@gmail.com"));
	        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
	        msg.setRecipients(Message.RecipientType.TO, toAddresses);
	        msg.setSubject(subject);
	        msg.setSentDate(new Date());
	       
             msg.setContent(message,"text/html");
	        // sends the e-mail
	        Transport.send(msg);
	       
	 
	    }
	 public static void main (String ...jjjj){
                 try {
                     SendEmail j=new SendEmail();
                     
                     String password="pass123";
                     LoginImpl loginDao = new LoginImpl();
                     if("32250170a0dca92d53ec9624f336ca24".equals((loginDao.criptPassword(password)))){
                     System.out.println("True");}else{
                       System.out.println("false");
                     }
                 } catch (NoSuchAlgorithmException ex) {
                     Logger.getLogger(SendEmail.class.getName()).log(Level.SEVERE, null, ex);
                 }
	 }
}
