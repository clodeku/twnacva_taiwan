<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="../include/words.jsp" %>
<%
	//參數設定
	String page_code 	= "activity", 				  	    // 頁面識別碼
		   banner_code	= "activity",					        // banner識別碼
		   bannerImg 	= "../images/inBanner.jpg";  	    // 內頁banner預設圖
	
    // 取得會員資料
    TableRecord member = (TableRecord) session.getAttribute("member");
    boolean is_member = (member != null)?true:false;  // 判別是否登入

	// 資料編號
	String ai_id = StringTool.validString(request.getParameter("ai_id"));
								   
	// 資料內容
	TableRecord ai = app_sm.select(tblai , ai_id);

    // 協會帳戶資料
    TableRecord account_cp = app_sm.select(tblcp, "cp_code=? and cp_lang=?", new Object[]{"account", lang});
    
	// 內頁banner
	TableRecord inbanner_ap = app_sm.select(tblap,"ap_code=? and ap_lang=? and ap_category=?"
			, new Object[]{"sub_banner", lang, banner_code});
	if(!"".equals(inbanner_ap.getString("ap_image"))) {
		bannerImg = app_fetchpath+"/sub_banner/"+lang+"/"+inbanner_ap.getString("ap_image");
	}
%>

<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/in.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <title><%=app_webtitle %></title>

    <%-- SEO 讀取關鍵字設定值 (讀取首頁共用值) --%>
	<meta name="Robots" content="<%=SiteSetup.getText("seo.robots."+lang) %>" />
	<meta name="revisit-after" content="<%=SiteSetup.getText("seo.revisit_after."+lang) %> days" />
	<meta name="keywords" content="<%=SiteSetup.getText("seo.keywords."+lang) %>" />
	<meta name="copyright" content="<%=SiteSetup.getText("seo.copyright."+lang) %>" />
	<meta name="description" content="<%=SiteSetup.getText("seo.description."+lang) %>" />
	<%-- 追蹤碼 --%><%=SiteSetup.getText("seo.track."+lang) %>
	
	<%-- OG 設定 --%>
	<%
	// Server name.	
	String servername = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
	if(request.getServerPort() == 80 || request.getServerPort() == 443) {
		servername = request.getScheme()+"://"+request.getServerName();
	}
	String localname = request.getScheme()+"://"+request.getLocalName()+":"+request.getLocalPort();
	String url = servername + request.getContextPath();
	%>
	<meta property="og:url"           content="<%=request.getRequestURL()+(request.getQueryString()!=null&&!request.getQueryString().isEmpty()?"?"+request.getQueryString():"")%>" />
	<meta property="og:type"          content="website" />
	<meta property="og:title"         content="<%=app_webtitle %>" />
	<meta property="og:description"   content="<%=SiteSetup.getText("seo.description."+lang) %>" />
	<meta property="og:image"         content="<%=url+"/web/images/icon.png" %>" />
	
	<%-- 共用設定 --%>
	<%@include file="../include/head.jsp" %>

    <script language="JavaScript" type="text/JavaScript">
        function checkform(F) {
	        var isPhone = /^\(?\d{2}\)?[\s\-]?\d{4}\-?\d{4}$/;								// 驗證連絡電話 
            var isEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  // 使用 isEmail.test(欄位名稱) 檢查 E-Mail 是否格式正確 , 正確為 true
           	
            $(".form_btn_area input.confirm").attr("disabled", true);

            if(F.aa_name.value == "") {
            	alert("<%=alert_str.get("name."+lang) %>");
                F.aa_name.focus();
            } else if(F.aa_phone.value == "" || !isPhone.test(F.aa_phone.value)) {
            	alert("<%=alert_str.get("phone."+lang) %>");
                F.aa_phone.focus();
            } else if(F.aa_unit.value == "") {
            	alert("<%=alert_str.get("unit."+lang) %>");
                F.aa_unit.focus();
            } else if(F.aa_job.value == "") {
            	alert("<%=alert_str.get("job."+lang) %>");
                F.aa_job.focus();
            } else if(F.aa_identity.value == "") {
            	alert("<%=alert_str.get("join."+lang) %>");
                F.aa_identity[0].focus();
            } else if(!$('#rs_type').is(':checked')) {
	        	alert("<%=alert_str.get("payment_type."+lang) %>");
	        	$("#rs_type").focus();
	        } else if(F.aa_cost.value == "") {
            	alert("<%=alert_str.get("price."+lang) %>");
                F.aa_cost.focus();
            } else if(F.rs_type.value == "") {
            	alert("<%=alert_str.get("payment_type."+lang) %>");
                F.rs_type[0].focus();
            } else if(F.rs_title.value == "") {
            	alert("<%=alert_str.get("receipt_name."+lang) %>");
                F.rs_title.focus();
            } else if(F.rs_address.value == "") {
            	alert("<%=alert_str.get("receipt_address."+lang) %>");
                F.rs_address.focus();
            } else if(F.rs_name.value == "") {
            	alert("<%=alert_str.get("recipient."+lang) %>");
                F.rs_name.focus();
            } else if(F.aa_email.value == "" || !isEmail.test(F.aa_email.value)) {
            	alert("<%=alert_str.get("email."+lang) %>");
                F.aa_email.focus();
            } else if(F.aa_address.value == "") {
            	alert("<%=alert_str.get("address."+lang) %>");
                F.aa_address.focus();
            } else if(F.aa_collect.value == "") {
            	alert("<%=alert_str.get("pay."+lang) %>");
                F.aa_collect.focus();
            } else if(F.rs_digits.value == "") {
            	alert("<%=alert_str.get("digits."+lang) %>");
                F.rs_digits.focus();
            } else if(!$("#agree").is(":checked")) {
            	alert("<%=alert_str.get("privacy."+lang) %>");
                $("#agree").focus();
            } else if (F.ind.value == "") {
            	alert("<%=alert_str.get("code."+lang) %>");
                F.ind.focus();
            } else {
            	$(".form_btn_area input.confirm").attr("disabled", false);
                return true;
            }
			
            $(".form_btn_area input.confirm").attr("disabled", false);
            
            return false;
        }

        function loadimage() { 
            document.getElementById("randImage").src = "../../comm/image.jsp?"+Math.random(); 
        }
    </script>
    
    
</head>

<body>
    <%-- 版頭設定 --%>
    <%@include file="../include/top_menu.jsp" %>
    
    <!--main-->
    <div class="main">
    	
        <!--內頁banner-->
        <div class="in_Banner">
        	<img src="<%=bannerImg %>" width="1280" height="288" />
        </div>
        
        <div class="wrap">
		<!-- InstanceBeginEditable name="main" -->
            
            <!--左側-->     
            <div class="left">
                <!--左側標題-->
                <div class="left_tit">
                    <%=show_str.get("activity."+lang) %>
                </div>
                <!--左側選單區塊-->
                <div class="left_list_area">
                    <!-- 更改名字 modify by david 20220822 start -->
                    <div class="left_list"><!--當前模式class加active-->
                        <a href="../activity/activity.jsp">
                            <!-- 最新活動 -->
                            <%=show_str.get("activity_info."+lang) %>
                        </a>	
                    </div>
                    <div class="left_list active">
                        <a href="../activity/activity_apply.jsp">
                            <!-- 教育訓練 -->
                            <%=show_str.get("activity_apply."+lang) %>
                        </a>	
                    </div>
                    <!-- modify by david 20220822 end -->
                </div>
            </div>
            
            
            <!--右側-->
            <div class="right">
                <!--右側標題-->
                <div class="right_tit">
                    <%=show_str.get("apply_data."+lang) %>
                </div>
                
                <!--最新消息內頁標題-->
                <div class="newsInTit">
                    <!-- <div class="nIT_time">
                        2022-11-28
                    </div> -->
                    <!--內頁標題-->
                    <!-- <div class="nIT_tit">
                    	報名項目: <span>107年優良創新老店選拔暨表揚活動開始囉，歡迎滿六十年以上的店家踴躍報名參加</span>
                    </div> -->
                </div>
                
                
                <!--備註-->
                <div class="form_remark" style="padding-top:25px;">
                    <!--必填icon-->
                    <div class="required_icon">
                        *
                    </div>
                    <span style="color:#c13e42;">
                        <%=show_str.get("required."+lang) %>
                    </span>
                </div>
                
                <div class="white_bg">
                    <!--表單區-->
                    <div class="form_area">
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit title_line">
                                <%=field_str.get("activity_title."+lang) %>
                            </div>
                            <div class="fLR_info">
                                <%=ai.getString("ai_title") %>
                            </div>
                        </div>
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit title_line">
                                <%=field_str.get("activity_date."+lang) %>
                            </div>
                            <div class="fLR_info">
                                <%=ai.getString("ai_date") %>~<%=ai.getString("ai_date_end") %>
                            </div>
                        </div>
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit title_line">
                                <%=field_str.get("activity_code."+lang) %>
                            </div>
                            <div class="fLR_info">
                                <%=ai.getString("ai_no") %>
                            </div>
                        </div>
                        <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                            <div class="fL_tit title_line">
                                <%=field_str.get("deadline."+lang) %>
                            </div>
                            <div class="fLR_info">
                                <%=ai.getString("ai_endday") %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="white_bg">
                    <br>
                    <strong style="padding-left: 6px; font-size: 15px;"><%=show_str.get("association_account."+lang) %>:</strong>
                    <section class="text_area">
                        <%=account_cp.getString("cp_content") %>
                    </section>
                </div>

                <form name="form_apply" method="post" action="<%=page_code %>_apply_update.jsp?action=apply&ai_id=<%=ai.getString("ai_id") %>" enctype="multipart/form-data" onsubmit="return checkform(this);">
                    <div class="white_bg">
                        <!--表單區-->
                        <div class="form_area">
                        
                            <%-- 姓名 --%>
                            <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                                <div class="fL_tit">
                                    <%=field_str.get("name."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <input type="text" name="aa_name" id="aa_name" value="<%=is_member?member.getString("mp_name"):"" %>">
                                </div>
                            </div>
                                                            
                            <%-- 連絡電話 --%>
                            <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                                <div class="fL_tit">
                                    <%=field_str.get("phone."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <input type="text" name="aa_phone" id="aa_phone" value="<%=is_member?member.getString("mp_phone"):"" %>">
                                </div>
                            </div>
                            <%-- 服務單位 --%>
                            <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                                <div class="fL_tit">
                                    <%=field_str.get("unit."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <input type="text" name="aa_unit" id="aa_unit" value="<%=is_member?member.getString("mp_unit"):"" %>">
                                </div>
                            </div>
                                                            
                            <%-- 職稱 --%>
                            <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                                <div class="fL_tit">
                                    <%=field_str.get("job."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <input type="text" name="aa_job" id="aa_job" value="<%=is_member?member.getString("mp_job"):"" %>">
                                </div>
                            </div>
                                                            
                            <%-- 是否為會員 --%>
                            <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                                <div class="fL_tit">
                                    <%=field_str.get("is_member."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <label class="form_label"><!--調整位置用 class 加 form_label-->
                                        <input type="radio" name="aa_identity" value="Y" <%=is_member?"selected":"" %>>
                                        <%=field_str.get("yes."+lang) %>
                                    </label>
                                    &nbsp;&nbsp;
                                    <label class="form_label" ><!--調整位置用 class 加 form_label-->
                                        <input type="radio" name="aa_identity" value="N">
                                        <%=field_str.get("no."+lang) %>
                                    </label>
                                    &nbsp;&nbsp;
                                    
                                </div>
                            </div>

                            
                            <%-- 繳款別 --%>
                            <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                                <div class="fL_tit">
                                    <%=field_str.get("payment_type2."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <div class="same_area">
                                        <input class="magic_checkbox" type="checkbox" name="rs_type" id="rs_type">
                                        <label for="rs_type"><%=field_str.get("course_receipt."+lang) %>,</label> 
                                        <label for="aa_cost"><%=field_str.get("fill_in."+lang) %></label>
                                        <input type="text" name="aa_cost" id="aa_cost">
                                    </div>
                                </div>
                            </div>

                            <%-- 收據抬頭 --%>
                            <div class="form_list fLType2">
                                <div class="fL_tit">
                                    <%=field_str.get("receipt_name."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <input type="text" name="rs_title" id="rs_title" value="<%=is_member?member.getString("mp_receipt_name"):"" %>">
                                </div>
                            </div>

                            <%-- 收據地址 --%>
                            <div class="form_list fLType2">
                                <div class="fL_tit">
                                    <%=field_str.get("receipt_address."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <input type="text" name="rs_address" id="rs_address" value="<%=is_member?member.getString("mp_receipt_address"):"" %>">
                                </div>
                            </div>

                            <%-- 收件人 --%>
                            <div class="form_list fLType2">
                                <div class="fL_tit">
                                    <%=field_str.get("recipient."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                    <div class="same_area">
                                        <input class="magic_checkbox" type="checkbox" name="same_name" id="same_name">
                                        <label for="same_name"><%=field_str.get("same_person."+lang) %></label> 
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <input type="text" name="rs_name" id="rs_name" value="<%=is_member?member.getString("mp_recipient"):"" %>">
                                </div>
                                
                                <script>
	                             	// 同聯絡人
	                                $("#same_name").attr("checked", false);
	                                
	                                $('#same_name').click(function() {
	                                	if($('#same_name').is(':checked')){
	                                		$('#rs_name').val($('#aa_name').val());
	                                		$('#same_name').val('Y');
	                                	} else {
	                                		$('#rs_name').val('');
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
                            </div>

                            <%-- E-mail --%>
                            <div class="form_list fLType2">
                                <div class="fL_tit">
                                    E-mail:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <input type="text" name="aa_email" id="aa_email" value="<%=is_member?member.getString("mp_account"):"" %>">
                                </div>
                            </div>

                            <%-- 通訊地址 --%>
                            <div class="form_list ">
                                <div class="fL_tit">
                                    <%=field_str.get("address."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <input type="text" name="aa_address" id="aa_address" value="<%=is_member?member.getString("mp_address"):"" %>">
                                </div>
                            </div>

                            <%-- 是否繳費 --%>
                            <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                                <div class="fL_tit">
                                    <%=field_str.get("is_paid."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <label class="form_label"><!--調整位置用 class 加 form_label-->
                                        <input type="radio" name="aa_collect" value="Y">
                                        <%=field_str.get("yes."+lang) %>
                                    </label>
                                    &nbsp;&nbsp;
                                    <label class="form_label"><!--調整位置用 class 加 form_label-->
                                        <input type="radio" name="aa_collect" value="N">
                                        <%=field_str.get("no."+lang) %>
                                    </label>
                                    &nbsp;&nbsp;
                                    
                                </div>
                            </div>
                             
                            <%-- 匯款單末5碼 --%>
                            <div class="form_list fLType2"><!--一列兩個時class內加fLType2-->
                                <div class="fL_tit">
                                    <%=field_str.get("digits."+lang) %>:
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fLR_info">
                                    <input type="text" name="rs_digits" id="rs_digits">
                                </div>
                            </div>
                             
                            <!-- 驗證碼 -->
                            <div class="form_list">
                                <div class="fL_tit">
                                    <%=field_str.get("code."+lang) %>
                                    <div class="required_icon">
                                        *
                                    </div>
                                </div>
                                <div class="fL_info captcha no_border">
                                    <input type="text" name="ind" id="ind">
                                    <img src="../../comm/image.jsp" name="randImage" id="randImage" width="72" height="27">
                                    
                                    <a href="javascript:loadimage();">
                                        <img src="../images/rotate.svg"/>
                                    </a>
                                    <span>
                                        (<%=field_str.get("code_info."+lang) %>)
                                    </span>
                                </div>
                            </div>
                            <div class="clearfloat">
                            </div>
                        </div>
                    </div>
                    <!--隱私權-->
                    <div class="agreeToTerms agree">
                        <div class="agreeList">
                            <input type="checkbox" class="" id="agree" placeholder="" />
                            <label for="agree" class="">
                                <%=field_str.get("agree."+lang) %>
                                <a href="../privacy/privacy.jsp"><%=field_str.get("privacy."+lang) %></a>
                            </label>
                        </div>
                    </div>
                    <div class="form_btn_area one">
                        <input type="button" value="<%=show_str.get("goback."+lang) %>" onclick="location='javascript:window.history.back(-1);'">
                        <input class="confirm disAbled" type="submit" value="<%=field_str.get("submit."+lang) %>" disAbled>
                        <div class="clearfloat">
                        </div>
                        
                        <!--同意書_按鈕區.js-->
                        <script type="text/javascript">
                            $(function(){

                                $("#agree").attr("checked",false);
                                $(".form_btn_area input.confirm").attr("disabled", true);

                                $('#agree').on('change', function () {  //當checkbox框有變動(change/勾選或取消勾選)時
                                    $(".form_btn_area input.confirm").toggleClass("disAbled")
                                    $(".form_btn_area input.confirm").attr("disabled", false);
                                })
                                
                                
                                
                                
                                


                                
                                // $('#agree').on('change', function () {  //當checkbox框有變動(change/勾選或取消勾選)時
                                //     $(".btn_area").slideToggle(200);
                                // })

                                // $("#agree_way , #agree_term").attr("checked",false);
                                // $('#agree_way , #agree_term').on('change', function () {  //當checkbox框有變動(change/勾選或取消勾選)時
                                //     //if ($('#agree_way').is(':checked') && $('#agree_term').is(':checked') ) {
                                //     if ($('#agree_way').is(':checked') && $('#agree_term').attr("checked") ) { //當兩個checkbox框都被checked
                                //         $(".btn_area.activbtn").slideDown(100);
                                //     }
                                //     else{
                                //         $(".btn_area.activbtn").slideUp(100);
                                //     }
                                // })
                            })
                        </script>
                    </div>
                </form>
            </div>
            
            
        	<div class="clearfloat">
            </div>
   		<!-- InstanceEndEditable -->    
        </div>
        
        
    </div>

    <%-- 版腳 --%>
    <%@include file="../include/copyright.jsp" %>
</body>
<!-- InstanceEnd --></html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>