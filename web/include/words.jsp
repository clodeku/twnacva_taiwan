<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 語系切換  - 繁中  英文  簡中
	Map<String, String> show_str = new HashMap();

//	show_str.put("loading.tw","讀取中");
//	show_str.put("loading.en","Loading");
//	show_str.put("loading.cn","读取中");

	//主功能選單
	show_str.put("about.tw","協會簡介");
	show_str.put("about.en","About us");
	show_str.put("about.cn","关于我们");

	show_str.put("news.tw","最新消息");
	show_str.put("news.en","News");
	show_str.put("news.cn","最新新闻");
	
	show_str.put("product.tw","產品介紹");
	show_str.put("product.en","Product");
	show_str.put("product.cn","产品介绍");	
	
	show_str.put("contact.tw","聯絡我們");
	show_str.put("contact.en","Contact Us");
	show_str.put("contact.cn","联络我们");

	show_str.put("member_info.tw","會員資訊");
	show_str.put("member_info.en","Member Info");

	show_str.put("related_links.tw","相關連結");
	show_str.put("related_links.en","Related Links");

	show_str.put("course.tw","教育訓練");
	show_str.put("course.en","Course");

	show_str.put("course_info.tw","課程介紹");
	show_str.put("course_info.en","Course Info");

	show_str.put("course_apply.tw","課程報名");
	show_str.put("course_apply.en","Course Apply");

	show_str.put("activity.tw","活動專區");
	show_str.put("activity.en","Activity");

	show_str.put("activity_info.tw","活動介紹");
	show_str.put("activity_info.en","Activity Info");

	show_str.put("activity_apply.tw","活動報名");
	show_str.put("activity_apply.en","Activity Apply");

	show_str.put("evaluate.tw","評價工具");
	show_str.put("evaluate.en","Evaluate");

	show_str.put("law.tw","評價法令");
	show_str.put("law.en","Laws");

	show_str.put("related_links2.tw","法令連結");
	show_str.put("related_links2.en","Related Laws");

	show_str.put("publications.tw","出版品");
	show_str.put("publications.en","Publications");

	show_str.put("research.tw","研究刊物");
	show_str.put("research.en","Research");

	show_str.put("newsletter.tw","電子報訂閱");
	show_str.put("newsletter.en","Newsletter");

	show_str.put("member.tw","會員專區");
	show_str.put("member.en","Member");

	show_str.put("add.tw","加入會員");
	show_str.put("add.en","Join Member");

	show_str.put("modify.tw","基本資料維護");
	show_str.put("modify.en","Member Profile");

	show_str.put("modifypwd.tw","密碼修改");
	show_str.put("modifypwd.en","Password Modify");

	show_str.put("order.tw","報名紀錄");
	show_str.put("order.en","Order");

	show_str.put("announce.tw","會員公告");
	show_str.put("announce.en","Announce");

	show_str.put("tacva.tw","常年會費繳費");
	show_str.put("tacva.en","TACVA");

	show_str.put("nacva.tw","NACVA代收專區");
	show_str.put("nacva.en","NACVA");

	show_str.put("links.tw","友好連結");
	show_str.put("links.en","Links");

	// 搜尋框
	show_str.put("search.tw","搜尋");
	show_str.put("search.en","search");

	show_str.put("close.tw","關閉");
	show_str.put("close.en","close");

	// 社群連結
	show_str.put("facebook.tw","FB粉絲團");
	show_str.put("facebook.en","Facebook");

	show_str.put("instagram.tw","IG@");
	show_str.put("instagram.en","Instagram");

	// 至頂
	show_str.put("top.tw","回到最上方");
	show_str.put("top.en","To Top");
	
	//最新消息
	show_str.put("goback.tw","回上一頁");
	show_str.put("goback.en","BACK");	
	
	//產品介紹
	show_str.put("dm.tw","型錄下載");
	show_str.put("dm.en","Catalog download");		
	
	show_str.put("download.tw","立即下載");
	show_str.put("download.en","Download");	
	
	show_str.put("pd_desc.tw","產品說明");
	show_str.put("pd_desc.en","Description");		
	
	show_str.put("pd_spec.tw","產品規格");
	show_str.put("pd_spec.en","Specification");	
	
	show_str.put("pd_img.tw","產品圖片");
	show_str.put("pd_img.en","Product Image");		
	
	show_str.put("pd_film.tw","產品影片");
	show_str.put("pd_film.en","Product film");	
	
	show_str.put("pd_file.tw","檔案下載");
	show_str.put("pd_file.en","File download");	

	// 搜尋
	show_str.put("search_result.tw","搜尋結果");
	show_str.put("search_result.en","Search Result");	
	

	// 版尾資訊
	show_str.put("address.tw","公司地址");
	show_str.put("address.en","Company address");
	show_str.put("address.cn","公司地址");

	show_str.put("companyno.tw","統一編號");
	show_str.put("companyno.en","Editor");
	show_str.put("companyno.cn","统编");

	show_str.put("visits.tw","全站瀏覽總數");
	show_str.put("visits.en","Visits");

	// 會員專區
	show_str.put("login.tw","登入");
	show_str.put("login.en","Login");

	show_str.put("logout.tw","登出");
	show_str.put("logout.en","Logout");

	show_str.put("forget.tw","忘記密碼");
	show_str.put("forget.en","Forget Password");

	show_str.put("required.tw","請確認您的必填項目皆已完整填寫。");
	show_str.put("required.en","Please confirm that all required fields have been filled in.");

	show_str.put("privacy.tw", "隱私權政策");
	show_str.put("privacy.en", "Privacy Policy");

	// 線上報名
	show_str.put("course_date.tw", "課程日期");
	show_str.put("course_date.en", "Course Date");

	show_str.put("apply.tw", "報名");
	show_str.put("apply.en", "Apply");

	show_str.put("full.tw", "已額滿");
	show_str.put("full.en", "Full");

	show_str.put("expired.tw", "已截止");
	show_str.put("expired.en", "Expired");

	show_str.put("apply_data.tw", "報名資料填寫");
	show_str.put("apply_data.en", "Apply Data");

	show_str.put("association_account.tw", "協會帳戶");
	show_str.put("association_account.en", "Account Info");

	show_str.put("nacva_info.tw", "NACVA收費說明");
	show_str.put("nacva_info.en", "NACVA Fee Description");
	
	// 報名紀錄
	show_str.put("apply_date.tw", "報名日期");
	show_str.put("apply_date.en", "Apply Date");
	
	show_str.put("apply_no.tw", "報名編號");
	show_str.put("apply_no.en", "Apply Number");
	
	show_str.put("payment_status.tw", "付款狀態");
	show_str.put("payment_status.en", "Payment Status");
	
	show_str.put("paid.tw", "已付款");
	show_str.put("paid.en", "Paid");
	
	show_str.put("not_paid.tw", "未付款");
	show_str.put("not_paid.en", "Not Paid");
	
	show_str.put("apply_detail.tw", "報名明細");
	show_str.put("apply_detail.en", "Apply Detail");
	
	show_str.put("details.tw", "明細內容");
	show_str.put("details.en", "Details");
	

	
//	show_str.put("confirm.tw","請確認您的必填項目皆已完整填寫。");
//	show_str.put("confirm.en","Please confirm that all required items have been filled out.");
//	show_str.put("confirm.cn","请确认您的必填项目皆已完整填写。");
	
//	show_str.put("recap.tw","重取驗證碼");
//	show_str.put("recap.en","Recap verification code");
//	show_str.put("recap.cn","重取验证码");
	
//	show_str.put("attention.tw","(請注意英文字母大小寫！)");
//	show_str.put("attention.en","(Please pay attention to the English letter case!)");
//	show_str.put("attention.cn","(请注意英文字母大小写！)");
	
Map<String, String> field_str = new HashMap <String, String> ();
	// 線上報名
	field_str.put("course_title.tw","課程資訊");
	field_str.put("course_title.en","Course Information");

	field_str.put("course_date.tw","課程日期");
	field_str.put("course_date.en","Course Date");

	field_str.put("course_code.tw","課程代碼");
	field_str.put("course_code.en","Course Code");
	
	field_str.put("activity_title.tw","課程資訊");
	field_str.put("activity_title.en","Activity Information");

	field_str.put("activity_date.tw","課程日期");
	field_str.put("activity_date.en","Activity Date");

	field_str.put("activity_code.tw","課程代碼");
	field_str.put("activity_code.en","Activity Code");

	field_str.put("deadline.tw","報名截止日期");
	field_str.put("deadline.en","Apply Deadline");

	// 登入
	field_str.put("account.tw","帳號(E-Mail)");
	field_str.put("account.en","Account(E-Mail)");

	field_str.put("account_text.tw","請輸入您的帳號(E-mail)");
	field_str.put("account_text.en","Please enter your account(E-Mail)");

	field_str.put("password.tw","密碼");
	field_str.put("password.en","Password");

	field_str.put("password_text.tw","請輸入您的密碼");
	field_str.put("password_text.en","Please enter your password");

	field_str.put("login.tw","登入");
	field_str.put("login.en","Login");

	field_str.put("register.tw","註冊");
	field_str.put("register.en","Register");

	field_str.put("forget.tw","忘記密碼？");
	field_str.put("forget.en","Forget Password?");

	// 表單
	field_str.put("name.tw","姓名");
	field_str.put("name.en","Name");
	field_str.put("name.cn","姓名");
	
	field_str.put("phone.tw","聯絡電話");
	field_str.put("phone.en","Phone");
	field_str.put("phone.cn","连络电话");

	field_str.put("unit.tw","服務單位");
	field_str.put("unit.en","Unit");

	field_str.put("job.tw","職稱");
	field_str.put("job.en","Job");
	
	field_str.put("is_member.tw","是否為會員");
	field_str.put("is_member.en","Is Member or Not");

	field_str.put("yes.tw","是");
	field_str.put("yes.en","Yes");

	field_str.put("no.tw","否");
	field_str.put("no.en","No");

	field_str.put("payment_type.tw","繳款別");
	field_str.put("payment_type.en","Payment Type");

	field_str.put("payment_type2.tw","繳款別(請勾選)");
	field_str.put("payment_type2.en","Payment Type");

	field_str.put("course_receipt.tw","上課繳款單");
	field_str.put("course_receipt.en","Course receipt");

	field_str.put("fill_in.tw","請自填金額");
	field_str.put("fill_in.en","Please fill in the amount");

	field_str.put("collection_payment.tw","代收代付款項");
	field_str.put("collection_payment.en","Collection and payment");

	field_str.put("class_payment.tw","上課繳款單");
	field_str.put("class_payment.en","Class Payment");

	field_str.put("fill_amount.tw","請自填金額");
	field_str.put("fill_amount.en","Please fill in the amount");
	
	field_str.put("nacva_code.tw","NACVA代號");
	field_str.put("nacva_code.en","NACVA Code");
	
	field_str.put("per_year.tw","/年");
	field_str.put("per_year.en","per year");
	
	field_str.put("yuan.tw","元");
	field_str.put("yuan.en","");

	field_str.put("receipt_name.tw","收據抬頭(個人/公司)");
	field_str.put("receipt_name.en","Receipt Name");

	field_str.put("receipt_address.tw","收據郵寄地址");
	field_str.put("receipt_address.en","Receipt Address");

	field_str.put("recipient.tw","收件人");
	field_str.put("recipient.en","Recipient");

	field_str.put("same_person.tw","同聯絡人");
	field_str.put("same_person.en","Same contact person");

	field_str.put("address.tw","通訊地址");
	field_str.put("address.en","Address");

	field_str.put("is_paid.tw","是否繳款");
	field_str.put("is_paid.en","Is Paid or Not");

	field_str.put("digits.tw","匯款單據帳末五碼");
	field_str.put("digits.en","Last 5 Digits of the Remittance Receipt");

	field_str.put("code_info.tw","請注意英文字母大小寫！");
	field_str.put("code_info.en","Please pay attention to the capitalization of English letters!!");

	field_str.put("agree.tw","我已詳閱、同意接受");
	field_str.put("agree.en","I agree with");

	field_str.put("privacy.tw","《隱私權政策確認》");
	field_str.put("privacy.en","\"Privacy Policy Acknowledgment\"");

	field_str.put("submit.tw","確認送出");
	field_str.put("submit.en","Submit");
	field_str.put("submit.cn","确认送出");

	field_str.put("reset.tw","重新填寫");
	field_str.put("reset.en","Reset");
	field_str.put("reset.cn","重新填写");

	// 密碼修改
	field_str.put("new_password.tw","新密碼");
	field_str.put("new_password.en","New Password");

	field_str.put("new_password2.tw","再次輸入新密碼");
	field_str.put("new_password2.en","New Password Again");
	
	field_str.put("password_info.tw","長度大於 8 且含1個數字、1個大寫字母與1個小寫字母");
	field_str.put("password_info.en","Longer than 8 and contains 1 number, 1 uppercase letter and 1 lowercase letter");
	
	field_str.put("cellphone.tw","聯絡手機：");
	field_str.put("cellphone.en","Cellphone：");
	
	field_str.put("title.tw","主旨：");
	field_str.put("title.en","Subject：");

	//field_str.put("email.tw","Email：");
	//field_str.put("email.en","Email：");
	//field_str.put("email.cn","Email：");
	
	//field_str.put("category.tw","產品項目");
	//field_str.put("category.en","Product item");
	//field_str.put("category.cn","产品项目");
	
	field_str.put("content.tw","訊息內容：");
	field_str.put("content.en","Content：");
	field_str.put("content.cn","讯息内容：");

	field_str.put("code.tw","驗證碼");
	field_str.put("code.en","Verification Code");
	field_str.put("code.cn","验证码");
   
	//field_str.put("choose.tw","請選擇");
	//field_str.put("choose.en","Please choose");
	//field_str.put("choose.cn","请选择");
	
	field_str.put("contact.us.tw","聯絡我們通知信");
	field_str.put("contact.us.en","Contact us notification letter");
	field_str.put("contct.us.cn","联络我们通知信");

Map<String, String> alert_str = new HashMap <String, String> ();

	// 登入
	alert_str.put("account.tw","請輸入有效的帳號 !!");
	alert_str.put("account.en","Please enter a valid account !!");
	
	alert_str.put("password.tw","請輸入有效的密碼 !!");
	alert_str.put("password.en","Please enter a valid password !!");

	alert_str.put("suspended.tw","帳號已停權 !!");
	alert_str.put("suspended.en","Account was suspended !!");

	alert_str.put("login_failed.tw","帳號密碼輸入有誤，或是此帳號不存在 !!");
	alert_str.put("login_failed.en","Account input failed or does not exixts !!");

	alert_str.put("login_success.tw","登入成功 !!");
	alert_str.put("login_success.en","Login successfully !!");

	alert_str.put("login.tw","請登入會員 !!");
	alert_str.put("login.en","Please Login !!");

	// 登出
	alert_str.put("logout.tw","登出成功 !!");
	alert_str.put("logout.en","Logout successfully !!");

	alert_str.put("idle.tw","您可能閒置太久，請重新登入 !!");
	alert_str.put("idle.en","You may have been idle for too long, please log in again !!");

	// 忘記密碼
	alert_str.put("wrong_account.tw","帳號錯誤，請重新輸入 !!");
	alert_str.put("wrong_account.en","Account input error, please try again !!");

	// 修改密碼
	alert_str.put("not_valid.tw","請輸入長度至少為8個字元的密碼，並且必須包含1個數字、1個大寫字母及1個小寫字母");
	alert_str.put("not_valid.en","Please enter a password at least 8 characters long and must contain 1 number, 1 uppercase letter and 1 lowercase letter");

	alert_str.put("not_same.tw","兩次密碼不一致 !!");
	alert_str.put("not_same.en","Two passwords do not match !!");

	alert_str.put("modifypwd_success.tw","密碼修改成功 !!");
	alert_str.put("modifypwd_success.en","Modify password successfully !!");

	// 修改會員資料
	alert_str.put("modify_success.tw","會員資料修改成功 !!");
	alert_str.put("modify_success.en","Modify member data successfully !!");

	// 註冊
	alert_str.put("account_exists.tw","該會員帳號已被使用 !! 請直接進行會員登入 !!");
	alert_str.put("account_exists.en","The account has already been used !! Please log in directly !!");

	// 表單
	alert_str.put("name.tw","請輸入您的姓名 !!");
	alert_str.put("name.en","Please enter your name !!");
	alert_str.put("name.cn","请输入您的姓名 !!");

	alert_str.put("phone.tw","請輸入正確的聯絡電話 !!");
	alert_str.put("phone.en","Please enter a valid contact phone !!");
	alert_str.put("phone.cn","请输入正确的联络电话 !!");

	alert_str.put("unit.tw","請輸入服務單位 !!");
	alert_str.put("unit.en","Please enter your service unit !!");

	alert_str.put("job.tw","請輸入職稱 !!");
	alert_str.put("job.en","Please enter your Job !!");

	alert_str.put("join.tw","請選擇是否為會員 !!");
	alert_str.put("join.en","Please select whether is member or not !!");
			
	alert_str.put("nacva_code.tw","請輸入NACVA代碼 !!");
	alert_str.put("nacva_code.en","Please enter NACVA code !!");

	alert_str.put("payment_type.tw","請選擇繳款別 !!");
	alert_str.put("payment_type.en","Please select payment type !!");
			
	alert_str.put("price.tw","請輸入金額 !!");
	alert_str.put("price.en","Please enter the amount !!");

	alert_str.put("receipt_name.tw","請輸入收據抬頭 !!");
	alert_str.put("receipt_name.en","Please enter receipt name !!");

	alert_str.put("receipt_address.tw","請輸入收據地址 !!");
	alert_str.put("receipt_address.en","Please enter receipt address !!");

	alert_str.put("recipient.tw","請輸入收件人 !!");
	alert_str.put("recipient.en","Please enter recipient !!");

	alert_str.put("email.tw","請輸入有效的 E-mail !!");
	alert_str.put("email.en","Please enter valid E-Mail !!");

	alert_str.put("address.tw","請輸入通訊地址 !!");
	alert_str.put("address.en","Please enter address !!");

	alert_str.put("pay.tw","請選擇是否繳款 !!");
	alert_str.put("pay.en","Please enter whether is paid or not !!");

	alert_str.put("digits.tw","請輸入匯款單據帳末五碼 !!");
	alert_str.put("digits.en","Please enter last 5 digits of the remittance receipt !!");

	alert_str.put("privacy.tw","請勾選'同意《隱私權政策確認》'");
	alert_str.put("privacy.en","Please check 'I agree with \"Privacy Policy Acknowledgment\"' !!");

	alert_str.put("code.tw","請輸入驗證碼 !!");
	alert_str.put("code.en","Please enter verification code !!");
	alert_str.put("code.cn","请输入验证码 !!");

	alert_str.put("code_error.tw","您輸入的圖案文字錯誤 !!");
	alert_str.put("code_error.en","The text you entered is wrong");
	alert_str.put("code_error.cn","您输入的图案文字错误");	

	alert_str.put("send_success.tw","資料上傳成功 !!");
	alert_str.put("send_success.en","Data update successfully !!");

	alert_str.put("apply_success.tw","報名成功 !!");
	alert_str.put("apply_success.en","Apply Successfully!!");
	
	// alert_str.put("email.tw","請輸入正確的 E-Mail !!");
	// alert_str.put("email.en","Please enter the correct E-Mail !!");
	// alert_str.put("email.cn","请输入正确的 E-Mail !!");
	
	//alert_str.put("category.tw","請選擇產品項目 !!");
	//alert_str.put("category.en","Please select a product item !!");
	//alert_str.put("category.cn","请选择产品项目 !!");	

	alert_str.put("cellphone.tw","請輸入正確的手機電話 !!");
	alert_str.put("cellphone.en","Please enter a valid contact cellphone !!");
	alert_str.put("cellphone.cn","请输入正确的联络电话 !!");
	
	alert_str.put("subject.tw","請輸入主旨 !!");
	alert_str.put("subject.en","Please enter the subject !!");
	
	alert_str.put("content.tw","請輸入訊息內容 !!");
	alert_str.put("content.en","Please enter the content !!");
	alert_str.put("content.cn","请输入讯息内容 !!");	

	alert_str.put("system_error.tw","已完成您訊息的登錄，但系統發生通知信件發送失敗!!");
	alert_str.put("system_error.en","Your message has been completed login, file system failure occurrence notification letter sent!!");
	alert_str.put("system_error.cn","已完成您讯息的登录，档系统发生通知信件发送失败!!");	
	
	alert_str.put("system_bug.tw","系統發生異常，請聯絡管理者 !!");
	alert_str.put("system_bug.en","An error has occurred in the system. Please contact the administrator!!");
	alert_str.put("system_bug.cn","系统发生异常，请联络管理者 !!");	
	
	alert_str.put("contact.us.tw","您好，我們已收到您的訊息，以下為您填寫的資料，我們將會有專員儘速和您聯絡!");
	alert_str.put("contact.us.en","Hello, We've received your message. Here's the information you've filled out. We'll get someone to contact you as soon as possible.");
	alert_str.put("contact.us.cn","您好，我们已收到您的讯息，以下为您填写的资料，我们将会有专员尽速和您联络!");	
	
	alert_str.put("contact.alert.tw","此封信為系統自動寄發，請勿直接回信!!");
	alert_str.put("contact.alert.en","This message is automatically sent to the system, do not directly reply!!");
	alert_str.put("contact.alert.cn","此封信为系统自动寄发，请勿直接回信!!");	
	
	alert_str.put("contact.prompt.tw","感謝您的來信");
	alert_str.put("contact.prompt.en","Thank you for your letter");
	alert_str.put("contact.prompt.cn","感谢您的来信");	
	
	alert_str.put("set_password.tw","您是第一次登入，請先設定密碼!!");
	alert_str.put("set_password.en","You are logging in for the first time, please set a password first !!");
			
	alert_str.put("send_password.tw","系統已寄出密碼通知信件 !! 請至您的信箱收取...");
	alert_str.put("send_password.en","The system has sent a password notification letter !! Please check your mailbox...");
%>
