<%-- 
    Document   : Register_page
    Created on : 18-May-2023, 9:17:23 pm
    Author     : Aradhana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register page</title>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <link href="css/login_css.css" rel="stylesheet" type="text/css"/>
       <style>
           .section{
               margin-bottom: 0px;
               padding-bottom: 0px;
                  background-color: whitesmoke;
           }
        
           .left{
                   background-color: whitesmoke;
                   height: 700px;
              
           }
  .gender-box{
    display: flex;
    justify-content: center;
  }
  input[type="radio"]
  {
    border: 0px;
    width: 100px;
    height: 22px;
  }
  .font-aradhana{
    font-size: 21px;
    margin-left: 30px;
  }
  .aradhana-textarea{

    border: 3px solid black;
    border-radius: 19px;
    margin-left: 20px;
    margin-top: 11px;
font-size: 13px;
    outline: none;
   padding: 20px;
    border: 2px solid gray;
    border-radius: 36px;
  }
  .aradhana-left h1, .aradhana-left p{
    text-align: center;
  }
  .aradhana-left{
   
      height: 80vh;
    padding-top: 30px;
    padding-bottom: 10px;
  }
  

input[type="submit"] {

    margin: 0px 8px 8px 8px;
}  
</style>

<style>
    @media(max-width:1398px)
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
.aradhana-textarea{

border: 3px solid black;
border-radius: 19px;
margin-left: 20px;
margin-top: 11px;
font-size: 13px;
outline: none;
padding: 20px;
border: 2px solid gray;
border-radius: 36px;
width: 330px;
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
    margin: 20px 0px 20px 20px;
    width: 300px;
    padding: 4px 32px 7px 32px;
  
}
  input[type="radio"]
  {
    border: 0px;
    width: 80px;
    height: 22px;
  }
   .font-aradhana{
    font-size: 21px;
    margin-left: 0px;
  }

input[type="submit"]{
    border-radius: 36px;
    display: block;
    margin: 20px 0px 20px 20px;
    width: 340px;
    padding: 4px 32px 7px 32px;

                         }

    </style>
    <body class="logi-page-font" >
         <%@include file="normalnavbar.jsp"%>
    <hr class="top">
    <div class="section"  >
        <div class="left" id="log">
            <div class="l1">
           
                <div class="aradhana-left"  >
                    
          <h1><span class="fa fa-user-plus fa-3x "> </span>Logdy</h1>
            <p>Sign into your account</p>
            <form id="reg-form" action="RegisterServlet" method="">
                <input class="inpstyle" type="text"  name="user_name" id="name" placeholder="Enter your name " >
                <h6 class="message">*Lorem ipsum dolor sit amet consectetur.</h6>
                <input class="inpstyle" type="email"   name="email"  id="email" placeholder="Email adress" >
                <h6 class="message">*Lorem ipsum dolor sit amet consectetur.</h6>
                <input class="inpstyle"  type="password" name="user_password" id="password" placeholder="password">
               <div class="gender-box">
                   <label class="font-aradhana" for="Male">Male :</label> <input value="Male" type="radio" name="gender"> <label for="Female" class="font-aradhana"> Female :</label><input value="Female" type="radio" name="gender" > 
               </div>
    <textarea class="aradhana-textarea"  id="" cols="55" name="about" rows="5"></textarea>
    <div class="terms">
    <label style="margin-left: 30px;" for="">Terms and Condition apply :</label> 
    <input type="checkbox" name="check" id="">
  </div>
    <div id="loader" style="display: none;" class="container text-center" >  <span class="fa fa-refresh fa-spin fa-2x" > </span>
        <h4>Please wait....</h4> </div>
       
    <input id="sub-btn" type="submit" value="Register">         
            </form>
           </div>
        </div>
        </div>
        <div class="right">
            <div id="r1">
            <button class="btn-aradhana"  onclick="signin()" id="login"><a href="#log">Login</a></button>
            <button class="btn-aradhana" id="Register">Register</button>
            <h3> We make spacticular </h3>
            <p>The Technical Blog is a website that allows the end user to read the content online posted here and can also post about wherever in their mind under a specific category. This project is developed with the help of Advanced Java technology the blog posted by a single user will be categorised under a category such as java programming etc
            </p>
               
            <a href="https://www.facebook.com/aradhana.murarka.5/"> <img src="https://icon-library.com/images/facebook-icon-png-white/facebook-icon-png-white-13.jpg" alt="" srcset=""> </a>
            <a href="https://instagram.com/aradhana_nevea_murarka?igshid=YmMyMTA2M2Y="> <img src="https://icon-library.com/images/white-instagram-icon/white-instagram-icon-9.jpg" alt="" srcset=""> </a>
            <a href="http://www.linkedin.com/in/aradhana-murarka-b9903b1b8"> <img src="https://cdn.freebiesupply.com/logos/large/2x/linkedin-icon-logo-black-and-white.png" alt="" srcset=""> </a>
            <a href="http://127.0.0.1:5500/Project.java/main.html"> <img src="https://icon-library.com/images/google-plus-icon-white-png/google-plus-icon-white-png-11.jpg" alt="" srcset=""> </a>
         </div>
        </div>
    </div>
     <script src="js/newjavascript.js" type="text/javascript"></script>
<!--        bootstrap javascripts-->
<script
  src="https://code.jquery.com/jquery-3.7.0.min.js"
  integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>   
  $(document).ready(function(){
                 console.log("loaded the function .......");    
        $('#reg-form').on('submit',function(event)
        {
                 event.preventDefault();
                 let form = new FormData(this);
                 
                 $("#sub-btn").hide();
                 $("#loader").show();
                 
                 //send krna h registerServlet pe
                 $.ajax({
                     url: "RegisterServlet",
                     type:'POST',
                     data: form,
                     success: function (data, textStatus, jqXHR) {
                         console.log(data)
                           $("#sub-btn").show();
                 $("#loader").hide();
                 if(data.trim()==='done')
                 {
                     
                
   swal("Registered susscessfully...!! we are going to redirect to Login page")
.then((value) => {
  window.location= "login_page.jsp";
});

                 }
 else
 {
      swal(data);
 }
                 },
                    error: function (jqXHR, textStatus, errorThrown)
                    {   
//                  $("#sub-btn").show();
//                 $("#loader").hide();
                           swal("opps! Something went wrong try again...")

  
                    console.log(jqXHR)
                         $("#sub-btn").show();
                 $("#loader").hide();
                 
                    } ,
                     processData: false,
                     contentType: false
                   });
             });
         });
             
  </script> 
    
    <script>
        
        let signin=()=>
        {
          location.href="login_page.jsp";  
        };

          let email=document.getElementById('email');
let msg=document.querySelector('.message');
let sign=false;

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
//        sign=false;
//         submit.disabled=true;
//        submit.style.backgroundColor="gray"
        msg.innerHTML="UpperCase letter ar`e not allowed in email"
        email.style.border="3px solid red";
       msg.style.display="block";
    }
    else if(flag2==0)
    {
//        sign=false;
//        submit.disabled=true;
//        submit.style.backgroundColor="gray"
        email.style.border="3px solid red";
        flag2=0;
        msg.style.display="block";
        msg.innerHTML="Please inclue @.com to email"
    }
    else
    {
        sign=true;
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



// ---------not empty values ---------
let name =document.getElementById("name");
let email_ =document.getElementById("email");
let password =document.getElementById("password");
let submit =document.getElementById("sub-btn");
submit.disabled=true;
submit.style.backgroundColor="gray"
function nonullname()
{    
if(name.value==""|| email_.value=="" || password.value=="")
{
    submit.disabled=true;
    submit.style.backgroundColor="gray"
}
else
{
    submit.disabled=false;
    submit.style.backgroundColor="#4545ff"
}
}

name.addEventListener("input", nonullname);
function nonullemail()
{    
if(name.value==""|| email_.value=="" || password.value=="")
{
    submit.disabled=true;
    submit.style.backgroundColor="gray"
}
else
{
   if(sign==true)
   {
    submit.disabled=false;
    submit.style.backgroundColor="#4545ff"
   }
}
}

email_.addEventListener("input", nonullemail);
function nonullpassword()
{    
if(name.value==""|| email_.value=="" || password.value=="")
{
    submit.disabled=true;
    submit.style.backgroundColor="gray"
}
else
{
    submit.disabled=false;
    submit.style.backgroundColor="#4545ff"
}
}

password.addEventListener("input",nonullpassword);
    </script>
          
        
       

    </body>
</html>
