<%@page import="com.tech.blog.entities.post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.connectionprovider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<style>
    img {
    vertical-align: middle;
    border-style: none;
    height: 200px !important ;
}
</style>
<%
    Thread.sleep(500); //to delay the process
    PostDao dao=new PostDao(connectionprovider.getConnection()); 
//dao has a function which will return list() of posts
List<post> li=dao.getallpost();
if(li.size()>0)
{
	
for(post p:li)
{
%>
          
           <div class="col-md-4 mb-2">
               <div class="card"  >
                   <img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
       <div class="card-body">
           <h5 class="card-title"><%= p.getpTitle() %></h5>
           <% String content=p.getContent();
           if(content.length()>300)
           {
        content=content.substring(0,300).concat("...");
           }
           %>
           
      <p class="card-text"><%= content %></p>
      <a href="#!" class="btn  primary-background text-white">Read More</a>
     </div>
     </div> 
    </div> 


<%
}
    
%>
<%
}else
{
    out.println("<h3 class='display-3 text-center' > no post in this category... </3>");
} %>