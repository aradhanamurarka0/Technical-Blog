
package com.tech.blog.dao;
import com.tech.blog.entities.Comments;
import java.sql.*;
import java.util.ArrayList;

public class Commentdao
{
     public static int n;
    Connection con;

    public Commentdao(Connection con) {
        this.con = con;
    }
    public boolean insertComment(Comments comment, int pid , int UserId)
    {
        boolean f=false;
        try {
            String q="insert into comments(comment , pid , UserIdFK ) values (?,?,?)";
            PreparedStatement pstmt =con.prepareStatement(q);
            pstmt.setString(1, comment.getComment());
            pstmt.setInt(2, pid);
            pstmt.setInt(3, UserId);
            pstmt.executeUpdate();
            f=true;
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }
    public ArrayList<Comments> getallComments(int postid)
    {
        ArrayList <Comments> Comment_lists=new ArrayList<>();
        try {
            String q="select * from comments where pid=?";
            PreparedStatement pstmt=con.prepareStatement(q);
             pstmt.setInt(1, postid);
           ResultSet res=  pstmt.executeQuery();
            while(res.next())
            {
                int comId=res.getInt("comid");
                String comment=res.getString("comment");
                int pid =res.getInt("pid");
                int uid =res.getInt("UserIdFK");
                Comments c=new Comments(comment,pid,uid);
                Comment_lists.add(c);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Comment_lists;
    }
    public ArrayList<Comments> getallCommentsbynoID()
    {
       
        ArrayList <Comments> Comment_lists=new ArrayList<>();
        try {
            String q="select * from comments;";
            PreparedStatement pstmt=con.prepareStatement(q);
           ResultSet res=  pstmt.executeQuery();
            while(res.next())
            {
                int comId=res.getInt("comid");
                String comment=res.getString("comment");
                int pid =res.getInt("pid");
                int uid =res.getInt("UserIdFK");
                Comments c=new Comments(comment,pid,uid);
                Comment_lists.add(c);
                n++;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Comment_lists;
    }
}
