<%-- 
    Document   : error_page
    Created on : 29-May-2023, 8:58:10 pm
    Author     : Aradhana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sorry something went wrong...</title>
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
        <div class="container text-center  " > 
            <img class="img-fluid" src="image/system.png" alt="alt"/>
            <h3 class="display-3" style="margin-top: 10px" >Sorry..! Something went wrong.....</h3>
            <%= exception %>
            <br>
              
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3"> Home</a>
        </div>
    </body>
</html>
