/**
 * ActivityInformationBean.java
 * Created by com.genesis.util.BeanCreator
 *         on 2022/12/27 16:23:39
 * @author Kevin Koo
 */
package local.beans;

import com.genesis.sql.*;

import java.util.*;

/**
 * JavaBean class for database table 'activity_information'.
 */
public final class ActivityInformationBean implements java.io.Serializable {

    // Table name.
    private String _tableName = "activity_information";

    // Fields variable definition.
    private String ai_id               = "";
    private String ai_upcategory       = "";
    private String ai_category         = "";
    private String ai_no               = "";
    private String ai_title            = "";
    private String ai_subtitle         = "";
    private String ai_status           = "";
    private String ai_note             = "";
    private String ai_image            = "";
    private String ai_video            = "";
    private int    ai_num              = 0;
    private int    ai_cost             = 0;
    private int    ai_cost_m           = 0;
    private int    ai_cost_pm          = 0;
    private int    ai_cost_mm          = 0;
    private String ai_content          = "";
    private String ai_pre_date         = "";
    private String ai_pre_date_end     = "";
    private String ai_date             = "";
    private String ai_date_end         = "";
    private String ai_emitdate         = "";
    private String ai_restdate         = "";
    private String ai_startday         = "";
    private String ai_endday           = "";
    private String ai_video_start_time = "";
    private String ai_video_end_time   = "";
    private int    ai_showseq          = 0;
    private String ai_lang             = "";
    private String ai_code             = "";
    private String ai_webtitle         = "";
    private String ai_robots           = "";
    private String ai_revisit_after    = "";
    private String ai_keywords         = "";
    private String ai_description      = "";
    private String ai_copyright        = "";
    private String ai_seo_track        = "";
    private String ai_createdate       = "";
    private String ai_createuser       = "";
    private String ai_modifydate       = "";
    private String ai_modifyuser       = "";

    // Default constructor.
    public ActivityInformationBean() {}

    // Setters definitions
    public void setAi_id(String ai_id) {
        this.ai_id = ai_id;
    }

    public void setAi_upcategory(String ai_upcategory) {
        this.ai_upcategory = ai_upcategory;
    }

    public void setAi_category(String ai_category) {
        this.ai_category = ai_category;
    }

    public void setAi_no(String ai_no) {
        this.ai_no = ai_no;
    }

    public void setAi_title(String ai_title) {
        this.ai_title = ai_title;
    }

    public void setAi_subtitle(String ai_subtitle) {
        this.ai_subtitle = ai_subtitle;
    }

    public void setAi_status(String ai_status) {
        this.ai_status = ai_status;
    }

    public void setAi_note(String ai_note) {
        this.ai_note = ai_note;
    }

    public void setAi_image(String ai_image) {
        this.ai_image = ai_image;
    }

    public void setAi_video(String ai_video) {
        this.ai_video = ai_video;
    }

    public void setAi_num(int ai_num) {
        this.ai_num = ai_num;
    }

    public void setAi_cost(int ai_cost) {
        this.ai_cost = ai_cost;
    }

    public void setAi_cost_m(int ai_cost_m) {
        this.ai_cost_m = ai_cost_m;
    }

    public void setAi_cost_pm(int ai_cost_pm) {
        this.ai_cost_pm = ai_cost_pm;
    }

    public void setAi_cost_mm(int ai_cost_mm) {
        this.ai_cost_mm = ai_cost_mm;
    }

    public void setAi_content(String ai_content) {
        this.ai_content = ai_content;
    }

    public void setAi_pre_date(String ai_pre_date) {
        this.ai_pre_date = ai_pre_date;
    }

    public void setAi_pre_date_end(String ai_pre_date_end) {
        this.ai_pre_date_end = ai_pre_date_end;
    }

    public void setAi_date(String ai_date) {
        this.ai_date = ai_date;
    }

    public void setAi_date_end(String ai_date_end) {
        this.ai_date_end = ai_date_end;
    }

    public void setAi_emitdate(String ai_emitdate) {
        this.ai_emitdate = ai_emitdate;
    }

    public void setAi_restdate(String ai_restdate) {
        this.ai_restdate = ai_restdate;
    }

    public void setAi_startday(String ai_startday) {
        this.ai_startday = ai_startday;
    }

    public void setAi_endday(String ai_endday) {
        this.ai_endday = ai_endday;
    }

    public void setAi_video_start_time(String ai_video_start_time) {
        this.ai_video_start_time = ai_video_start_time;
    }

    public void setAi_video_end_time(String ai_video_end_time) {
        this.ai_video_end_time = ai_video_end_time;
    }

    public void setAi_showseq(int ai_showseq) {
        this.ai_showseq = ai_showseq;
    }

    public void setAi_lang(String ai_lang) {
        this.ai_lang = ai_lang;
    }

    public void setAi_code(String ai_code) {
        this.ai_code = ai_code;
    }

    public void setAi_webtitle(String ai_webtitle) {
        this.ai_webtitle = ai_webtitle;
    }

    public void setAi_robots(String ai_robots) {
        this.ai_robots = ai_robots;
    }

    public void setAi_revisit_after(String ai_revisit_after) {
        this.ai_revisit_after = ai_revisit_after;
    }

    public void setAi_keywords(String ai_keywords) {
        this.ai_keywords = ai_keywords;
    }

    public void setAi_description(String ai_description) {
        this.ai_description = ai_description;
    }

    public void setAi_copyright(String ai_copyright) {
        this.ai_copyright = ai_copyright;
    }

    public void setAi_seo_track(String ai_seo_track) {
        this.ai_seo_track = ai_seo_track;
    }

    public void setAi_createdate(String ai_createdate) {
        this.ai_createdate = ai_createdate;
    }

    public void setAi_createuser(String ai_createuser) {
        this.ai_createuser = ai_createuser;
    }

    public void setAi_modifydate(String ai_modifydate) {
        this.ai_modifydate = ai_modifydate;
    }

    public void setAi_modifyuser(String ai_modifyuser) {
        this.ai_modifyuser = ai_modifyuser;
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
        vc.add(ai_id);
        vc.add(ai_upcategory);
        vc.add(ai_category);
        vc.add(ai_no);
        vc.add(ai_title);
        vc.add(ai_subtitle);
        vc.add(ai_status);
        vc.add(ai_note);
        vc.add(ai_image);
        vc.add(ai_video);
        vc.add(new Integer(ai_num));
        vc.add(new Integer(ai_cost));
        vc.add(new Integer(ai_cost_m));
        vc.add(new Integer(ai_cost_pm));
        vc.add(new Integer(ai_cost_mm));
        vc.add(ai_content);
        vc.add(ai_pre_date);
        vc.add(ai_pre_date_end);
        vc.add(ai_date);
        vc.add(ai_date_end);
        vc.add(ai_emitdate);
        vc.add(ai_restdate);
        vc.add(ai_startday);
        vc.add(ai_endday);
        vc.add(ai_video_start_time);
        vc.add(ai_video_end_time);
        vc.add(new Integer(ai_showseq));
        vc.add(ai_lang);
        vc.add(ai_code);
        vc.add(ai_webtitle);
        vc.add(ai_robots);
        vc.add(ai_revisit_after);
        vc.add(ai_keywords);
        vc.add(ai_description);
        vc.add(ai_copyright);
        vc.add(ai_seo_track);
        vc.add(ai_createdate);
        vc.add(ai_createuser);
        vc.add(ai_modifydate);
        vc.add(ai_modifyuser);
        content.add(vc);
        return content;
    }

    // Getters definitions
    public String getAi_id() {
        return ai_id;
    }

    public String getAi_upcategory() {
        return ai_upcategory;
    }

    public String getAi_category() {
        return ai_category;
    }

    public String getAi_no() {
        return ai_no;
    }

    public String getAi_title() {
        return ai_title;
    }

    public String getAi_subtitle() {
        return ai_subtitle;
    }

    public String getAi_status() {
        return ai_status;
    }

    public String getAi_note() {
        return ai_note;
    }

    public String getAi_image() {
        return ai_image;
    }

    public String getAi_video() {
        return ai_video;
    }

    public int getAi_num() {
        return ai_num;
    }

    public int getAi_cost() {
        return ai_cost;
    }

    public int getAi_cost_m() {
        return ai_cost_m;
    }

    public int getAi_cost_pm() {
        return ai_cost_pm;
    }

    public int getAi_cost_mm() {
        return ai_cost_mm;
    }

    public String getAi_content() {
        return ai_content;
    }

    public String getAi_pre_date() {
        return ai_pre_date;
    }

    public String getAi_pre_date_end() {
        return ai_pre_date_end;
    }

    public String getAi_date() {
        return ai_date;
    }

    public String getAi_date_end() {
        return ai_date_end;
    }

    public String getAi_emitdate() {
        return ai_emitdate;
    }

    public String getAi_restdate() {
        return ai_restdate;
    }

    public String getAi_startday() {
        return ai_startday;
    }

    public String getAi_endday() {
        return ai_endday;
    }

    public String getAi_video_start_time() {
        return ai_video_start_time;
    }

    public String getAi_video_end_time() {
        return ai_video_end_time;
    }

    public int getAi_showseq() {
        return ai_showseq;
    }

    public String getAi_lang() {
        return ai_lang;
    }

    public String getAi_code() {
        return ai_code;
    }

    public String getAi_webtitle() {
        return ai_webtitle;
    }

    public String getAi_robots() {
        return ai_robots;
    }

    public String getAi_revisit_after() {
        return ai_revisit_after;
    }

    public String getAi_keywords() {
        return ai_keywords;
    }

    public String getAi_description() {
        return ai_description;
    }

    public String getAi_copyright() {
        return ai_copyright;
    }

    public String getAi_seo_track() {
        return ai_seo_track;
    }

    public String getAi_createdate() {
        return ai_createdate;
    }

    public String getAi_createuser() {
        return ai_createuser;
    }

    public String getAi_modifydate() {
        return ai_modifydate;
    }

    public String getAi_modifyuser() {
        return ai_modifyuser;
    }

    // Get the table's name.
    public String tableName() {
        return _tableName;
    }

    // The field names.
    private String[] _fnames = new String[] {
        "ai_id", "ai_upcategory", "ai_category", "ai_no", 
        "ai_title", "ai_subtitle", "ai_status", "ai_note", 
        "ai_image", "ai_video", "ai_num", "ai_cost", 
        "ai_cost_m", "ai_cost_pm", "ai_cost_mm", "ai_content", 
        "ai_pre_date", "ai_pre_date_end", "ai_date", "ai_date_end", 
        "ai_emitdate", "ai_restdate", "ai_startday", "ai_endday", 
        "ai_video_start_time", "ai_video_end_time", "ai_showseq", "ai_lang", 
        "ai_code", "ai_webtitle", "ai_robots", "ai_revisit_after", 
        "ai_keywords", "ai_description", "ai_copyright", "ai_seo_track", 
        "ai_createdate", "ai_createuser", "ai_modifydate", "ai_modifyuser" };

    // The field java types.
    private String[] _ftypes = new String[] {
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "int", "int", "int", "int", 
        "int", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "int", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String" };
}
