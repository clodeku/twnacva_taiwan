<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	//相關參數設定
	String code 		= "member";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	String show_title 	= "會員資料維護";				// 功能標題
	
%>
<html>
<head>
<%@include file="include/head.jsp"%>
<script language="JavaScript" type="text/JavaScript">
function checkform(F) {
    var isPhone = /^\(?\d{2}\)?[\s\-]?\d{4}\-?\d{4}$/;								// 驗證連絡電話 
    var isEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  // 使用 isEmail.test(欄位名稱) 檢查 E-Mail 是否格式正確 , 正確為 true
   	
    if(F.mp_name.value == "") {
        alert("請輸入姓名");
        F.mp_name.focus();
    } else if(F.mp_phone.value == "" || !isPhone.test(F.mp_phone.value)) {
        alert("請輸入有效的聯絡電話");
        F.mp_phone.focus();
    } else if(F.mp_unit.value == "") {
        alert("請輸入服務單位");
        F.mp_unit.focus();
    } else if(F.mp_job.value == "") {
        alert("請輸入職稱");
        F.mp_job.focus();
    } else if(F.mp_join.value == "") {
        alert("請選擇是否為會員");
        F.mp_join[0].focus();
    } else if(F.rs_type.value == "") {
        alert("請選擇繳款別");
        F.rs_type[0].focus();
    } else if(F.mp_receipt_name.value == "") {
        alert("請輸入收據抬頭");
        F.mp_receipt_name.focus();
    } else if(F.mp_receipt_address.value == "") {
        alert("請輸入收據地址");
        F.mp_receipt_address.focus();
    } else if(F.mp_recipient.value == "") {
        alert("請輸入收件人");
        F.mp_recipient.focus();
    } else if(F.mp_account.value == "" || !isEmail.test(F.mp_account.value)) {
        alert("請輸入有效的 E-mail");
        F.mp_account.focus();
    } else if(F.mp_address.value == "") {
        alert("請輸入通訊地址");
        F.mp_address.focus();
    } else if(F.rs_pay.value == "") {
        alert("請選擇是否繳款");
        F.rs_pay[0].focus();
    } else if(F.rs_digits.value == "") {
        alert("請輸入匯款單據帳末五碼");
        F.rs_digits.focus();
    } else {
        return true;
    }
	
    return false;
}
</script>
<script src="<%=request.getContextPath() %>/js/zip.js"></script>
<style type="text/css">
	.style1 {
		color: #FF0000
	}
</style>
</head>
<body style="background-color: rgb(255, 255, 255);">
<div align="center">
  <table width="1280" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2"><table width="1280" border="0" cellspacing="0" cellpadding="0">        
<%@include file="/WEB-INF/jspf/mis/top.jspf"%>
      </table></td>
    </tr>
    <tr>
      <td width="3" align="center" valign="top" class="web_bk-2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><IFRAME HEIGHT="800" width="155" MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"></IFRAME></td>
        </tr>
      </table></td><td width="1125" align="center" valign="top" class="system_bk-2p"><!-- InstanceBeginEditable name="system-page" -->
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" class="web_bk-2b">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td width="60" align="left" valign="middle"><img src="../images/web_icon_1.gif" width="55" height="48"></td>
            <td align="left" valign="middle" class="web_bigword"><%=show_title %></td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
<form name="form0" method="post" action="<%=code %>_update.jsp?action=A" enctype="multipart/form-data" onsubmit="return checkform(this);">
 
  <input type="hidden" name="mp_status" value="Y">
          <tr align="center">
            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr align="center">
                      <td colspan="4" class="web_title-1"> 會員資料&nbsp;
                      	<span>
                        	<input name="" type="button" value="會員資料新增" onClick="location='<%=code %>_a.jsp'" />
                      	</span>&nbsp;
                        <span>
                        	<input name="" type="button" value="會員資料查詢" onClick="location='<%=code %>.jsp'" />
                        </span>
                      </td>
                    </tr>
                    <tr align="center" class="web_bk-2">
                      <td colspan="4">會員資料－新增</td>
                    </tr>
                    
                    <tr align="center">
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>姓名</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_name" id="mp_name" type="text" size="30" maxlength="15">
                      </td>
                   	  <td class="web_table-2-1" align="right"><span class="style1">＊</span>帳號(E-Mail)</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_account" type="text" size="30" maxlength="50">
                      </td>                       
                    </tr>  

                    <tr align="center">
                      <td width="160" class="web_table-2-1" align="right"><span class="style1">＊</span>密碼</td>
                      <td width="340" class="web_table-2-1" align="left">
                        <input name="mp_password" type="password" size="30" maxlength="30">
                        
                      </td>
                      <td width="160" class="web_table-2-1" align="right" nowrap><span class="style1">＊</span>再次輸入密碼</td>
                      <td width="340" class="web_table-2-1" align="left">
                        <input name="mp_pswd" type="password" size="30" maxlength="30">
                        
                      </td>
                    </tr>

                    <tr align="center">
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>服務單位</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_unit" type="text" size="30">
                      </td>
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>職稱</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_job" type="text" size="30">
                      </td>
                    </tr>
                    
                    <tr align="center">
                      <td width="160" class="web_table-2-1" align="right"><span class="style1">＊</span>是否為會員</td>
                      <td width="340" class="web_table-2-1" align="left">
                      	<label>
                          <input type="radio" name="mp_join" value="Y" />
                          是
                        </label>
                        <label>
                          <input type="radio" name="mp_join" value="N" />
                          否
                        </label>  
                      </td>
                      
                      <td width="160" class="web_table-2-1" align="right">繳款別</td>
                      <td width="340" class="web_table-2-1" align="left">
                        <input type="hidden" name="rs_type" id="rs_type" value="add"/>
                        入會費/常年會費 3,000/年
                      </td>
                    </tr>

                    <tr align="center">
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>收據抬頭(個人/公司)</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_receipt_name" type="text" size="30">
                      </td>
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>收據郵寄地址</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_receipt_address" type="text" size="30">
                      </td>
                    </tr>
                    
                    <tr align="center">
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>收件人</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_recipient" id="mp_recipient" type="text" size="30">
                        <input type="checkbox" name="same_name" id="same_name"  >
                        <label for="same_name">同聯絡人</label> 
                        
                        <script>
	                    	// 同聯絡人
	                        $("#same_name").attr("checked", false);
	                                
	                        $('#same_name').click(function() {
	                        	if($('#same_name').is(':checked')){
	                            	$('#mp_recipient').val($('#mp_name').val());
	                            	$('#same_name').val('Y');
                            	} else {
                                	$('#mp_recipient').val('');
                                	$('#same_name').val('');
                                }
                                	
                           	<%--
								if($('#same_name').val() == "") {
									$('#rs_name').val($('#aa_name').val());
									$('#same_name').val("Y")
								} else {
									$('#rs_name').val("");
									$('#same_name').val("")
								}
							--%>
							});
                         </script>
                      </td>
                      
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>電話</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_phone" type="text" size="30">
                      </td>
                    </tr>
                    
                    <tr align="center">
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>是否繳款</td>
                      <td class="web_table-2-1" align="left">
                        <input type="radio" name="rs_pay" value="Y">是&nbsp;
                        <input type="radio" name="rs_pay" value="N">否
                      </td>
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>匯款單據帳末五碼</td>
                      <td class="web_table-2-1" align="left">
                        <input name="rs_digits" type="text" size="30">
                      </td>
                    </tr>
                    
                    <%--
                    <tr align="center">
                      <td class="web_table-2-1"><div align="right">通訊地址</div></td>
                      <td colspan="3" class="web_table-2-1" align="left">
                        <input type="hidden" name="county" value="">
                        <input type="hidden" name="city" value="">
                        縣市<select name="mp_county" id="mp_county" onchange="changeZone(form0.mp_county, form0.mp_city, form0.mp_zipcode, form0.county, form0.city)"></select>
                        鄉鎮區市<select name="mp_city" id="mp_city" onchange="showZipCode(form0.mp_county, form0.mp_city, form0.mp_zipcode, form0.county, form0.city)"></select>
                        郵遞區號<input type="text" name="mp_zipcode" id="mp_zipcode" size="1" readonly>
                        <input name="mp_address" type="text" size="60" maxlength='50'>
                        </td>
                    </tr>
                    --%>
                    
 					<tr align="center">
                      <td class="web_table-2-1"><div align="right"><span class="style1">＊</span>通訊地址</div></td>
                      <td colspan="3" class="web_table-2-1" align="left">                    
                          <input name="mp_address" type="text" size="136" maxlength='100'>
                        </td>
                    </tr>                  

                    <tr align="center">
                      <td class="web_table-2-1"><div align="right">建檔人員</div></td>
                      <td class="web_table-2-1"><div align="left"><%=app_account%></div></td>
                      <td class="web_table-2-1"><div align="right">建檔日期</div></td>
                      <td class="web_table-2-1"><div align="left"><%=app_today%></div></td>
                    </tr>
                </table></td>
              </tr>
            </table>              <br>
            <input type="submit" value="確定送出" >&nbsp;&nbsp;
            <input type="reset" value="重新設定">
            </td>
          </tr>
</form>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" class="web_bk-2b">&nbsp;</td>
          </tr>
        </table>
      <!-- InstanceEndEditable --></td>
    </tr>
  </table>
</div>
</body>
<!-- InstanceEnd --></html>
<script> ResetAll(form0.mp_county, form0.mp_city, form0.mp_zipcode, form0.county, form0.city); </script>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>