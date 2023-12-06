
package com.tech.blog.entities;

public class Comments 
{
    private int comid;
    private String comment;
    private int pid;
    private int UserId;

    public Comments( String comment, int pid, int UserId) {
        this.comment = comment;
        this.pid = pid;
        this.UserId = UserId;
    }

    public Comments() {
    }

    public Comments(String comment) {
        this.comment = comment;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getComid() {
        return comid;
    }

    public void setComid(int comid) {
        this.comid = comid;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
    
    
}
