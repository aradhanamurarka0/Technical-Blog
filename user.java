/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author Aradhana*/

 import java.sql.*;
public class user 
{
    private int id;
  private String Name;
  private String email;
  private String password;
  private String gender;
  private String about;
  private Timestamp DateTime;
  private String profile;

    public user(int id, String Name, String email, String password, String gender, String about, Timestamp DateTime) {
        this.id = id;
        this.Name = Name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
        this.DateTime=DateTime;
        
    }

    public user() {
    }

    public user(String Name, String email, String password, String gender, String about) {
        this.Name = Name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
       
    }
//    getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Timestamp getDateTime() {
        return DateTime;
    }

    public void setDateTime(Timestamp DateTime) {
        this.DateTime = DateTime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }




  
                                
}
