/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servelets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.post;
import com.tech.blog.entities.user;
import com.tech.blog.helper.Helper;
import com.tech.blog.helper.connectionprovider;
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
@WebServlet("/addpostservlet")
@MultipartConfig
public class addpostservlet extends HttpServlet {

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
            int cid=Integer.parseInt(request.getParameter("cid"));
         String pTitle=request.getParameter("postTitle");
         String pContent=request.getParameter("postContent");
         String pCode=request.getParameter("postCode");
            Part pPic=request.getPart("postPic");

//         ..getting current user id
HttpSession session =request.getSession();
            user User = (user)session.getAttribute("currentuser");
            
            post p=new post(pTitle, pContent, pCode, pPic.getSubmittedFileName(), null, cid, User.getId());
            PostDao dao= new PostDao(connectionprovider.getConnection());
            if(dao.savepost(p)==true)
            {
                 String path=getServletConfig().getServletContext().getRealPath("/")+"blog_pics"+File.separator+pPic.getSubmittedFileName();
                 Helper.saveFile(pPic.getInputStream(), path);
                       out.println("done");
            }
            else
            {
                out.println("error");
            }
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
