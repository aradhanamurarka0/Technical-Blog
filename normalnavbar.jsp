<%@page import="com.tech.blog.entities.categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.connectionprovider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<% boolean flag=false; %>
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
          

              <a class="dropdown-item" onclick="getCategory(<%= catgs.getCid() %>)" data-toggle="modal" data-target="#exampleModal" href="#"><%=catgs.getName()%></a>
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
      <li class="nav-item">
          <a  class="nav-link" href="login_page.jsp"> <span class="fa fa-user-circle fa-spin"></span> Login</a>
      </li>
        <li class="nav-item">
          <a  class="nav-link" href="Register_page.jsp"> <span class="fa fa-user-plus"></span> Register</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btncolor" type="submit">Search</button>
    </form>
  </div>
</nav>

<div id="Modal-container">
    
</div>
    
   
<script>
    function getCategory(cid)
    {
        $("#Modal-container").show();
         
        $.ajax({
            url: "showModal.jsp",
            data: {catId:cid},
            success: function (data, textStatus, jqXHR)
            {
                $("#Modal-container").html(data);
                    console.log(cid);   

                    
            },
            error: function (jqXHR, textStatus, errorThrown) {
                        console.log("error..");
                    }
          
        });
    }
</script>
  
  
  
 
