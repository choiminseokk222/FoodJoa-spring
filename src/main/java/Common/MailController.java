package Common;

import java.util.Properties;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;

import org.springframework.mail.javamail.JavaMailSenderImpl;

public class MailController {
	
	private static JavaMailSenderImpl mailSender;
	
	@Async
	public static void sendMail(String to, String subject, String body) {
		
		if (mailSender == null) setMailSender();
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom("study.euneick@gmail.com","세상 모든 레시피 Food Joa");
			
			messageHelper.setSubject(subject);			
			messageHelper.setTo(to); 			
			messageHelper.setText(body);
			
			mailSender.send(message);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void setMailSender() {
		
		mailSender = new JavaMailSenderImpl();
		
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		
		mailSender.setUsername("study.euneick@gmail.com");
		mailSender.setPassword("sygd qjtg buts yrek");
		
		Properties properties = new Properties();
		
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.debug", "true");
		
		mailSender.setJavaMailProperties(properties);
	}
}
