
package com.tech.blog.entities;

import java.sql.*;

public class post 
{
    private int pid;
    private String pTitle;
    private String Content;
    private String Pcode;
    private String pPic;
    private Timestamp pDate;
    private int catID;
    private int userid;

    public post() {
    }

    public post(int pid, String pTitle, String Content, String Pcode, String pPic, Timestamp pDate, int catID , int userid) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.Content = Content;
        this.Pcode = Pcode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catID = catID;
        this.userid=userid;
    }

    public post(String pTitle, String Content, String Pcode, String pPic, Timestamp pDate, int catID,int userid) {
        this.pTitle = pTitle;
        this.Content = Content;
        this.Pcode = Pcode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catID = catID;
        this.userid=userid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public String getPcode() {
        return Pcode;
    }

    public void setPcode(String Pcode) {
        this.Pcode = Pcode;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    
    
    
}
