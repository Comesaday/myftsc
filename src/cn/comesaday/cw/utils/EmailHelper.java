package cn.comesaday.cw.utils;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.sun.mail.util.MailSSLSocketFactory;

public class EmailHelper {
	public static void active(String receiver, int id) throws Exception {
		// TODO Auto-generated method stub
		Properties prop = new Properties();
		// 开启debug调试，以便在控制台查看
		prop.setProperty("mail.debug", "true");
		prop.setProperty("mail.host", "smtp.qq.com");
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");

		// 开启SSL加密，否则会失败
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.socketFactory", sf);

		// 使用JavaMail发送邮件的5个步骤
		// 1、创建session
		Session session = Session.getInstance(prop);
		// 开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
		session.setDebug(true);
		// 2、通过session得到transport对象
		Transport ts = session.getTransport();
		// 3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
		ts.connect("smtp.qq.com", "931716599@qq.com", "sqkpywyiwvtpbfjc");
		// 4、创建邮件
		Message message = activeMail(session,receiver,id);
		// 5、发送邮件
		ts.sendMessage(message, message.getAllRecipients());
		ts.close();
	}

	private static Message activeMail(Session session,String receiver,int id) throws Exception {
		// 创建邮件对象
		MimeMessage message = new MimeMessage(session);
		// 指明邮件的发件人
		message.setFrom(new InternetAddress("931716599@qq.com"));
		// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
		// 邮件的标题
		message.setSubject("激活邮件");
//		"<a href='www.comesaday.cn/user/user_active.action?id="+id+"'/>一封来自果园的激活邮件，请您查收！</a><a href='www.baidu.com'>百度</a>"
		// 设置正文
		message.setContent("<html lang='zh-CN'><head ><meta charset='utf-8'>"
				+ "</head><body>这是您的激活邮件"
				+ "<a href='http://101.132.103.66/user/user_active.action?id="
				+ id
				+ "'>【激活】</a></body></html>","text/html;charset=UTF-8");
		

		return message;
	}
}
