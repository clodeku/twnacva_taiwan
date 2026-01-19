/**
 * ReceiptSheetBean.java
 * Created by com.genesis.util.BeanCreator
 *         on 2023/01/12 12:01:01
 * @author Kevin Koo
 */
package local.beans;

import com.genesis.sql.*;

import java.util.*;

/**
 * JavaBean class for database table 'receipt_sheet'.
 */
public final class ReceiptSheetBean implements java.io.Serializable {

    // Table name.
    private String _tableName = "receipt_sheet";

    // Fields variable definition.
    private String rs_id         = "";
    private String rs_no         = "";
    private String rs_status     = "";
    private String mp_id         = "";
    private String aa_id         = "";
    private String rs_name       = "";
    private String rs_title      = "";
    private String rs_address    = "";
    private String rs_type       = "";
    private String rs_price      = "";
    private String rs_pay        = "";
    private String rs_digits     = "";
    private String rs_nacva_code = "";
    private String rs_code       = "";
    private String rs_lang       = "";
    private String rs_createdate = "";
    private String rs_createuser = "";
    private String rs_modifydate = "";
    private String rs_modifyuser = "";

    // Default constructor.
    public ReceiptSheetBean() {}

    // Setters definitions
    public void setRs_id(String rs_id) {
        this.rs_id = rs_id;
    }

    public void setRs_no(String rs_no) {
        this.rs_no = rs_no;
    }

    public void setRs_status(String rs_status) {
        this.rs_status = rs_status;
    }

    public void setMp_id(String mp_id) {
        this.mp_id = mp_id;
    }

    public void setAa_id(String aa_id) {
        this.aa_id = aa_id;
    }

    public void setRs_name(String rs_name) {
        this.rs_name = rs_name;
    }

    public void setRs_title(String rs_title) {
        this.rs_title = rs_title;
    }

    public void setRs_address(String rs_address) {
        this.rs_address = rs_address;
    }

    public void setRs_type(String rs_type) {
        this.rs_type = rs_type;
    }

    public void setRs_price(String rs_price) {
        this.rs_price = rs_price;
    }

    public void setRs_pay(String rs_pay) {
        this.rs_pay = rs_pay;
    }

    public void setRs_digits(String rs_digits) {
        this.rs_digits = rs_digits;
    }

    public void setRs_nacva_code(String rs_nacva_code) {
        this.rs_nacva_code = rs_nacva_code;
    }

    public void setRs_code(String rs_code) {
        this.rs_code = rs_code;
    }

    public void setRs_lang(String rs_lang) {
        this.rs_lang = rs_lang;
    }

    public void setRs_createdate(String rs_createdate) {
        this.rs_createdate = rs_createdate;
    }

    public void setRs_createuser(String rs_createuser) {
        this.rs_createuser = rs_createuser;
    }

    public void setRs_modifydate(String rs_modifydate) {
        this.rs_modifydate = rs_modifydate;
    }

    public void setRs_modifyuser(String rs_modifyuser) {
        this.rs_modifyuser = rs_modifyuser;
    }

    // Convert the fields name, type, value into a Vector.
    public Vector beanContent() {
        Vector content = new Vector();
        // Field names.
        content.add(_fnames);
        // Field java types.
        content.add(_ftypes);
        // Field values.
        Vector vc = new Vector();
        vc.add(rs_id);
        vc.add(rs_no);
        vc.add(rs_status);
        vc.add(mp_id);
        vc.add(aa_id);
        vc.add(rs_name);
        vc.add(rs_title);
        vc.add(rs_address);
        vc.add(rs_type);
        vc.add(rs_price);
        vc.add(rs_pay);
        vc.add(rs_digits);
        vc.add(rs_nacva_code);
        vc.add(rs_code);
        vc.add(rs_lang);
        vc.add(rs_createdate);
        vc.add(rs_createuser);
        vc.add(rs_modifydate);
        vc.add(rs_modifyuser);
        content.add(vc);
        return content;
    }

    // Getters definitions
    public String getRs_id() {
        return rs_id;
    }

    public String getRs_no() {
        return rs_no;
    }

    public String getRs_status() {
        return rs_status;
    }

    public String getMp_id() {
        return mp_id;
    }

    public String getAa_id() {
        return aa_id;
    }

    public String getRs_name() {
        return rs_name;
    }

    public String getRs_title() {
        return rs_title;
    }

    public String getRs_address() {
        return rs_address;
    }

    public String getRs_type() {
        return rs_type;
    }

    public String getRs_price() {
        return rs_price;
    }

    public String getRs_pay() {
        return rs_pay;
    }

    public String getRs_digits() {
        return rs_digits;
    }

    public String getRs_nacva_code() {
        return rs_nacva_code;
    }

    public String getRs_code() {
        return rs_code;
    }

    public String getRs_lang() {
        return rs_lang;
    }

    public String getRs_createdate() {
        return rs_createdate;
    }

    public String getRs_createuser() {
        return rs_createuser;
    }

    public String getRs_modifydate() {
        return rs_modifydate;
    }

    public String getRs_modifyuser() {
        return rs_modifyuser;
    }

    // Get the table's name.
    public String tableName() {
        return _tableName;
    }

    // The field names.
    private String[] _fnames = new String[] {
        "rs_id", "rs_no", "rs_status", "mp_id", 
        "aa_id", "rs_name", "rs_title", "rs_address", 
        "rs_type", "rs_price", "rs_pay", "rs_digits", 
        "rs_nacva_code", "rs_code", "rs_lang", "rs_createdate", 
        "rs_createuser", "rs_modifydate", "rs_modifyuser" };

    // The field java types.
    private String[] _ftypes = new String[] {
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String" };
}
