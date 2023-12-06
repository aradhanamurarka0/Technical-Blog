/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.user;
import com.tech.blog.helper.connectionprovider;
/**
 *
 * @author Aradhana
 */
import java.sql.*;

public class userdao {

    private Connection con;

    public userdao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(user User) {
        boolean f = false;
        try {
//            user --> database

            String query = "insert into user (name , email , password , gender , about ) values (? , ? , ? , ?, ? );";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, User.getName());
            ps.setString(2, User.getEmail());
            ps.setString(3, User.getPassword());
            ps.setString(4, User.getGender());
            ps.setString(5, User.getAbout());
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    //get user by email and password for login page
    public user getUserbyEmailandPassword(String email, String password) {
        user User = null;
        try {
            String query = "Select * from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet set = ps.executeQuery();

            if (set.next()) {
                User = new user();
                //data from db 
                String name = set.getString("name");
                //set to obj
                User.setName(name);

                User.setId(set.getInt("id"));
                User.setEmail(set.getString("email"));
                User.setPassword(set.getString("password"));
                User.setGender(set.getString("gender"));
                User.setAbout(set.getString("about"));
                User.setDateTime(set.getTimestamp("rdate"));
                User.setProfile(set.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return User;
    }

    public boolean updateUser(user User) {
        boolean f = false;
        try {
            String q = "update user set name=? , email=? , password=? , gender=? , about=? , profile=? where id=?;";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, User.getName());
            ps.setString(2, User.getEmail());
            ps.setString(3, User.getPassword());
            ps.setString(4, User.getGender());
            ps.setString(5, User.getAbout());
            ps.setString(6, User.getProfile());
            ps.setInt(7, User.getId());
            System.out.println();
            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public user getUserByUserId(int uid) {
        user User_Posted = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, uid);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                User_Posted = new user();

                String name = set.getString("name");
                User_Posted.setName(name);

                User_Posted.setId(set.getInt("id"));
                User_Posted.setEmail(set.getString("email"));
                User_Posted.setPassword(set.getString("password"));
                User_Posted.setGender(set.getString("gender"));
                User_Posted.setAbout(set.getString("about"));
                User_Posted.setDateTime(set.getTimestamp("rdate"));
                User_Posted.setProfile(set.getString("profile"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return User_Posted;
    }

}
