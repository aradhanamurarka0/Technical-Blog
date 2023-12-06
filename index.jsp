<%-- 
    Document   : index
    Created on : 15-May-2023, 10:56:37 pm
    Author     : Aradhana
--%>

<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<%@page import= "com.tech.blog.helper.connectionprovider"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
<!--        css bootstrap-->
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <style>
           .banner-background {
            clip-path: polygon(30% 0%, 100% 0, 100% 30%, 100% 89%, 70% 100%, 28% 90%, 0 100%, 0 0);
           }
       </style>
    </head>
    <body>
        <%@include file="normalnavbar.jsp"%>
<!--        banner-->
<div class="container-fluid p-0 m-0"></div>
<div class="jumbotron primary-background text-white banner-background">
    <div class="container">
    <h3 class="display-3" > Welcome to Tech Blog </h3>
    <p>This Technical blogs to help our clients and readers find other great resources. Each post has been written by a subject matter expert who knows the topic</p>
    <p>this is the collection of the best technical blogs on the internet. Topics include programming blogs, developer blogs, software engineering blogs, and more </p>
    <button  class="btn btn-outline-light btn-lg start-button " onclick="getposts()"  ><span class="fa fa-user-plus"></span> Start! its free </button>
 <a class=" btn btn-outline-light btn-lg" href="login_page.jsp"><span class="fa fa-user-circle fa-spin"></span> Login </a>
    </div>
</div>
<!--cards-->
<!--loader-->

<div class="container text-center " id="loader-index" >
    <i class="fa fa-refresh fa-4x fa-spin"></i>
    <h3 class="mt-2">Wait for a moment...</h3> 
<!--    if the loader is required to show again will b`e shown throuhh j qyery-->
</div>

    <div class="container">
    <div class="row mb-2" id="post-collection" >
</div>
</div>


<!--        bootstrap javascripts-->

<script
  src="https://code.jquery.com/jquery-3.7.0.min.js"
  integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 

 <script>
       $("#loader-index").hide();
     function getposts()
     {
           $(".start-button").removeClass('active');
           $("#loader-index").show();
            $("#post-collection").hide();
             $.ajax({
            url: "index_loadPost.jsp",
            success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader-index").hide();
                         $("#post-collection").show();
                        $("#post-collection").html(data);
                          $(".start-button").addClass('active');
                    }
            
        });
     }
     
     
     //loading post using ajax
     
     
//     $(document).ready(function (e){
//   
//     });
 </script>
 
 

    </body>
</html>
