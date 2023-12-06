<%@page import="com.tech.blog.entities.Message"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>project</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100&display=swap" rel="stylesheet">
    <!-- <link rel="stylesheet" href="style.css"> -->
    <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" media="(max-width:1398px)" href="phone.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
       <link href="css/login_css.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
    @media(max-width:1300px)
    {
        .top{
    margin-top: 0px;
 }
 hr{
    display: none;
 }
 .section{
    flex-direction: column;
    flex-direction: column-reverse;
    justify-content: left;
 }
 .right {
    height: 10px;
    border-radius: 0px 14px 312px 0px;
    width: 345px;
}
@keyframes Right1
{
    from{
        height: 10px;
       
    }
    to{
      
        height: 518px;
    }
} 

 .right::before {
    height: 10px;
    border-radius: 0px 14px 312px 0px;
    width:345px;;
    margin-top: 0px;
   
}
@keyframes Right2
 {
    from{
        height: 10px;
        
    }
    to{
        height: 518px;
}
 }
.right div{
    margin: 80px 0px 0px 30px;
}
.btn {
    width: 82px;
    height: 29px;
    margin-bottom: 19px;
    margin-right: 6px;
}
.right p{
    font-size: 14px;
}
h3{
    font-size: 21px;
}
.l1{
    display: flex;
    flex-direction: column;
    height: 74vh;
    width: 100vw;
    justify-content: center;
    align-items: center;
    /* background-color: aqua; */
}
.inpstyle {
    border-radius: 36px;
    display: block;
    margin: 20px 0px 20px 30px;
    width: 290px;
    padding: 4px 32px 7px 32px;
  
}

input[type="submit"] {
    border-radius: 36px;
    display: block;
    margin: 20px 0px 20px 20px;
    width: 308px;
    padding: 4px 32px 7px 32px;

}

    }
    </style>
<body>
      <%@include file="normalnavbar.jsp"%>
      <body class="logi-page-font" >
    <hr class="top">
    <div class="section">

        <div class="left" id="log">
            <div class="l1 ">
                <span class="fa fa-user-plus fa-3x"> </span> <h1>Logdy</h1>
            <p>Sign into your account</p>
            <form action="LoginServlet" method="post">
                <%
                    Message m= (Message) session.getAttribute("msg");
                    if (m!=null) {
                    %>
                    <div style="border-radius: 24px;width: inherit ;margin-left: 20px;" class="alert <%= m.getCssClass() %>" role="alert">
                                 <%= m.getContent()%> <a href="#" class="alert-link"></a>
                              </div>

                    <%
                        session.removeAttribute("msg");
                         }
                    %>
                <h6 class="message">*Lorem ipsum dolor sit amet consectetur.</h6>
                <input class="inpstyle" type="email"  name="email" required id="email" placeholder="Email adress" >
                <h6 class="message">*Lorem ipsum dolor sit amet consectetur.</h6>
                <input class="inpstyle"  type="password" name="password" required  id="password" placeholder="password">
              <input type="checkbox" name="" id=""> 
              <label for="">Remember me</label>
             <a href="#">Forgot password</a>
          <input type="submit" value="Login">
            </form>
        </div>
        </div>
        <div class="right">
            <div id="r1">
            <button class="btn-aradhana fa fa-user-plus " id="login"><a href="#log"> Login</a></button>
            <button class="btn-aradhana"  id="Register">Register</button>
            <h3> We make spacticular</h3>
                  <p>The Technical Blog is a website that allows the end user to read the content online posted here and can also post about wherever in their mind under a specific category. This project is developed with the help of Advanced Java technology the blog posted by a single user will be categorised under a category such as java programming etc
            </p>
            <a href="https://www.facebook.com/aradhana.murarka.5/"> <img src="https://icon-library.com/images/facebook-icon-png-white/facebook-icon-png-white-13.jpg" alt="" srcset=""> </a>
            <a href="https://instagram.com/aradhana_nevea_murarka?igshid=YmMyMTA2M2Y="> <img src="https://icon-library.com/images/white-instagram-icon/white-instagram-icon-9.jpg" alt="" srcset=""> </a>
            <a href="http://www.linkedin.com/in/aradhana-murarka-b9903b1b8"> <img src="https://cdn.freebiesupply.com/logos/large/2x/linkedin-icon-logo-black-and-white.png" alt="" srcset=""> </a>
            <a href="http://127.0.0.1:5500/Project.java/main.html"> <img src="https://icon-library.com/images/google-plus-icon-white-png/google-plus-icon-white-png-11.jpg" alt="" srcset=""> </a>
         </div>
        </div>
    </div>
    <hr>
    <script>
        let Register =document.getElementById('Register')
        let regis_btn=()=>{
              location.href = "Register_page.jsp";
        }
        Register.addEventListener('click',regis_btn);
        let email=document.getElementById('email');
let msg=document.querySelector('.message');
console.log("hii")

let email_fun=()=>
{
    let flag2=0;
    let flag=0;
   for(let i=0;i<email.value.length;i++)
   {
    if(email.value.charAt(i)=="@")
    {
     flag2++;
    }
    if((email.value.charCodeAt(i)>=65&&email.value.charCodeAt(i)<=90))
    {
       flag++;
    }
    else if(email.value.charCodeAt(i)==32)
    {
        flag++;
        
    }
    if(flag>0)
    {
        msg.innerHTML="UpperCase letter ar`e not allowed in email"
        email.style.border="3px solid red";
       msg.style.display="block";
    }
    else if(flag2==0)
    {
        email.style.border="3px solid red";
        flag2=0;
        msg.style.display="block";
        msg.innerHTML="Please inclue @.com to email"
    }
    else
    {
        email.style.border="3px solid green";
        msg.style.display="none";
        msg.innerHTML="UpperCase letter ar`e not allowed in email"
    }
   }
}
email.addEventListener('input',email_fun)
let anime= document.getElementById('r1');
console.log(anime)
let animation=()=>
{
    anime.style.display="block";
}
setTimeout(animation,3000)
    </script>
    <script>
    
    </script>
</body>

    <script src="js/newjavascript.js" type="text/javascript"></script>
<!--        bootstrap javascripts-->
<script
  src="https://code.jquery.com/jquery-3.7.0.min.js"
  integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- <script src="/Project.java/script.js"></script> -->
</body>
</html>