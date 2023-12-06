<%-- 
    Document   : profile
    Created on : 29-May-2023, 11:29:29 pm
    Author     : Aradhana
--%>

<%@page import="com.tech.blog.entities.post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.connectionprovider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page errorPage="error_page.jsp" %>
<%
    user User = (user) session.getAttribute("currentuser");
    if (User == null) {
        response.sendRedirect("login_page.jsp");

    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 100% 0, 100% 30%, 100% 89%, 70% 100%, 28% 90%, 0 100%, 0 0);
            }

            .list-group-item.active {
                z-index: 2;
                color: #fff;
                background-color:#682e68;
                border-color: black;
            }
            .primary-background-cg{
                background-color: #682e68;
            }
            .primary-background-cg:hover{
                background-color: #682e68 !important;
            }
        </style>




    </head>
    <body>
        <!--        nav bar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Portfolio.jsp"> <span class="fa fa-graduation-cap"></span> About me <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span>  Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <%
                                PostDao pd = new PostDao(connectionprovider.getConnection());
                                ArrayList<categories> catlist = pd.getallCategoriest();
                                for (categories catgs : catlist) {
                            %>


                            <a class="dropdown-item" href="#"><%=catgs.getName()%></a>
                            <!--
                          <a class="dropdown-item" href="#">Project Implementation</a>
                          <div class="dropdown-divider">new </div>
                          <a class="dropdown-item" href="#">Data Structure</a>-->
                            <%
                                }
                            %>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-phone"> </span> Contact</a>
                    </li>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#addpostmodal" href="#"><span class="fa fa-plus"> </span> What's on your mind?</a>
                    </li>


                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a  class="nav-link" href="#!" data-toggle="modal" data-target="#profile-exampleModal"> <span class="fa fa-user-circle"></span> <%= User.getName()%> </a>
                        </li>
                        <li class="nav-item">
                            <a  class="nav-link" href="logoutServlet"> <span class="fa fa-user-plus"></span> Logout</a>
                        </li>
                    </ul>
                </form>
            </div>
        </nav>
        <!--       ebd of nav bar-->
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div style="border-radius: 24px;width: inherit ;margin-left: 20px;" class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%> <a href="#" class="alert-link"></a>
        </div>

        <%
                session.removeAttribute("msg");
            }
        %>
        <!--        main body of the page-->

        <main>
            <div class="container">

                <div class="row mt-4">
                    <!--        first col-->
                    <div class="col-md-4">
                        <!--    list of categories-->
                        <div class="list-group">
                            <button  onclick="getposts(0, this)" type="button" class=" c-link list-group-item list-group-item-action active">
                                All posts
                            </button>
                            <%
                                PostDao p = new PostDao(connectionprovider.getConnection());
                                ArrayList<categories> list1 = p.getallCategoriest();
                                for (categories cc : list1) {
                            %>
                            <button type="button" onclick="getposts(<%=cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName()%></button>

                            <%
                                }
                            %>
                        </div>
                    </div>
                    <!--        second col-->
                    <div class="col-md-8" >
                        <!--    posts-->
                        <div class="container text-center" id="loader" >
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">

                        </div>

                    </div>
                </div>
            </div>
        </main>


        <!--       end main body of the page-->

        <!--        profile model-->


        <!-- Modal -->
        <div class="modal fade" id="profile-exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center" >
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="container text-center">  
                            <img style="max-height: 150px; border-radius: 0px;" src="pics/<%=User.getProfile()%> ">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%=User.getName()%> </h5>
                            <!--              detailes-->
                            <div id="profile_detail">
                                <table class="table mt-3 ">
                            </div>
                            <tbody>
                                <tr>
                                    <th scope="row">ID:</th>
                                    <td><%=User.getId()%> </td>
                                </tr>
                                <tr>
                                    <th scope="row">Email:</th>
                                    <td><%=User.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender:</th>
                                    <td><%=User.getGender()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Status:</th>
                                    <td><%=User.getAbout()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Registered Date:</th>
                                    <td><%=User.getDateTime().toString()%></td>
                                </tr>
                            </tbody>
                            </table>  
                        </div>
                        <!--    profilr edit -->
                        <div id="profile_edit" style="display: none" >
                            <h3 class="mt-2">Please edit carefully</h3>
                            <form action="EditServlett" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID:</td>
                                        <td><%=User.getId()%> </td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><input class="form-control" type="email" name="user_email" value="<%= User.getEmail()%>" > </td>
                                    </tr>
                                    <tr>
                                        <td>Name:</td>
                                        <td><input class="form-control" type="text" name="user_name" value="<%= User.getName()%>" > </td>
                                    </tr>
                                    <tr>
                                        <td>Password:</td>
                                        <td><input class="form-control" type="text" name="user_pass" value="<%= User.getPassword()%>" > </td>
                                    </tr>
                                    <tr>
                                        <td>Gender:</td>
                                        <td><%= User.getGender().toUpperCase()%> </td>
                                    </tr>
                                    <tr>
                                        <td>Status:</td>
                                        <td> <textarea class="form-control" rows="3"  name="user_abt"><%= User.getAbout()%></textarea> </td>
                                    </tr>
                                    <tr>
                                        <td style=" padding: 19px 0px;">  New Profile:</td>
                                        <td><input class="form-control" type="file" name="user_profilr_pic" > </td>
                                    </tr>
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary" >Save </button>
                                </div>
                            </form>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="edit_profile_btn">Edit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--        end of profile model-->
    <!--post model-->
    <!-- Modal -->
    <div class="modal fade" id="addpostmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Provide post details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <!--          givind id to form to use in ajax-->
                    <form id="add-post-form" action="addpostservlet" method="post" >

                        <div class="form-group"> 
                            <select class="form-control" name="cid">
                                <option selected disabled ><---Select any category---></option>
                                <% PostDao postd = new PostDao(connectionprovider.getConnection());
                                    ArrayList<categories> list = postd.getallCategoriest();
                                    for (categories c : list) {


                                %>
                                <option value="<%= c.getCid()%>"><%=c.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group"> 
                            <input name="postTitle" required="" type="text" placeholder="enter post title" class="form-control">
                        </div>
                        <div class="form-group"> 
                            <textarea name="postContent" placeholder="enter post content" rows="7" class="form-control">enter post content </textarea> 
                        </div>

                        <div class="form-group"> 
                            <textarea name="postCode" placeholder="enter your program if(any) " rows="7" class="form-control">enter your program if(any) </textarea> 
                        </div>
                        <div class="form-group"> 
                            <label> Select your pic </label>
                            <input name="postPic" type="file" class="form-control">
                        </div>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-primary">
                                Post
                            </button>
                        </div>


                    </form>



                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <!--end of post model-->


    <!--        bootstrap javascripts --> 

    <script
        src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
                                $(document).ready(function () {
                                    let edit_status = false;
                                    $('#edit_profile_btn').click(function ()
                                    {
                                        if (edit_status == false)
                                        {
                                            //    alert("butten clicked");
                                            $('#profile_detail').hide();
                                            $('#profile_edit').show();
                                            edit_status = true;
                                            $(this).text("Back");
                                        } else
                                        {
                                            $('#profile_detail').show();
                                            $('#profile_edit').hide();
                                            edit_status = false;
                                            $(this).text("Edit");
                                        }
                                    });

                                });
    </script>

    <!--now add post js-->
    <script>////
        $(document).ready(function (e) {
            //  asyncronous request to servlet
            $("#add-post-form").on("submit", function (event) {
                //thi code gets called when form gets submitted
                event.preventDefault(); // avoid send the syncronus(normal) request to servlet
                console.log("you have clicked on submit....");
                let form = new FormData(this); //this contains all the data of the form
                //now requesting to server
                $.ajax({
                    url: "addpostservlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        if (data.trim() == 'done')
                        {

                            swal("Good job!", "posted successfully!", "success");
                        } else
                        {

                            swal("OOPS!", "Something went wrong try again!", "error");
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    },
                    processData: false,
                    contentType: false
                });
            });
        });

    </script>

    <script>


        //loading post using ajax-->

        function getposts(catid, temp) //c-link
        {

            $("#loader").show();
            $("#post-container").hide();
            $(".c-link").removeClass('active');
            $.ajax({
                url: "load_post.jsp",
                data: {cid: catid},
                success: function (data, textStatus, jqXHR) {

                    $("#loader").hide();
                    $("#post-container").show();
                    $("#post-container").html(data)
                    $(temp).addClass('active')

                },

            });
        }

        $(document).ready(function (e) {
            let getallpostRef = $('.c-link')[0]
//             window.alert("loading"); 
            getposts(0, getallpostRef);

        });
    </script>

    <script>
        function doLike(pid, uid) {
            console.log("user id :", uid, "  Post id:", pid);

        }
    </script>
    <script>
    
        
        function doLike(pid, uid) {
            console.log("user id :", uid, "  Post id:", pid);
            const d =
                    {
                        uid: uid,
                        pid: pid,
                        operation: 'Like'
                    };
            $.ajax({
                url: "LikeServlet",
                data: d,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    if (data.trim() === 'true')
                    {
                        let elem = document.getElementsByClassName(pid)[0].innerHTML;
                        elem++;
                        document.getElementsByClassName(pid)[0].innerHTML = elem;
                          let element = document.getElementById(pid);
                          element.classList.remove("btn-outline-dark");             
                          element.classList.add("primary-background-cg");
                          element.classList.add("text-white");
                          element.classList.add("btn-outline-light");
                          
                           

                    } else
                    {
                           let element = document.getElementById(pid);
                          element.classList.add("btn-outline-dark");             
                          element.classList.remove("primary-background-cg");
                          element.classList.remove("text-white");
                          element.classList.remove("btn-outline-light");
                        let elem = document.getElementsByClassName(pid)[0].innerHTML;
                        elem--;
                        document.getElementsByClassName(pid)[0].innerHTML = elem;
                    }
                },

                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("error");
                }

            })

        }
      
        </script>
           
 
</body>
</html>
