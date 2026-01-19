<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.activation.*"%>
<%@ page import="java.net.URL" %>
<%@ page import="javax.net.ssl.*" %>
<%@include file="../include/words.jsp" %>
<%!
public static String SSLreturnContent(String strURL) throws Exception{
	String content = "";
	String line = "";
	URL l_url = new URL(strURL);
	HttpsURLConnection l_connection = (HttpsURLConnection)l_url.openConnection();
	
	// 建立設定TLSv1.2 (Java 7)
	SSLContext sc = SSLContext.getInstance("TLSv1.2"); 
	sc.init(null, null, new java.security.SecureRandom());
	l_connection.setSSLSocketFactory(sc.getSocketFactory());
	
	l_connection.connect();
	StringBuffer buffer = new StringBuffer();
	InputStream l_urlStream = l_connection.getInputStream();
	BufferedReader l_reader = new BufferedReader(new InputStreamReader(l_urlStream, "UTF-8"));
	while ((line = l_reader.readLine()) != null) {
		buffer.append(line);
	}
	
	l_reader.close();
	l_urlStream.close();
	l_connection.disconnect();
	
	content = buffer.toString();
	
	return content;
}
%>
<%
	String page_code = "member"; 			// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	String mp_id = StringTool.validString(request.getParameter("mp_id"));
	String action = StringTool.validString(request.getParameter("action"));
	String rs_id = StringTool.validString(request.getParameter("rs_id"));

	TableRecord mp = app_sm.select(tblmp, mp_id);
	if("".equals(mp_id)) {
		out.println("<script> location='"+page_code+".jsp'; </script>");
	} else {
		// 利用 JavaMail 元件寄送信件
		final String uid = SiteSetup.getValue("smtp.auth.account"); 						// 設定 Smtp 認證帳號
		final String upw = SiteSetup.getValue("smtp.auth.password"); 						// 設定 Smtp 密碼
		String mailhost = SiteSetup.getValue("smtp.host.name"); 							// 設定 Smtp Server 名稱
		String smtpport = SiteSetup.getValue("smtp.auth.port"); 							// 設定 Smtp Server 的 Port 值
		String smtpauth = SiteSetup.getValue("smtp.auth.status"); 							// 設定 Smtp Server 是否需要認證 , 或是使用 GMail 465 Port
		String us_email = SiteSetup.getValue("service.email.address"); 						// 設定寄件人 e-Mail
		String us_name = SiteSetup.getValue("service.email.name"); 							// 設定寄件人 名稱
		String servmailto = mp.getString("mp_account"); 									// 設定正本收件人 e-Mail
		String servmailcc 	= "";													 		// 設定副本收件人 e-Mail
		String servmailbcc	= SiteSetup.getValue("original." + page_code + "." + lang); 	// 設定密件副本收件人 e-Mail
		String subject = ""; 																// 設定信件主旨內容
		// subject = SiteSetup.getText("cp.name." + lang)+("tw".equals(lang)?" 密碼通知信":" Password notification letter");

		// Server name.	
		String servername = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		if (request.getServerPort() == 80 || request.getServerPort() == 443) {
			servername = request.getScheme() + "://" + request.getServerName();
		}
		String localname = request.getScheme() + "://" + request.getLocalName() + ":" + request.getLocalPort();
		String url = servername + request.getContextPath();
		// 設定信件內容
		StringBuffer sb = new StringBuffer();
		String content = "";

		if(url.indexOf("https://")>-1) {
			if(action.equals("add")){
				subject = SiteSetup.getText("cp.name."+lang)+("tw".equals(lang)?"-加入會員通知信":" Member join notification letter");
				content = SSLreturnContent(url + "/web/mail/add_member.jsp?mp_id=" + mp_id + "&lang=" + lang);
			} else if(action.equals("forget")){
				subject = SiteSetup.getText("cp.name."+lang)+("tw".equals(lang)?"-忘記密碼通知信":" Forget password notification letter");
				content = SSLreturnContent(url + "/web/mail/forget_password.jsp?mp_id=" + mp_id + "&lang=" + lang);
			} else if(action.equals("tacva")){
				subject = SiteSetup.getText("cp.name."+lang)+("tw".equals(lang)?"-常年會費繳款紀錄通知信":" TACVA payment result notification letter");
				content = SSLreturnContent(url + "/web/mail/tacva.jsp?mp_id=" + mp_id + "&rs_id=" + rs_id + "&lang=" + lang);
			} else if(action.equals("nacva")){
				subject = SiteSetup.getText("cp.name."+lang)+("tw".equals(lang)?"-NACVA代收紀錄通知信":" NACVA payment result notification letter");
				content = SSLreturnContent(url + "/web/mail/nacva.jsp?mp_id=" + mp_id + "&rs_id=" + rs_id + "&lang=" + lang);
			}
		} else {
			Vector urlcontent = new Vector(); // 信件內容產生的 JSP 檔
			if(action.equals("add")){
				subject = SiteSetup.getText("cp.name."+lang)+("tw".equals(lang)?"-加入會員通知信":" Member join notification letter");
				urlcontent = HttpURL.returnContent(url + "/web/mail/add_member.jsp?mp_id=" + mp_id + "&lang=" + lang);
			} else if(action.equals("forget")){
				subject = SiteSetup.getText("cp.name."+lang)+("tw".equals(lang)?"-忘記密碼通知信":" Forget password notification letter");
				urlcontent = HttpURL.returnContent(url + "/web/mail/forget_password.jsp?mp_id=" + mp_id + "&lang=" + lang);
			} else if(action.equals("tacva")){
				subject = SiteSetup.getText("cp.name."+lang)+("tw".equals(lang)?"-常年會費繳款紀錄通知信":" TACVA payment result notification letter");
				urlcontent = HttpURL.returnContent(url + "/web/mail/tacva.jsp?mp_id=" + mp_id + "&rs_id=" + rs_id + "&lang=" + lang);
			} else if(action.equals("nacva")){
				subject = SiteSetup.getText("cp.name."+lang)+("tw".equals(lang)?"-NACVA代收紀錄通知信":" NACVA payment result notification letter");
				urlcontent = HttpURL.returnContent(url + "/web/mail/nacva.jsp?mp_id=" + mp_id + "&rs_id=" + rs_id + "&lang=" + lang);
			}

			for(int i = 0; i < urlcontent.size(); i++) {
				String line = (String) urlcontent.get(i);
				sb.append(line);
			}
			content = sb.toString();
		}

		request.setCharacterEncoding("UTF-8"); 	// 設定信件使用字集
		boolean sessionDebug = false; 			// 設定是否啟用除錯模式 true 為開啟 , false 為關閉
		String userName = uid; 					// your id
		String password = upw; 					// your password		

		try {
			java.util.Properties props = System.getProperties();
			props.put("mail.smtp.host", mailhost);
			props.put("mail.smtp.port", smtpport);
	
			 if ("G".equals(smtpauth)) {
				// 使用 Gmail SMTP	Server 465 port 寄信
				// 注意需先至 https://www.google.com/settings/security/lesssecureapps 將帳號開啟允許低安全登錄
				props.put("mail.smtp.auth", true);
				props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.setProperty("mail.smtp.socketFactory.fallback", "false");
				props.setProperty("mail.smtp.socketFactory.port", smtpport);
				props.put("mail.smtp.ssl.enable", true);
				props.put("mail.smtp.starttls.enable", true);
				props.put("mail.smtp.auth.plain.disable", true);
			} else if ("O".equals(smtpauth)) {										// 使用Office 365 smtp 寄信
				props.put("mail.smtp.auth", true);
				props.put("mail.smtp.ssl.enable", false);
				props.put("mail.smtp.tls.enable", true);
				props.put("mail.smtp.starttls.enable",true);
			} else {																// 使用一般 SMTP Sever 寄信
			 	 props.put("mail.smtp.auth", "N".equals(smtpauth)?false:true);
				 props.setProperty("mail.smtp.socketFactory.class", "");
				 props.setProperty("mail.smtp.socketFactory.fallback", "false");
				 props.setProperty("mail.smtp.socketFactory.port", smtpport);
				 props.put("mail.smtp.ssl.enable", false);
				 props.put("mail.smtp.starttls.enable", false);
				 props.put("mail.smtp.auth.plain.disable", false);
			}
	
			Authenticator auth = new javax.mail.Authenticator() {
				String userName = uid;//your id
				String password = upw;//your password
	
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(userName, password);
				}
			};
			//javax.mail.Session mailSession = javax.mail.Session.getDefaultInstance(props,auth);//在linux下用下列getInstance
			javax.mail.Session mailSession = javax.mail.Session.getInstance(props, auth);
			mailSession.setDebug(sessionDebug);
			MimeMessage msg = new MimeMessage(mailSession); // 需使用 MimeMessage 型態 , 信件主題才不會有亂碼
			msg.setFrom(new InternetAddress(us_email, us_name)); // set mail from
			// set to email
			// 指定收件人,多人請用逗點分開 
			InternetAddress[] address = InternetAddress.parse(servmailto);
			msg.setRecipients(Message.RecipientType.TO, address);
			// 副本
			InternetAddress[] ccAddress = InternetAddress.parse(servmailcc);
			msg.setRecipients(Message.RecipientType.CC,ccAddress);
			msg.setSubject(subject,"UTF-8");
			// 密件副本	
			InternetAddress[] bccAddress = InternetAddress.parse(servmailbcc);
			msg.setRecipients(Message.RecipientType.BCC,bccAddress);
			msg.setSubject(subject,"UTF-8");	
			// set send date
			msg.setSentDate(new Date());
			// set content
			msg.setContent(content, "text/html; charset=UTF-8");
			// Get Transport use userName and password
			Transport trans = mailSession.getTransport("smtp");
			trans.connect(mailhost, userName, password);
			trans.send(msg);
			trans.close();

			if(action.equals("add")){
				out.println("<script> alert('"+("tw".equals(lang)?"歡迎 ":"Welcome ")+mp.getString("mp_name")+("tw".equals(lang)?"您已成功加入會員並已完成登入!!":" join us !!")+"'); </script>");
				out.println("<script> location='../../home.jsp'; </script>");
			}else if(action.equals("forget")){
				out.println("<script> alert('"+alert_str.get("send_password."+lang)+"'); location='../../home.jsp'; </script>");
			}else if(action.equals("tacva")){
				out.println("<script> alert('"+alert_str.get("send_success."+lang)+"'); location='tacva.jsp'; </script>");
			}else if(action.equals("nacva")){
				out.println("<script> alert('"+alert_str.get("send_success."+lang)+"'); location='nacva.jsp'; </script>");
			}
		} catch (Exception ex) {
			System.out.println("Project:" + projectName + ", Error info:["+ex+"], File name:web/member/member_sendmail.jsp, Time:["+DateTimeTool.dateTimeString()+"]");
			
			if(action.equals("add")){
				out.println("<script> alert('"+alert_str.get("system_error."+lang)+"'); location='../../home.jsp'; </script>");
			}else if(action.equals("forget")) {
				out.println("<script> alert('"+alert_str.get("system_bug."+lang)+"'); location='../../home.jsp'; </script>");
			}else if(action.equals("tacva")){
				out.println("<script> alert('"+alert_str.get("system_error."+lang)+"'); location='tacva.jsp'; </script>");
			}else if(action.equals("nacva")){
				out.println("<script> alert('"+alert_str.get("system_error."+lang)+"'); location='nacva.jsp'; </script>");
			}
		} finally {
			app_sm.close();
		}
	}
%>