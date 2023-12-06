<%@page import="com.tech.blog.entities.Comments"%>
<%@page import="com.tech.blog.dao.Commentdao"%>
<%@page import="com.tech.blog.dao.likedao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.userdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.categories"%>
<%@page import="com.tech.blog.helper.connectionprovider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page errorPage="error_page.jsp" %>
<%
    user User = (user) session.getAttribute("currentuser");
    if (User == null) {
        response.sendRedirect("login_page.jsp");

    }
%>
<%
    int post_id=Integer.parseInt(request.getParameter("post_id"));
    PostDao podao=new PostDao(connectionprovider.getConnection());
    post p =podao.getpostbyid(post_id);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= p.getpTitle() %>|| by Techblog Aradhana</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dosis:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="blogPost.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@1,700&display=swap" rel="stylesheet">

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            
    *{
margin: 0;
padding: 0;
}

.main-body-aradhana
{
    font-family: 'Dosis', sans-serif;
    width: 100vw;
/*    height: 100vh;*/
    display: flex;
    justify-content: space-between
}
.left-aradhana{
    background-color:#fcfcfc;
    width: 70vw;
    height: 100vh;
}
.right-aradhana{

    width: 30vw;
    border-left: 3px solid blue;
    border-bottom: 3px solid blue;
}
.divider-aradhana{
   
    width: 20px;
    height: inherit;
    background-color: #feeda457;
    border-right: 0.5rem  dashed purple;
}
header{
    margin-top: 50px;
    margin-left: 6rem;
    margin-right: 10rem;
}
header h1
{
    font-family: 'Ubuntu', sans-serif;
    font-weight: 900;
    font-size: 3.5rem;
    display: inline;
}
header p{
    margin-top: 1.5rem;
    font-size: 1.5rem;
    margin-bottom: 1rem;
}
.my-btn{
  padding: 10px 30px 10px 30px ;
  border-radius: 20px;
  box-shadow: 1px 1px 5px black;
margin-top: 20px;
  float: right;
    
}
.img-aradhana img {
    border: 2px solid black;
    max-height: 500px;
    max-width: 500px;
   
}
.post-aradhana{
    margin-top: 40px;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.inside-aradhana{
    padding: 30px 50px 30px 50px;
    height: 700px;
    overflow: scroll;
        background-color: #5d5d5d;
}
.right-aradhana .inside-aradhana{
text-align: center;
}
.code-aradhana{
    padding: 10px;
    text-align: left;
}
.code-aradhana {
    transition: 0.5s;
    display: none;

}
.owner-info{
    background-color: #fcfcfc;
}
.pdate{
    font-style: italic;
    font-weight: bold;
    
}
.oname{
    font-size: 20px;
}
.end-border{
      width: inherit;
    height: 20px;
    background-color: #feeda457;
    border-bottom: 0.5rem  dashed purple;
}
            .bg-light:hover{
                color: black;
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
              PostDao pd= new PostDao(connectionprovider.getConnection());
              ArrayList<categories> catlist=pd.getallCategoriest();
              for(categories catgs:catlist)
              {
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
                   
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#addpostmodal" href="#"><span class="fa fa-plus"> </span> What's on your mind?</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-user-circle"> </span> Profile page</a>
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


  

 
        
        
        
        
    <div class="main-body-aradhana">
        <div class="left-aradhana"> 
           <header>
               <h1> <%= p.getpTitle() %> </h1>

           <button onclick="code()" class="my-btn" >View Code</button>
           <p>
               <%= p.getContent() %>
           </p>
           </header>
           <div class="post-aradhana">
               <div class="img-aradhana">
                   
                    <img class="card-img-top img-fluid" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
                  <div class="card-footer text-center primary-background ">
                      <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=User.getId()%>)" id="<%=p.getPid()%>" class="btn btn-outline-light btn-sm" >
                     <% likedao ldao= new likedao(connectionprovider.getConnection());
            %>
            <i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ldao.countLikeOnPost(p.getPid()) %></span></i>
                    </a>
                    <a href="#!"class="btn btn-outline-light btn-sm"  data-toggle="modal" data-target="#exampleModal">
                        <i class="fa fa-commenting-o"><span></span></i>
                    </a>
                </div>
               </div>
           </div>
        </div>
                    <!--               model
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">Comments</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form id="com-form" action="addComments" >
                <div class="form-group">
          <img style="border-radius: 50%; height: 50px ; width: 50px" src="pics/<%=User.getProfile()%> "" alt="alt"/>
         
          <input name="uid"type="number" value="<%= User.getId() %>" style="display: none">
          <input name="pid" type="number" value="<%= p.getPid()%>"style="display: none" >
          <input name="Comment"  type="text" class="form-control" style="display: inline; width: 80%;" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
       <table class="table">
  <thead>
    <tr>
      <th scope="col">User</th>
      <th scope="col">Comments</th>
   
    </tr>
  </thead>
  <%
      userdao ud=new userdao(connectionprovider.getConnection());
      
      Commentdao cd=new Commentdao(connectionprovider.getConnection());
      ArrayList<Comments> CList=cd.getallComments(p.getPid());
      for(Comments c:CList)
      {
      user usr=ud.getUserByUserId(c.getUserId());
  
  %>
  <tbody>
  
     <tr>
        
         <th><img style="border-radius: 50%; height: 50px ; width: 50px" src="pics/<%= usr.getProfile() %>" alt="alt"/><%= usr.getName() %>  </th>   
         
         <td><input disabled="" value="<%=c.getComment() %>" type="text" class="form-control" style="display: inline;" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"></td>
   
    </tr>
    <%}%>
   
  </tbody>
       </table>
   
  </div>
  

     
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary primary-background text-white">Comment</button>
      </div>
          </form>
           </div>
    </div>
  </div>
</div>
<!--               end model-->
        <div class="divider-aradhana"></div>
        <div class="right-aradhana">
       <div class="inside-aradhana">
        <h1><--- Source code ----></h1>
        <div class="code-aradhana">
            <pre class="text-white">
<%= p.getPcode()%>
            </pre>
          
            <div class="card-footer text-center text-white ">
                 <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=User.getId()%>)" id="<%=p.getPid()%>" class="btn btn-outline-light btn-sm" >
                 
            
            <i class="fa fa-thumbs-o-up"><span class="like-counter"> <%= ldao.countLikeOnPost(p.getPid()) %></span></i>
                    </a>
                    <a href="#!"class="btn btn-outline-light btn-sm" data-toggle="modal" data-target="#exampleModal"  >
                        <i class="fa fa-commenting-o"><span></span></i>
                    </a>
                </div>
        </div>
       
       </div>
<% userdao udao=new userdao(connectionprovider.getConnection());

%>
            
            <div class="owner-info ">
                <p class="oname"> Posted by - <a href="#!"> <%=udao.getUserByUserId(p.getUserid()).getName() %> </a></p> 
                <p class="pdate" > On date - <%= DateFormat.getInstance().format(p.getpDate())  %></p> 
            </div>
                 <div class="end-border">  </div>
        </div>    
            
</div>
<script>
    function code()
    {
        let program=document.getElementsByClassName("code-aradhana")[0];
        program.style.display="block";
    }
</script>
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
                            console.log(data.trim());
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
              
        function doLike(pid,uid) {
            console.log("user id :",uid,"  Post id:" ,pid);
            const d=
                    {
                uid:uid,
                pid:pid,
                operation:'Like'
            };
            $.ajax({
                url: "LikeServlet",
                data: d,
                success: function (data, textStatus, jqXHR) {
                       if(data.trim()==='true')
                        {
                          
                            
                          let c=$(".like-counter").html();
                         c++;
                         $(".like-counter").html(c);
                         let element = document.getElementById(pid);
                         element.classList.add("btn-outline-light");             
                          element.classList.add("bg-light");
                          element.classList.add("text-dark");
                      
                        }
                            
                        else{
                            
                           let element = document.getElementById(pid);
                                   
                          element.classList.remove("bg-light");
                          element.classList.remove("text-dark");
//                          element.classList.add("text-white");
                         
                          
                          let c=$(".like-counter").html();
                         c--;
                         $(".like-counter").html(c);   
                            
                            
                            
                        }
                         
                        console.log(data);

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("error");
                    }
                
            })
        }
    </script>
    <script>
        
      $(document).ready(function() {
        
           $('#com-form').on('submit',function (event) {  
               event.preventDefault();
               let form=new FormData(this);
               $.ajax({
                  url: "addComments",
                  type: 'POST',
                  data: form,
           
                  success: function (data, textStatus, jqXHR) {
                        console.log(data);
                         if (data.trim() == 'true')
                        {

                            swal("Good job!", "Commented successfully!", "success");
                        } else
                        {
                            console.log(data);
                            swal("OOPS!", "Something went wrong try again!", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("error");
                    },
                    processData: false,
                    contentType: false
                  
               });
           });       
      
 
    
});


        
        </script>
        </script>
       
</body>
</html>
