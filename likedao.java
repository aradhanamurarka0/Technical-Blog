
package com.tech.blog.dao;

import java.sql.*;
public class likedao
{
    Connection con;

    public likedao(Connection con) {
        this.con = con;
    }
    
            
    public boolean insertLine(int pid , int uid)
    {
        // function to insert the value of pid and uid in database
        
        boolean f=false;
        try {
            String q="insert into likes(pid,uid) values(?,?)";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            pstmt.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
   }
    
    public int countLikeOnPost(int pid)
    {
        int count =0;
        String q="select count(*) from likes where pid=? ";
        try {
             PreparedStatement pstmt=con.prepareStatement(q);
             pstmt.setInt(1, pid);
           ResultSet res=  pstmt.executeQuery();
           if(res.next())
           {
               count=res.getInt("count(*)");
           }
             
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    public boolean  isAlreadyLiked(int pid, int uid)
    {
        boolean f=false;
         try {
            String q="select * from likes where pid=? AND uid=?";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
          ResultSet set=  pstmt.executeQuery();
          if(set.next()){
            f=true;
          }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
        
    }
    public boolean  dislike(int pid, int uid)
    {
        boolean f=false;
         try {
            String q="delete from likes where pid=? AND uid=?";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
        pstmt.executeUpdate();
       
            f=true;
       
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
        
    }
}
