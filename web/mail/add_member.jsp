<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="../include/words.jsp" %>
<% 
	// 語系變數為 lang
	String page_code = "member";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	
	String mp_id	 = StringTool.validString(request.getParameter("mp_id"));
	TableRecord mp	 = app_sm.select(tblmp, mp_id);

	// Server name.	
	String servername = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
	if(request.getServerPort()== 80 || request.getServerPort()== 443) {
		servername = request.getScheme()+"://"+request.getServerName();
	}
	String localname = request.getScheme()+"://"+request.getLocalName()+":"+request.getLocalPort();
	String url = servername + request.getContextPath() + "/web/mail";

  lang = StringTool.validString(request.getParameter("lang"));
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=show_str.get("add."+lang) %></title>
</head>

<body>
	<table width="730" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>
        	<img src="<%=url %>/images/top.png" width="730" style="display:block; border:none;" />
        </td>
      </tr>
      <tr style="background:url(<%=url %>/images/main.png) top left repeat-y;">
        <td align="center">
       	  <table width="571" border="0" cellpadding="8" cellspacing="0" style="font-size:12px; line-height:20px; margin-top:10px; margin-bottom:10px;">
              <tr>
                <td colspan="2" align="center" style="padding-left:6px; padding-right:6px; padding-bottom:10px;">
                	<img src="<%=url %>/../images/logo.png" width="250" />
                </td>
              </tr>
              <tr>
                <td colspan="2" align="center" style="font-size:15px; color: #000; letter-spacing:1.3px; line-height:24px; padding-left:6px; padding-right:6px; padding-bottom:10px; padding-top:10px; border-bottom: solid 1px #ccc;">
                	<strong>- <%="tw".equals(lang)?"會員加入通知信":"Member Join Notification Letter" %> -</strong>
                </td>
              </tr>
              <tr>
                <td colspan="2" align="left" style="font-size:13px; letter-spacing:1.3px; line-height:24px; padding-left:6px; padding-right:6px; padding-bottom:20px; padding-top:20px;">
                    <%="tw".equals(lang)?"您好,感謝您加入會員,以下為您填的資料:":"Thank you for joining the membership, the information you filled is as follows:" %> 
                </td>
              </tr>
              <tr>
                <td width="22%" align="left" valign="top"><%=show_str.get("name."+lang) %>：</td>
                <td width="78%" align="left" valign="top"><%=mp.getString("mp_name") %></td>
              </tr>
              <tr style="background:#F2EFE9;">
                <td align="left" valign="top"><%=show_str.get("phone."+lang) %>：</td>
                 <td align="left" valign="top"><%=mp.getString("mp_phone") %></td>
              </tr>
              
              <tr>
                <td align="left" valign="top">E-mail：</td>
                 <td align="left" valign="top"><%=mp.getString("mp_account") %></td>
              </tr>
              
          	</table>

            <table width="571" border="0" cellspacing="0" cellpadding="0" style="font-size:11px; color:#666;">
              <tr >
                <td align="center" style="border-top: dashed 1px #999; line-height:30px;">- <%=alert_str.get("contact.alert."+lang) %> -</td>
              </tr>
            </table>

        </td>
      </tr>
      <tr>
        <td>
        	<img src="<%=url %>/images/footer.png" width="730" style="display:block; border:none;" />
        </td>
      </tr>
    </table>

</body>
</html>
