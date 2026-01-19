<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%
	// Clear session
   	if(!session.isNew()) session.invalidate();
   	// Begin year
   	String beginyear = "2019";
   	// End year
   	String endyear = String.valueOf(DateTimeTool.getYear());
   	// 語系
   	// 讀取 site_setup 中的語系設定   Marco 20131101
   	String[] ss_lang_text = app_sm.select(tblss, "ss_title=? AND ss_keyword=?", new Object[]{"可用語言版本","web.language.offer"}).getString("ss_text").split(";");
   	String[] ss_lang_value = app_sm.select(tblss, "ss_title=? AND ss_keyword=?", new Object[]{"可用語言版本","web.language.offer"}).getString("ss_value").split(";");
%>
<html>
<head>
<%@include file="/WEB-INF/jspf/norobots.jspf"%>
<%@include file="../../JQuery/jquery.jsp" %>
<title><%=app_mistitle%></title>
<%-- 後台 Title 使用之 ICON --%>
<link rel="shortcut icon" href="./images/favicon.png" /><!--電腦版icon-->
<link rel="apple-touch-icon" href="./images/icon.png" /><!--手機版icon  57x57px-->
<link rel="apple-touch-icon" sizes="72x72" href="./images/icon-72.png" /><!--手機版icon  72x72px-->
<link rel="apple-touch-icon" sizes="114x114" href="./images/icon@2.png" /><!--手機版icon  114x114px-->
<link href="css/adm_css.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.style3 { color: #666666 }
	.style4 { color: #333333 }
</style>
<script language="JavaScript" type="text/JavaScript">
	function validLiteral(INPUT) {
	    var litExp = /\W+/;		// non numeral or letter or underscore
	    var invalid = litExp.test(INPUT);
	    return !invalid;
	}
	function checkform(F) {
	    if (F.au_account.value == "" || !validLiteral(F.au_account.value)) {
	        alert("請輸入有效的帳號資料");
	        F.au_account.focus();
	        return false;
	    } else if(F.au_password.value == "" || !validLiteral(F.au_password.value)) {
	        alert("請輸入有效的密碼資料");
	        F.au_password.focus();
	        return false;
		} else if (F.ind.value == "") {
		    alert("請輸入圖案文字!!");
		    F.ind.focus();
		    return false;        
	    } else {
	    	F.language_str.value = $("#language option:selected").text();
	        return true;
	    }
	}
	function loadimage() { 
		document.getElementById("randImage").src = "../comm/image.jsp?"+Math.random(); 
	}
</script>
</head>
<body onload="loginForm.au_account.focus();">
<div align="center">
  	<br><br><br>
  	<table width="924" border="0" cellspacing="0" cellpadding="0">
    	<tr>
      		<td><img src="images/eip_3.gif" width="924" height="12" /></td>
    	</tr>
    	<!--
    	<tr background="images/eip_5.gif">
      		<td height="67" align="left" valign="middle" background="images/eip_5.gif"><table width="0" border="0" cellspacing="0" cellpadding="0">
        		<tr>
	          		<td><img src="images/eip_01.gif" width="10" height="10"></td>
          			<td>&nbsp;</td>
        		</tr>
      		</table></td>
    	</tr>
    	-->
    	<tr>
	      	<td align="center" valign="top" background="images/eip_5.gif"><table width="918" border="0" cellspacing="0" cellpadding="0">
	        	<tr>
	          		<td height="416" align="center" valign="bottom" background="images/bg.jpg"><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
	            		<tr>
	              			<td width="54%" valign="middle"><br /><br /><br /><br /><br /><br /><br />				
								<table width="316" height="177"  border="0" align="center" cellpadding="0" cellspacing="0" class="side">
	                				<tr>
	                  					<td id="test" style="padding: 20px 0px 0px 0px;">
<form name="loginForm" method="post" action="login.jsp" onsubmit="return checkform(this);">
											<table width="252" border="0" align="center" valign="absmiddle" cellpadding="3" cellspacing="0">
	                    						<tr>
	                      							<td width="88" align="right" class="word-wbk"><div align="center" class="style3">
	                        							<div align="center">帳&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;號：</div>
	                      							</div></td>
	                      							<td width="152" align="left"><input name="au_account" type="text" size="20" /></td>
	                    						</tr>
	                    						<tr>
	                      							<td height="31" align="right" class="word-wbk"><div align="center" class="style3">
	                        							<div align="center">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;碼：</div>
	                      							</div></td>
	                      							<td align="left"><input name="au_password" type="password" size="20" /></td>
	                    						</tr>
	
												<input name="language_str" id="language_str" type="hidden" value="" />
												<tr <%=(ss_lang_value.length == 1)?"style='display: none'":"" %>>
	                    							<td align="right" class="word-wbk">
		                    							<div align="center" class="style3">
		                        							<div align="center">語&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系：</div>
		                      							</div>
	                      							</td>
	                      							<td align="left"><select name="language" id="language">
	                      							<%for(int i=0 ; i < ss_lang_value.length; i++){ %>
														<option value="<%=ss_lang_value[i] %>" ><%=ss_lang_text[i] %></option>
													<%} %>
													</select></td>
	                    						</tr>
	
	                    						<tr>
	                      							<td align="right" class="word-wbk"><div align="center" class="style3">
	                        							<div align="center">驗證碼：</div>
	                      							</div></td>
	                      							<td  align="left">
	                      								<input name="ind" id="ind" size="6" />&nbsp;
	                      								<img src="../comm/image.jsp" name="randImage" id="randImage" width="72" height="27" style="vertical-align: middle;" />
	                      							</td>
	                    						</tr>
	
	                    						<tr>
	                      							<td colspan="2" align="left">
		                    							<a href="javascript:loadimage();">
		                  	  								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重取驗證碼！
		                    							</a>
		                    							<span style="color:#c30000;">
		                  	  								(請注意英文字母大小寫！)
		                    							</span>
	                      							</td>
	                    						</tr>  
	
												<tr>
	                      							<td height="<%=(ss_lang_value.length == 1)?"60":"20" %>" colspan="2" align="right" class="word-wbk"><div align="center" class="style3">
	                        							<input name="login" type="submit" class="button" value="登入" />&nbsp;&nbsp;&nbsp;&nbsp;
	                        							<input name="reset" type="reset" class="button" value="重填" />
	                      							</div></td>
	                    						</tr>
	                    						<tr align="center">
	                      							<td>&nbsp;</td>
	                      							<td>&nbsp;</td>
	                    						</tr>
	                    						<tr align="center">
	                    	  						<td>&nbsp;</td>
	                      							<td>&nbsp;</td>
	                    						</tr>
	                  						</table>
</form>
										</td>
	                				</tr>
	              				</table>
							</td>
	              			<td width="46%">&nbsp;</td>
	            		</tr>
	          		</table></td>
	        	</tr>
	      	</table><noscript><font color="blue">您的瀏覽器未開啓 Active scripting 功能，將無法正常瀏覽網站!</font></noscript></td>
    	</tr>
	    <!--
	    <tr>
	      	<td height="60" align="right" valign="bottom" background="images/eip_5.gif"><table width="0" border="0" cellspacing="0" cellpadding="0">
	        	<tr>
	          		<td>&nbsp;</td>
	          		<td><img src="images/eip_01.gif" width="10" height="10"></td>
	        	</tr>
	      	</table></td>
	    </tr>
	    -->
	    <tr>
	      	<td height="25" align="center" class="bk-1w">&copy; <%=beginyear%><%=(endyear.equals(beginyear))?"":"-"+endyear%> <%=app_mistitle%></td>
	    </tr>
  	</table>
</div>
</body>
</html>