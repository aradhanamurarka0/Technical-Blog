/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

/**
 *
 * @author Aradhana
 */
import java.sql.*;
public class connectionprovider
{
    
       private static Connection con;
       public static Connection getConnection()
       {
         if(con==null)
         {
           try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           System.out.println("hii");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","12345");
           }
       
           catch(Exception e)
           {
               System.out.println(e);
        
           }
         }
         return con;
    
}
}
