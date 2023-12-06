/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servelets;

import com.tech.blog.dao.userdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 *
 * @author Aradhana
 */
@MultipartConfig
@WebServlet("/EditServlett")
public class EditServlett extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlett</title>");            
            out.println("</head>");
            out.println("<body>");
           //fetching all the data edited by the user
           String useremail=request.getParameter("user_email");
           String username=request.getParameter("user_name");
           String userpass=request.getParameter("user_pass");
           String userststus=request.getParameter("user_abt");
            Part profilePic=request.getPart("user_profilr_pic");
            String ImageName=profilePic.getSubmittedFileName();
            
            //get the user from the session
            HttpSession s=request.getSession();
            user User=(user)s.getAttribute("currentuser");
            //replacing old details with new details
            User.setEmail(useremail);
            User.setName(username);
            User.setPassword(userpass);
            User.setAbout(userststus);
            String oldFile=User.getProfile();
            User.setProfile(ImageName);
            
            //updating in database
            userdao user_dao=new userdao(connectionprovider.getConnection());
            boolean ans= user_dao.updateUser(User);
            if(ans==true)
            {
                
               String path=getServletConfig().getServletContext().getRealPath("/")+"pics"+File.separator+User.getProfile();
                String oldFilePath=getServletConfig().getServletContext().getRealPath("/")+"pics"+File.separator+oldFile;
                //delete code 
                if(!oldFile.equals("default.png"))
                    
                Helper.deleteFile(oldFilePath);
                   if( Helper.saveFile(profilePic.getInputStream(),path))
                   {
                       out.println("Profile updated..");
                       Message msg =new Message("Profile details updated..","success","alert-success");
                       s.setAttribute("msg", msg);
//                response.sendRedirect("login_page.jsp");
                   }
                   else
                   {
                         out.println("Profile not updated..");
                          Message msg =new Message("Something went wrong","error","alert-danger");
                       s.setAttribute("msg", msg);
                   }
                
            }
            else
            {
                 out.println("not updated!!");
                   Message msg =new Message("Something went wrong","error","alert-danger");
                       s.setAttribute("msg", msg);
            }
             response.sendRedirect("profile.jsp");
            
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
