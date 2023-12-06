<%@page import="org.apache.catalina.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Comments"%>
<%@page import="com.tech.blog.dao.Commentdao"%>
<%@page import="com.tech.blog.dao.userdao"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page import="com.tech.blog.dao.likedao"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.connectionprovider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<!--this is load post page-->
<% user CU=(user)session.getAttribute("currentuser"); %>

<style>
    .btn-outline-dark {
    color: #682e68;
    background-color: transparent;
    background-image: none;
    border-color: #682e68;
}
    .btn-outline-dark:hover {
  
    background-color: #682e68 !important;
     border-color: #682e68 !important;
  
}
    .btn-outline-dark:active {
  
    background-color: #682e68 !important ;
     border-color: #682e68 !important;
  
}


</style>
 
<div class="row" >
    <%
        Thread.sleep(500);// to delay the process to make website look mote attractive
        PostDao dddd = new PostDao(connectionprovider.getConnection());
        int cid=Integer.parseInt(request.getParameter("cid"));
        List<post> listttt= null;
        if(cid==0)
        {
        
       listttt = dddd.getallpost();
    }
    else
    {
    listttt=dddd.getPostByCatId(cid);
    }
    
    if(listttt.size()==0)
    {
    out.println("<h3 class='display-3 text-center' > no post in this category... </3>");
    }
        for (post post3 : listttt)
{
 
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%=post3.getpPic() %>" alt="Card image cap">
            <div class="card-body">
                <b> <%=post3.getpTitle() %> </b>
                <p> <%=post3.getContent() %> </p>
             
            </div>  
                <div class="card-footer text-center">
                    <a href="show-blog-page.jsp?post_id=<%= post3.getPid() %>"class="btn btn-outline-dark btn-sm" >
                        Read more
                    </a>
                            <% likedao ldao= new likedao(connectionprovider.getConnection()); %>
                            <a href="#!" onclick="doLike(<%=post3.getPid()%>,<%=CU.getId()%>)" id="<%=post3.getPid()%>" class="btn btn-outline-dark btn-sm" >
                         <i class="fa fa-thumbs-o-up"><span class="<%= post3.getPid()%>" ><%= ldao.countLikeOnPost(post3.getPid()) %></span></i>
                    </a>
                    <a  data-toggle="modal" data-target="#exampleModal" class="btn btn-outline-dark btn-sm" >
                        <i class="fa fa-commenting-o"><span></span></i>
                    </a>
                </div>
        </div>
    </div>


    <%
 }

    %>
    <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
  
        
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
      ArrayList<Comments> CList=cd.getallCommentsbynoID();
      for(Comments c:CList)
      {
      user usr=ud.getUserByUserId(c.getUserId());
  
  %>
  <tbody>
     <tr>      
         <th style="font-weight:  300!important"  ><img style="border-radius: 50%; height: 50px ; width: 50px" src="pics/<%= usr.getProfile() %>" alt="alt"/><%= usr.getName() %>  </th>   
         
         <td><input disabled="" value="<%=c.getComment() %>" type="text" class="form-control" style="display: inline;" id="exampleInputEmail1" aria-describedby="emailHelp" ></td>
   
    </tr>
    <%}%>
   
  </tbody>
       </table>
   
  </div>
  

     
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

      </div>
       
           </div>
    </div>
  </div>
</div>
<!--               end model-->
</div>

