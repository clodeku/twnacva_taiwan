<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/web/include/words.jsp" %>
<%
	// 頁面識別碼
	String page_code = "member";
	String action = StringTool.validString(request.getParameter("action"));

	/* -------------------------------- member -------------------------------- */
	
	try{
		// 登入 
		if("login".equals(action)){
			// 檢核圖形驗証碼
			/*
			String r = StringTool.validString((String) session.getAttribute("rand"));
			String ind = StringTool.validString(request.getParameter("ind"));
			if((!r.equals(ind))||("".equals(r))) {
				out.println("<script> alert('驗證碼輸入錯誤 !!'); history.back(); </script>");
				return;
			}
			*/

			// 取得帳號密碼
			String mp_account = StringTool.validString(request.getParameter("mp_account"));
			String mp_password = StringTool.validString(request.getParameter("mp_password"));
			
			// 確認帳號密碼是否正確
			TableRecord mp = app_sm.select(tblmp, "mp_account=? and mp_password=? and mp_code=?", new Object[] {mp_account, mp_password, page_code});
			
			if("".equals(mp.getString("mp_id"))){
				out.println("<script> alert('"+alert_str.get("login_failed."+lang)+"'); location='log_in.jsp?lang="+lang+"'; </script>");
				return;
			} else {
				// 停權
				if("N".equals(mp.getString("mp_status"))){
					out.println("<script> alert('"+alert_str.get("suspended."+lang)+"'); history.back(); </script>");	
					return;			
				} else { 		// 登入成功
					session.setAttribute("member", mp);
					out.println("<script> alert('"+alert_str.get("login_success."+lang)+"'); location='../../home.jsp?lang="+lang+"'; </script>");
				}
				return;
			}
		}

		// 忘記密碼 
		if("forget".equals(action)){
			String mp_account = StringTool.validString(request.getParameter("mp_account"));
			
			/*
			// 檢核圖形驗証碼
			String r = StringTool.validString((String) session.getAttribute("rand"));
			String ind = StringTool.validString(request.getParameter("ind"));
			if((!r.equals(ind))||("".equals(r))) {
				out.println("<script> alert('驗證碼輸入錯誤 !!'); history.back(); </script>");
				return;
			}
			*/	

			// 驗證帳號
			TableRecord mp = app_sm.select(tblmp, "mp_account=?",new Object[]{mp_account});	
			if("".equals(mp.getString("mp_id"))){
				out.println("<script> alert('"+alert_str.get("wrong_account."+lang)+"'); history.back();</script>");	
				return;
			}
			
			out.println("<script> location='member_sendmail.jsp?mp_id="+mp.getString("mp_id")+"&action=forget&lang="+lang+"'; </script>");	
			
			return;
		}
		
		// 修改密碼 
		if("modifypwd".equals(action)){
			if(session.getAttribute("member") == null){
				out.println("<script> alert('"+alert_str.get("login."+lang)+"'); location='log_in.jsp?lang="+lang+"'; </script>");	
				return;		
			}
			
			/*
			// 檢核圖形驗証碼
			String r = StringTool.validString((String) session.getAttribute("rand"));
			String ind = StringTool.validString(request.getParameter("ind"));
			if((!r.equals(ind))||("".equals(r))) {
				out.println("<script> alert('驗證碼輸入錯誤 !!'); history.back(); </script>");
				return;
			}
			*/	
			
			TableRecord mp = (TableRecord)session.getAttribute("member");
			String mp_password = StringTool.validString(request.getParameter("mp_password"));

			// 修改
			mp.setValue("mp_password", mp_password);
			mp.setUpdate("Web_User");
			app_sm.update(mp);
		  	session.setAttribute("member", mp);
			
			out.println("<script> alert('"+alert_str.get("modifypwd_success."+lang)+"'); location='password.jsp?lang="+lang+"'; </script>");	
			return;
		}
		
		// 登出 
		if("logout".equals(action)) {
			session.removeAttribute("member");
			out.println("<script> alert('"+alert_str.get("logout."+lang)+"'); location='../../home.jsp?lang="+lang+"'; </script>");	
			return;
		}
	

		/* -------------------------------- multipart/form-data -------------------------------- */
		
		
		// 檔案路徑與設置
		String dir = app_uploadpath+"/"+page_code+"/"+lang+"/";
		
		File f_dir = new File(dir);
		if(!f_dir.exists()) f_dir.mkdirs();
		
		DiskFileUpload fu = new DiskFileUpload();
		fu.setHeaderEncoding("UTF-8");				// 亂碼關鍵(1)
		//fu.setSizeMax(4194304); 						// 設置文件大小
		//fu.setSizeThreshold(4096); 					// 設置緩衝大小
		//fu.setRepositoryPath(dir); 					// 設置臨時目錄
		List fileItems = fu.parseRequest(request);
		Iterator i = fileItems.iterator();	
		
		
		// 加入會員
		if("add".equals(action)){
			TableRecord mp = new TableRecord(tblmp);
			TableRecord rs = new TableRecord(tblrs);	// 紀錄收據資料用
			
// 			String[] required_fields = { "mp_account", "mp_phone", "mp_unit", "mp_job", "mp_join", "rs_type",
// 										 "mp_receipt_name", "mp_receipt_address", "mp_recipient", "mp_password", "mp_address", "mp_pswd",
// 										 "rs_pay", "rs_digits"};
// 			Vector<String> required = new Vector<String> (Arrays.asList(required_fields));
			
			//---------------------檔案上傳-----------------------------------------------
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();

				// 這是用來確定是否為文件屬性
				if (fi.isFormField()) {
					String fieldName = new String(fi.getFieldName()); 		// 取得表單名
					String fieldvalue = new String(fi.getString("UTF-8")); 	// 取得值
					// System.out.println("fieldName = " + fieldName + ", fieldvalue = " + fieldvalue);		// Debug用
					
					if("ind".equals(fieldName)) {
						// 檢核圖形驗証碼
						String r = StringTool.validString((String) session.getAttribute("rand"));
						String ind = fieldvalue;
						if((!r.equals(ind))||("".equals(r))) {
							out.println("<script> alert('"+alert_str.get("code_error."+lang)+"'); history.back(); </script>");
							return;
						}					
					}
					
					if(fieldName.startsWith("mp_")) {
						if("mp_account".equals(fieldName)) {		// 確認帳號是否存在
							String chk_id = app_sm.select(tblmp, "mp_account=?", new Object[]{fieldvalue.trim()}).getString("mp_id");
							if(!"".equals(chk_id)) {
								out.println("<script> alert('"+alert_str.get("account_exists."+lang)+"'); history.back(); </script>");
								return;
							}
						}
						
						if(!fieldName.equals("mp_pswd")){
							mp.setValue(fieldName, fieldvalue.trim());
						}
					} else if(fieldName.startsWith("rs_")){		// 收據資料紀錄紀錄
						if("rs_type".equals(fieldName)){	// 款項類別
							TableRecord dm = app_sm.select(tbldm, fieldvalue.trim());
							
							if(!"".equals(dm.getString("dm_id"))){	
								rs.setValue("rs_price", Integer.parseInt(dm.getString("dm_content").replace(",","")));
							}
						}
						
						rs.setValue(fieldName, fieldvalue.trim());
					}
				// 處理文件
				} else {
					int g = fi.getName().lastIndexOf("\\");
					String fileName = fi.getName();
					String fileName_1 = "";
					if(g < 0) {
						fileName = fi.getName();							// 兼容非ie
						fileName_1 = fi.getName();
					} else {
						fileName = fi.getName().substring(g);				// 取得上傳文件名
						fileName_1 = fileName.substring(1,fileName.length());
					}
					if (fileName != null && !"".equals(fileName)) {
						String chk_str = fileName;

						fi.write(new File(dir, fileName_1));
						mp.setValue(fi.getFieldName(), fileName_1);			// 設定圖
					}
				}
			}
			
			mp.setValue("mp_status", "Y");
			mp.setValue("mp_regcode", "ok");
			mp.setValue("mp_code", page_code);
			mp.setInsert("Web_User");
			app_sm.insert(mp);

			// 收據資料紀錄：關聯會員
			rs.setValue("mp_id", mp.getString("mp_id"));
			rs.setValue("rs_title", mp.getString("mp_receipt_name"));
			rs.setValue("rs_address", mp.getString("mp_receipt_address"));
			rs.setValue("rs_name", mp.getString("mp_recipient"));
			rs.setValue("rs_code", "add");
			rs.setInsert("Web_User");
			app_sm.insert(rs);
			
			session.setAttribute("member", mp);		// 登入
			
			out.println("<script> location='member_sendmail.jsp?mp_id="+mp.getString("mp_id")+"&action=add&lang="+lang+"'; </script>");		
			return;
		}

		// 會員資料修改 
		if("modify".equals(action)){
			if(session.getAttribute("member") == null){
				out.println("<script> alert('"+alert_str.get("login."+lang)+"'); location='log_in.jsp?lang="+lang+"'; </script>");	
				return;		
			}		
			
			TableRecord mp = (TableRecord)session.getAttribute("member");
			//---------------------檔案上傳-----------------------------------------------
			while (i.hasNext()) {
				
				FileItem fi = (FileItem) i.next();

				// 這是用來確定是否為文件屬性
				if (fi.isFormField()) {
					String fieldName = new String(fi.getFieldName()); 		// 取得表單名
					String fieldvalue = new String(fi.getString("UTF-8")); 	// 取得值
					
					/*
					if("ind".equals(fieldName)) {
						// 檢核圖形驗証碼
						String r = StringTool.validString((String) session.getAttribute("rand"));
						//String ind = StringTool.validString(request.getParameter("ind"));
						String ind = fieldvalue;
						if((!r.equals(ind))||("".equals(r))) {
							out.println("<script> alert('驗證碼輸入錯誤 !!'); history.back(); </script>");
							return;
						}					
					}
					*/
					
					if(fieldName.startsWith("mp_")) {
						//System.out.println(fieldName+"-"+fieldvalue);		// field log
						mp.setValue(fieldName, fieldvalue.trim());			// 設定欄位值
					}

				// 處理文件
				} else {
					int g = fi.getName().lastIndexOf("\\");
					String fileName = fi.getName();
					String fileName_1 = "";
					if(g < 0) {
						fileName = fi.getName();							// 兼容非ie
						fileName_1 = fi.getName();
					} else {
						fileName = fi.getName().substring(g);				// 取得上傳文件名
						fileName_1 = fileName.substring(1,fileName.length());
					}
					if (fileName != null && !"".equals(fileName)) {
						String chk_str = fileName;
						
						fi.write(new File(dir, fileName_1 ));
						mp.setValue(fi.getFieldName(), fileName_1);			// 設定圖
					}
				}
			}
			
			mp.setUpdate("Web_User");
			app_sm.update(mp);	
			
			session.setAttribute("member", mp);
			
			out.println("<script> alert('"+alert_str.get("modify_success."+lang)+"');location='modify.jsp?lang="+lang+"'; </script>");		
			return;
		}

		// 常年會費
		if("tacva".equals(action)){
			if(session.getAttribute("member") == null){
				out.println("<script> alert('"+alert_str.get("login."+lang)+"'); location='log_in.jsp?lang="+lang+"'; </script>");	
				return;		
			}

			TableRecord mp = (TableRecord)session.getAttribute("member");
			TableRecord rs = new TableRecord(tblrs);	// 紀錄收據資料用
			//---------------------檔案上傳-----------------------------------------------
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();

				// 這是用來確定是否為文件屬性
				if (fi.isFormField()) {
					String fieldName = new String(fi.getFieldName()); 		// 取得表單名
					String fieldvalue = new String(fi.getString("UTF-8")); 	// 取得值
					// System.out.println("fieldName = " + fieldName + ", fieldvalue = " + fieldvalue);		// Debug用
					
					if("ind".equals(fieldName)) {
						// 檢核圖形驗証碼
						String r = StringTool.validString((String) session.getAttribute("rand"));
						String ind = fieldvalue;
						if((!r.equals(ind))||("".equals(r))) {
							out.println("<script> alert('"+alert_str.get("code_error."+lang)+"'); history.back(); </script>");
							return;
						}					
					}
					
					if(fieldName.startsWith("rs_")){		// 收據資料紀錄紀錄
						if("rs_type".equals(fieldName)){	// 款項類別
							TableRecord dm = app_sm.select(tbldm, fieldvalue.trim());
							
							if(!"".equals(dm.getString("dm_id"))){	
								rs.setValue("rs_price", Integer.parseInt(dm.getString("dm_content").replace(",","")));
							}
						}
					
						rs.setValue(fieldName, fieldvalue.trim());
					}
				// 處理文件
				} else {
					int g = fi.getName().lastIndexOf("\\");
					String fileName = fi.getName();
					String fileName_1 = "";
					if(g < 0) {
						fileName = fi.getName();							// 兼容非ie
						fileName_1 = fi.getName();
					} else {
						fileName = fi.getName().substring(g);				// 取得上傳文件名
						fileName_1 = fileName.substring(1,fileName.length());
					}
					if (fileName != null && !"".equals(fileName)) {
						String chk_str = fileName;

						fi.write(new File(dir, fileName_1));
						mp.setValue(fi.getFieldName(), fileName_1);			// 設定圖
					}
				}
			}

			// 收據資料紀錄：關聯會員
			rs.setValue("mp_id", mp.getString("mp_id"));
			rs.setValue("rs_code", "tacva");
			rs.setInsert("Web_User");
			app_sm.insert(rs);

			out.println("<script> location='member_sendmail.jsp?mp_id="+mp.getString("mp_id")+"&rs_id="+rs.getString("rs_id")+"&action=tacva&lang="+lang+"'; </script>");
			//out.println("<script> alert('"+alert_str.get("send_success."+lang)+"'); location='../member/tacva.jsp'; </script>");	
			
			return;
		}

		// NACVA
		if("nacva".equals(action)){
			if(session.getAttribute("member") == null){
				out.println("<script> alert('"+alert_str.get("login."+lang)+"'); location='log_in.jsp?lang="+lang+"'; </script>");	
				return;		
			}
			
			TableRecord mp = (TableRecord)session.getAttribute("member");
			TableRecord rs = new TableRecord(tblrs);	// 紀錄收據資料用
			//---------------------檔案上傳-----------------------------------------------
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();

				// 這是用來確定是否為文件屬性
				if (fi.isFormField()) {
					String fieldName = new String(fi.getFieldName()); 		// 取得表單名
					String fieldvalue = new String(fi.getString("UTF-8")); 	// 取得值
					// System.out.println("fieldName = " + fieldName + ", fieldvalue = " + fieldvalue);		// Debug用
					
					if("ind".equals(fieldName)) {
						// 檢核圖形驗証碼
						String r = StringTool.validString((String) session.getAttribute("rand"));
						String ind = fieldvalue;
						if((!r.equals(ind))||("".equals(r))) {
							out.println("<script> alert('"+alert_str.get("code_error."+lang)+"'); history.back(); </script>");
							return;
						}					
					}
					
					if(fieldName.startsWith("rs_")){		// 收據資料紀錄紀錄
						if("rs_type".equals(fieldName)){	// 款項類別
							TableRecord dm = app_sm.select(tbldm, fieldvalue.trim());
							
							if(!"".equals(dm.getString("dm_id"))){	
								rs.setValue("rs_price", Integer.parseInt(dm.getString("dm_content").replace(",","")));
							}
						}
					
						rs.setValue(fieldName, fieldvalue.trim());
					}
				// 處理文件
				} else {
					int g = fi.getName().lastIndexOf("\\");
					String fileName = fi.getName();
					String fileName_1 = "";
					if(g < 0) {
						fileName = fi.getName();							// 兼容非ie
						fileName_1 = fi.getName();
					} else {
						fileName = fi.getName().substring(g);				// 取得上傳文件名
						fileName_1 = fileName.substring(1,fileName.length());
					}
					if (fileName != null && !"".equals(fileName)) {
						String chk_str = fileName;

						fi.write(new File(dir, fileName_1));
						mp.setValue(fi.getFieldName(), fileName_1);			// 設定圖
					}
				}
			}

			// 收據資料紀錄：關聯會員
			rs.setValue("mp_id", mp.getString("mp_id"));
			rs.setValue("rs_code", "nacva");
			rs.setInsert("Web_User");
			app_sm.insert(rs);
			
			out.println("<script> location='member_sendmail.jsp?mp_id="+mp.getString("mp_id")+"&rs_id="+rs.getString("rs_id")+"&action=nacva&lang="+lang+"'; </script>");
			//out.println("<script> alert('"+alert_str.get("send_success."+lang)+"'); location='../member/nacva.jsp'; </script>");		
			
			return;
		}
	} catch (Exception e) {
		System.out.println("Error info:[" + e + "]File name edit.jsp for [" + page_code + "]Time:[" + DateTimeTool.dateTimeString() + "]");
		out.println("<script> alert('"+alert_str.get("system_bug."+lang)+"'); history.back(); </script>");
	} finally {
		app_sm.close();
	}
%>