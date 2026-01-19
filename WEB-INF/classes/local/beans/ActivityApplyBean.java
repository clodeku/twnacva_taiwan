/**
 * ActivityApplyBean.java
 * Created by com.genesis.util.BeanCreator
 *         on 2022/12/27 17:42:41
 * @author Kevin Koo
 */
package local.beans;

import com.genesis.sql.*;

import java.util.*;

/**
 * JavaBean class for database table 'activity_apply'.
 */
public final class ActivityApplyBean implements java.io.Serializable {

    // Table name.
    private String _tableName = "activity_apply";

    // Fields variable definition.
    private String aa_id            = "";
    private String mp_id            = "";
    private String ai_id            = "";
    private String ai_title         = "";
    private String aa_key           = "";
    private String aa_no            = "";
    private String aa_record_status = "";
    private String aa_email_status  = "";
    private String aa_email_date    = "";
    private String aa_status        = "";
    private String aa_name          = "";
    private String aa_name_en       = "";
    private String aa_image         = "";
    private String aa_image_check   = "";
    private String aa_birthday_y    = "";
    private String aa_birthday_m    = "";
    private String aa_birthday_d    = "";
    private String aa_gender        = "";
    private String aa_unit          = "";
    private String aa_county        = "";
    private String aa_city          = "";
    private String aa_zipcode       = "";
    private String aa_address       = "";
    private String aa_phone         = "";
    private String aa_cellphone     = "";
    private String aa_email         = "";
    private String aa_job           = "";
    private String aa_school        = "";
    private String aa_vegan         = "";
    private String aa_identity      = "";
    private int    aa_cost          = 0;
    private String aa_paymethod     = "";
    private String aa_collect       = "";
    private String aa_memo          = "";
    private String aa_lang          = "";
    private String aa_code          = "";
    private String aa_createdate    = "";
    private String aa_createuser    = "";
    private String aa_modifydate    = "";
    private String aa_modifyuser    = "";

    // Default constructor.
    public ActivityApplyBean() {}

    // Setters definitions
    public void setAa_id(String aa_id) {
        this.aa_id = aa_id;
    }

    public void setMp_id(String mp_id) {
        this.mp_id = mp_id;
    }

    public void setAi_id(String ai_id) {
        this.ai_id = ai_id;
    }

    public void setAi_title(String ai_title) {
        this.ai_title = ai_title;
    }

    public void setAa_key(String aa_key) {
        this.aa_key = aa_key;
    }

    public void setAa_no(String aa_no) {
        this.aa_no = aa_no;
    }

    public void setAa_record_status(String aa_record_status) {
        this.aa_record_status = aa_record_status;
    }

    public void setAa_email_status(String aa_email_status) {
        this.aa_email_status = aa_email_status;
    }

    public void setAa_email_date(String aa_email_date) {
        this.aa_email_date = aa_email_date;
    }

    public void setAa_status(String aa_status) {
        this.aa_status = aa_status;
    }

    public void setAa_name(String aa_name) {
        this.aa_name = aa_name;
    }

    public void setAa_name_en(String aa_name_en) {
        this.aa_name_en = aa_name_en;
    }

    public void setAa_image(String aa_image) {
        this.aa_image = aa_image;
    }

    public void setAa_image_check(String aa_image_check) {
        this.aa_image_check = aa_image_check;
    }

    public void setAa_birthday_y(String aa_birthday_y) {
        this.aa_birthday_y = aa_birthday_y;
    }

    public void setAa_birthday_m(String aa_birthday_m) {
        this.aa_birthday_m = aa_birthday_m;
    }

    public void setAa_birthday_d(String aa_birthday_d) {
        this.aa_birthday_d = aa_birthday_d;
    }

    public void setAa_gender(String aa_gender) {
        this.aa_gender = aa_gender;
    }

    public void setAa_unit(String aa_unit) {
        this.aa_unit = aa_unit;
    }

    public void setAa_county(String aa_county) {
        this.aa_county = aa_county;
    }

    public void setAa_city(String aa_city) {
        this.aa_city = aa_city;
    }

    public void setAa_zipcode(String aa_zipcode) {
        this.aa_zipcode = aa_zipcode;
    }

    public void setAa_address(String aa_address) {
        this.aa_address = aa_address;
    }

    public void setAa_phone(String aa_phone) {
        this.aa_phone = aa_phone;
    }

    public void setAa_cellphone(String aa_cellphone) {
        this.aa_cellphone = aa_cellphone;
    }

    public void setAa_email(String aa_email) {
        this.aa_email = aa_email;
    }

    public void setAa_job(String aa_job) {
        this.aa_job = aa_job;
    }

    public void setAa_school(String aa_school) {
        this.aa_school = aa_school;
    }

    public void setAa_vegan(String aa_vegan) {
        this.aa_vegan = aa_vegan;
    }

    public void setAa_identity(String aa_identity) {
        this.aa_identity = aa_identity;
    }

    public void setAa_cost(int aa_cost) {
        this.aa_cost = aa_cost;
    }

    public void setAa_paymethod(String aa_paymethod) {
        this.aa_paymethod = aa_paymethod;
    }

    public void setAa_collect(String aa_collect) {
        this.aa_collect = aa_collect;
    }

    public void setAa_memo(String aa_memo) {
        this.aa_memo = aa_memo;
    }

    public void setAa_lang(String aa_lang) {
        this.aa_lang = aa_lang;
    }

    public void setAa_code(String aa_code) {
        this.aa_code = aa_code;
    }

    public void setAa_createdate(String aa_createdate) {
        this.aa_createdate = aa_createdate;
    }

    public void setAa_createuser(String aa_createuser) {
        this.aa_createuser = aa_createuser;
    }

    public void setAa_modifydate(String aa_modifydate) {
        this.aa_modifydate = aa_modifydate;
    }

    public void setAa_modifyuser(String aa_modifyuser) {
        this.aa_modifyuser = aa_modifyuser;
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
        vc.add(aa_id);
        vc.add(mp_id);
        vc.add(ai_id);
        vc.add(ai_title);
        vc.add(aa_key);
        vc.add(aa_no);
        vc.add(aa_record_status);
        vc.add(aa_email_status);
        vc.add(aa_email_date);
        vc.add(aa_status);
        vc.add(aa_name);
        vc.add(aa_name_en);
        vc.add(aa_image);
        vc.add(aa_image_check);
        vc.add(aa_birthday_y);
        vc.add(aa_birthday_m);
        vc.add(aa_birthday_d);
        vc.add(aa_gender);
        vc.add(aa_unit);
        vc.add(aa_county);
        vc.add(aa_city);
        vc.add(aa_zipcode);
        vc.add(aa_address);
        vc.add(aa_phone);
        vc.add(aa_cellphone);
        vc.add(aa_email);
        vc.add(aa_job);
        vc.add(aa_school);
        vc.add(aa_vegan);
        vc.add(aa_identity);
        vc.add(new Integer(aa_cost));
        vc.add(aa_paymethod);
        vc.add(aa_collect);
        vc.add(aa_memo);
        vc.add(aa_lang);
        vc.add(aa_code);
        vc.add(aa_createdate);
        vc.add(aa_createuser);
        vc.add(aa_modifydate);
        vc.add(aa_modifyuser);
        content.add(vc);
        return content;
    }

    // Getters definitions
    public String getAa_id() {
        return aa_id;
    }

    public String getMp_id() {
        return mp_id;
    }

    public String getAi_id() {
        return ai_id;
    }

    public String getAi_title() {
        return ai_title;
    }

    public String getAa_key() {
        return aa_key;
    }

    public String getAa_no() {
        return aa_no;
    }

    public String getAa_record_status() {
        return aa_record_status;
    }

    public String getAa_email_status() {
        return aa_email_status;
    }

    public String getAa_email_date() {
        return aa_email_date;
    }

    public String getAa_status() {
        return aa_status;
    }

    public String getAa_name() {
        return aa_name;
    }

    public String getAa_name_en() {
        return aa_name_en;
    }

    public String getAa_image() {
        return aa_image;
    }

    public String getAa_image_check() {
        return aa_image_check;
    }

    public String getAa_birthday_y() {
        return aa_birthday_y;
    }

    public String getAa_birthday_m() {
        return aa_birthday_m;
    }

    public String getAa_birthday_d() {
        return aa_birthday_d;
    }

    public String getAa_gender() {
        return aa_gender;
    }

    public String getAa_unit() {
        return aa_unit;
    }

    public String getAa_county() {
        return aa_county;
    }

    public String getAa_city() {
        return aa_city;
    }

    public String getAa_zipcode() {
        return aa_zipcode;
    }

    public String getAa_address() {
        return aa_address;
    }

    public String getAa_phone() {
        return aa_phone;
    }

    public String getAa_cellphone() {
        return aa_cellphone;
    }

    public String getAa_email() {
        return aa_email;
    }

    public String getAa_job() {
        return aa_job;
    }

    public String getAa_school() {
        return aa_school;
    }

    public String getAa_vegan() {
        return aa_vegan;
    }

    public String getAa_identity() {
        return aa_identity;
    }

    public int getAa_cost() {
        return aa_cost;
    }

    public String getAa_paymethod() {
        return aa_paymethod;
    }

    public String getAa_collect() {
        return aa_collect;
    }

    public String getAa_memo() {
        return aa_memo;
    }

    public String getAa_lang() {
        return aa_lang;
    }

    public String getAa_code() {
        return aa_code;
    }

    public String getAa_createdate() {
        return aa_createdate;
    }

    public String getAa_createuser() {
        return aa_createuser;
    }

    public String getAa_modifydate() {
        return aa_modifydate;
    }

    public String getAa_modifyuser() {
        return aa_modifyuser;
    }

    // Get the table's name.
    public String tableName() {
        return _tableName;
    }

    // The field names.
    private String[] _fnames = new String[] {
        "aa_id", "mp_id", "ai_id", "ai_title", 
        "aa_key", "aa_no", "aa_record_status", "aa_email_status", 
        "aa_email_date", "aa_status", "aa_name", "aa_name_en", 
        "aa_image", "aa_image_check", "aa_birthday_y", "aa_birthday_m", 
        "aa_birthday_d", "aa_gender", "aa_unit", "aa_county", 
        "aa_city", "aa_zipcode", "aa_address", "aa_phone", 
        "aa_cellphone", "aa_email", "aa_job", "aa_school", 
        "aa_vegan", "aa_identity", "aa_cost", "aa_paymethod", 
        "aa_collect", "aa_memo", "aa_lang", "aa_code", 
        "aa_createdate", "aa_createuser", "aa_modifydate", "aa_modifyuser" };

    // The field java types.
    private String[] _ftypes = new String[] {
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "int", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String" };
}
