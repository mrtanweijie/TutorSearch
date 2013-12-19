package tan.code.utils;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

/**
 * 简单邮件发送
 * @author Mr_Tank_
 *
 */
public class SendEmail {
	/**
	 * 邮件发送
	 * @param userEmail 用户邮箱
	 * @throws MessagingException
	 */
	public static void sendHtmlEmail(String username,String userEmail) {
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();

		// 设定mail server
		senderImpl.setHost("smtp.163.com");

		MimeMessage mailMessage = senderImpl.createMimeMessage();
		MimeMessageHelper messageHelper;
		try {
			messageHelper = new MimeMessageHelper(mailMessage,true,"GBK");
			// 设置收件人，寄件人
			// messageHelper.setTo("Mailto@sina.com");
			// messageHelper.setFrom("username@163.com");

			//String[] array = new String[] { "474481263@qq.com", "tanweijie@outlook.com", "283640533@qq.com" };
			messageHelper.setTo(userEmail);
			messageHelper.setFrom("mrweitan@163.com");
			messageHelper.setSubject("欢迎注册家教搜索网");
			// true 表示启动HTML格式的邮件
			messageHelper.setText("<html><head></head><body>"+username+"先生/女生,欢迎注册家教网</body></html>", true);

			senderImpl.setUsername("mrweitan@163.com"); // 根据自己的情况,设置username
			senderImpl.setPassword("18577161157"); // 根据自己的情况, 设置password

			Properties prop = new Properties();
			prop.put("mail.smtp.auth", "true"); // 将这个参数设为true，让服务器进行认证,认证用户名和密码是否正确
			prop.put("mail.smtp.timeout", "25000");
			senderImpl.setJavaMailProperties(prop);
			// 发送邮件
			senderImpl.send(mailMessage);
			System.out.println("邮件发送成功.。.");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			System.out.println("邮件发送失败。。。");
			e.printStackTrace();
		}

		
	
	}
}
