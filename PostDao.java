
package com.tech.blog.dao;
import com.tech.blog.entities.categories;
import com.tech.blog.entities.post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao 
{
    Connection con ;

    public PostDao(Connection con) {
        this.con = con;
    }
             
    public ArrayList<categories> getallCategoriest()
            
    {
        ArrayList<categories> list = new ArrayList<>();
        try {
            String q="select * from categories";
            Statement st=con.createStatement();
            ResultSet res = st.executeQuery(q);
            while(res.next())
            {
             int cid=res.getInt("cid");
             String name=res.getString("name");
             String description=res.getString("description");
             categories c=new categories(cid,name,description);
             list.add(c);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public categories getCategorybyID(int catID)
            
    {
        categories cat_info=null;
     
        try {
            String q="select * from categories where cid=?";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setInt(1, catID);
            ResultSet res = pstmt.executeQuery();
            if(res.next())
            {
                cat_info=new categories();
            cat_info.setName(res.getString("name"));
            cat_info.setDescription(res.getString("description"));
       
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat_info;
    }
       
    
    public  boolean savepost(post p)
    {
//        post--->database
        boolean f=false;
        try {
            String q="insert into posts ( pTitle , Content , pCode , pPic , catID  , userID) values (?,?,?,?,?,?);";
            PreparedStatement pstmt =con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getContent());
            pstmt.setString(3, p.getPcode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatID());
            pstmt.setInt(6, p.getUserid());
            pstmt.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
        
    }
    //heart of the project
    public List<post> getallpost()
    {
        List<post> list = new ArrayList<>();
        //fath all the post
        try {
             PreparedStatement pstmt = con.prepareStatement("select * from posts order by pid desc");
             ResultSet res=pstmt.executeQuery();
             while(res.next())
             {
                 int pid=res.getInt("pid");
                 String pTitle=res.getString("pTitle");
                 String Content=res.getString("Content");
                 String pCode=res.getString("pCode");
                 String pPic=res.getString("pPic");
                 Timestamp Date=res.getTimestamp("pDate");
                 int catID=res.getInt("catID");
                 int userID=res.getInt("userID");
post post =new post(pid, pTitle, Content, pCode, pPic, Date, catID, userID);
list.add(post);
                 
                 
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<post> getPostByCatId(int cid)
    {
        List<post> list = new ArrayList<>( );
        //fath all the post by cid
        try {
             PreparedStatement pstmt = con.prepareStatement("select * from posts where catID=?");
             pstmt.setInt(1, cid);
             ResultSet res=pstmt.executeQuery();
             while(res.next())
             {
                 int pid=res.getInt("pid");
                 String pTitle=res.getString("pTitle");
                 String Content=res.getString("Content");
                 String pCode=res.getString("pCode");
                 String pPic=res.getString("pPic");
                 Timestamp Date=res.getTimestamp("pDate");
                
                 int userID=res.getInt("userID");
post post =new post(pid, pTitle, Content, pCode, pPic, Date, cid, userID);
list.add(post);
                 
                 
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public post getpostbyid(int postId)
    {
        post doPost=null;
             try {
              String q="Select * from posts where pid=?";
                PreparedStatement pstmt=this.con.prepareStatement(q);
                   pstmt.setInt(1, postId);
                 ResultSet res=pstmt.executeQuery();
        if(res.next())
        {      int pid=res.getInt("pid");
                 String pTitle=res.getString("pTitle");
                 String Content=res.getString("Content");
                 String pCode=res.getString("pCode");
                 String pPic=res.getString("pPic");
                 Timestamp Date=res.getTimestamp("pDate");
                 int cid=res.getInt("catID");
                 int userID=res.getInt("userID");
                  doPost =new post(pid, pTitle, Content, pCode, pPic, Date, cid, userID);
//                list.add(post);
            
        } 
             }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
             
        return doPost;
    }
    
}
