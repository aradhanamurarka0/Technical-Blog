<%-- 
    Document   : Portfolio
    Created on : 27-May-2023, 1:06:56 am
    Author     : Aradhana
--%>

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
      * {
        margin: 0;
        padding: 0;
      }
      html{   scroll-behavior: smooth;  }
      :root {
        --nav-font-size: 20px;
        --font-color-nav: #01a93c;
      }
      ul {
        display: flex;
      }
   #uppersection   nav {
        display: flex;
        justify-content: space-between;
        margin-inline: 100px;
        padding-top: 10px;
      }
     #uppersection  li {
        list-style-type: none;
        color: whitesmoke;
        font-size: var(--nav-font-size);
        padding: 20px;
        font-weight: bold;
       
      }
      #uppersection li a{
        font-weight: bold;
        color: whitesmoke;
        text-decoration: none;
        transition: all 0.5s;
      }
     #uppersection li a:hover {
        color: var(--font-color-nav);
        font-size: 23px;
      }
      ul img {
        height: 50px;
        width: 50px;
        padding: 0px;
        filter: invert(100%);
      }
      #uppersection {
       background-color: #682e68;
        height: 100vh;
        clip-path: polygon(0 0, 100% 0, 100% 100%, 0 72%);
      }
    #uppersection  nav button {
        padding: 10px;
        margin: 10px;
        background-color: #006b00;
        border: 2px solid black;
        color: white;
        width: 140px;
        font-weight: bold;
        font-size: var(--nav-font-size);
        transition: all 0.5s;
        height: 50px;
      }
    #uppersection  nav button:hover {
        background-color: transparent;
        border: 2px solid #006b00;
        font-size: 21px;
        color: var(--font-color-nav);
      }
      /* --------------------------section----------------------- */
      section {
        display: flex;
        justify-content: space-between;
        margin-inline: 100px;
        align-items: center;
      }
      section img {
        height: 450px;
        margin-top: 15px;
        margin-left: 150px;
      }
      section .content {
        margin-left: 300px;
        text-align: right;
        color: whitesmoke;
        margin-top: 150px;
      }
      p .first {
        color: red;
        font-size: 20px;
        display: block;
      }
      p .sec {
        color: var(--font-color-nav);
      }
      .content #p-2 {
        font-size: 20px;
      }
      #p-1 {
        font-size: 35px;
      }
      section button {
        width: 250px;
        background-color: transparent;
        border: 5px solid #006b00;
        font-size: 21px;
        padding: 10px;
        color: white;
        font-weight: bold;
        margin-top: 15px;
        transition: 0.5s;
      }
      section button:hover {
        background-color: #006b00;
        color: white;
        font-size: 23px;
      }
      .lowersection #cont {
                margin-left: 200px;
                padding: 10px;
      }
      .lowersection #cont p {
                padding: 13px;
      }
      .lowersection #cont p {
                padding: 6px;
      }
      .lowersection #cont #p1 {
                font-size: 33px;
                font-weight: bolder;
      }
      .lowersection #cont #p1 span {
                color: #006b00;
      }
      .lowersection #cont #p2  {
                font-size:24px ;
                font-weight:500;
                color: rgb(61, 59, 59);
      }
      .cards{
        display: flex;
        justify-content: space-between;
        flex-wrap:wrap;
        margin-top: 15px;
        /* height: 300px; */
         
      }
      .card-design{
        height: 100px;
        width: 490px;
        margin: 17px;
        padding: 10px;
        background-color: #fff7fa;
        box-shadow: 11px 20px 14px gray;;
        transition: 0.5s;
      }
      .card-design:hover{
        height: 120px;
        width: 530px;
      }
      .card-design p{
      font-size: 21px;
      font-weight: 600;
      }
      .card-design .inside{
      font-size: 14px;
      font-weight: 300;
      }
      .card-design img{
     float: right;
     height: 100px;
     margin-top: -50px;
      }
      #card4 img,#card5 img{
     height: 70px;
     margin-top: -30px;
      }
      #Last_section{
        display: flex;
        /* justify-content: space-between; */
       margin: 100px 100px 0px 100px ;
        background-color: #ececec;

      }
      #Last_section #profilepic {
        height: 550px;
        width: 430px;
        margin: 40px 200px 40px  170px;
        border: 3px solid black;
    border-radius: 44px;
    box-shadow: 10px 8px 14px gray;
      }
      #Last_section p span{
        display: block;
        font-size: 40px;
        font-weight: bold;
        color: #006b00;
        margin-bottom: 10px;
      }
      #Last_section p{
        width: 500px;
        font-size: 30px;
        margin-top: 30px;
      }
      #Last_section #sp_2{
       display: inline;
       font-size: 30px;
       font-weight: 500;
      }
      #Last_section #sp_3{
       margin-top: 10px;
       color: black;
       font-size: 30px;
      }
      #Last_section p img {
        height: 50px;
        width: 50px;
        border: 3px solid black;
        border-radius: 44px;
    box-shadow: 10px 8px 14px gray;
    margin-inline:10px;
    transition: 0.5s;
      }
      #Last_section p img:hover {
        height: 60px;
        width: 60px;
      }
      footer{background-color: black;
      color: white; text-align: center; }
    </style>
    <style>
      @media (max-width: 1402px) {
             #uppersection  nav button {
                 height: 30px;
             }
        nav {
          flex-direction: column;
          align-items: center;
          margin-inline: 1px;
        }
        section img {
          height: 158px;
          margin-top: 8px;

          margin-left: 0px;
        }
        section .content {
          margin-left: 0px;
          margin-top: 60px;
       
        }
        section {
          margin-inline: 2px;
        }
        li {
          padding: 6px;
         
        }
        li a{
          font-size: 10px;
        }
        li a:hover {
          font-size: 11px;
        }
        p .first {
          font-size: 6px;
        }
        #p-1 {
          font-size: 15px;
        }
        .content #p-2 {
          font-size: 7px;
        }
        section button {
          width: 170px;
          border: 2px solid #006b00;
          font-size: 10px;
          padding: 1px;
          margin-top: 4px;
        }
        ul img {
          width: 30px;
          height: 30px;
          padding-right: 5px;
        }

        nav button {
          padding: 2px;
          margin: 2px;
          background-color: #006b00;
          border: 2px solid black;
          color: white;
          width: 100px;
          font-weight: bold;
          font-size: 6px;
          transition: all 0.5s;
        }
        #uppersection {
          height: 400px;
        }
        nav button:hover {
          background-color: transparent;
          border: 2px solid #006b00;
          font-size: 10px;
          color: var(--font-color-nav);
        }
        section button:hover {
          background-color: #006b00;
          color: white;
          font-size: 10px;
          border: 2px solid black;
        }
        .cards {margin-top: 8px;}
        .card-design img {
    height: 50px;
    margin-top: -25px;
}
.lowersection #cont {
                margin-left: 0px;
                padding: 0px;
      }
      .card-design {
        height: 76px;
    width: 125px;
    margin: 8px;
    padding: 8px;
    box-shadow: 11px 20px 14px gray;
    transition: 0.5s;
}
.card-design:hover{
        height: 90px;
        width: 155px;
      }
.card-design p {
    font-size: 14px;
    font-weight: 600;
}
.lowersection #cont p {
    padding: 4px;
}
#card4 img, #card5 img {
    height: 30px;
    margin-top: -15px;
}
.card-design .inside{
      font-size: 9px;
      font-weight: 300;
      }
    
.lowersection #cont #p1 {
    font-size: 15px;
    font-weight: bolder;

}

.lowersection #cont #p2 {
    font-size: 10px;}
      
      
    
#Last_section {margin: 100px 0px 0px 0px;}
#Last_section #profilepic {
  height: 200px;
    width: 200px;
    margin: 40px 6px 0px 0px;}
    #Last_section p {
    /* width: 150px; */
    font-size: 12px;
    box-shadow: 5px 5px 8px gray;
  }
  #Last_section p span {
    font-size: 15px;
    margin-bottom: 1px
}
#Last_section #sp_2 { font-size: 12px; }

#Last_section #sp_3 {font-size: 18px}
#Last_section p img {
    height: 30px;
    width: 30px;
    margin-inline: 4px;}
    #Last_section p img:hover {
        height: 40px;
        width: 40px;
      }
      footer {
    font-size: 9px;

      }
    }
    .primary-background {
    background-color: #682e68;
    margin:0px;
}

    </style>
  </head>
  <body>
      <%@include file="normalnavbar.jsp" %> 
    <div id="uppersection">
      <nav>
        <ul>
          <img src="https://cdn.onlinewebfonts.com/svg/img_429609.png" alt="" />
          <li><a href="#topsection">Home</a></li>
          <li><a href="#lowersection">Skills</a></li>
          <li><a href="#Last_section">About me</a></li>
          <li><a href="#sp_3">Contact me</a></li>
        </ul>
        <button>Sign in</button>
      </nav>
      <section id="topsection" >
        <div class="img">
        <img src="https://cdn1.iconfinder.com/data/icons/logos-and-brands-3/512/181_Java_logo_logos-512.png" alt="">
        </div>
        <div class="content">
          <p id="p-1">
            <span class="first">full stack web learner</span> HI! I'am<span
              class="sec"
            >
              Aradhana</span
            >
          </p>
          <p id="p-2">
            I'am a CS student , very passionate about Computers, Pragramming
            langauges and all the computing world ive learned Java for 5 years
            also i' ve learned CSS,HTML JS ,PHp and Perl in 6 months, i enjoy
            learning new things.. still i would like to continue my rest of the
            journey with JAVA
          </p>
          <button>Dounload resume</button>
        </div>
      </section>
    </div>
    <div id="lowersection">
      <div class="lowersection">
        <div id="cont">
          <p id="p1"><span>Skills</span> hava a wide range of skills</p>
          <p id="p2">
            i have a wide range of skills and i am always looking forward to learn
            new things
          </p>
          <div class="cards">
            <div class="card-design" id="card1"><img src="https://cdn-icons-png.flaticon.com/512/152/152760.png" alt=""><p>JAVA</p> <p class="inside">Java is a multi-platform, object-oriented, and network-centric language that can be used as a platform in itself.</p>  </div>
            <div class="card-design" id="card2"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Javascript-shield.svg/1200px-Javascript-shield.svg.png" alt="" srcset=""><p>JAVASCRIPT</p> <p class="inside">Lorem ipsum dolor sit amet consectetur adipisicing elit. Et, odio?</p></div>
            <div class="card-design" id="card3"><img src="https://img.icons8.com/color/512/html-5--v1.png" alt="" srcset=""><p>HTML</p> <p class="inside">Lorem ipsum dolor sit amet consectetur adipisicing elit. Et, odio?</p></div>
            <div class="card-design" id="card4"><img src="https://seeklogo.com/images/C/css-3-logo-023C1A7171-seeklogo.com.png" alt="" srcset=""><p>CSS</p> <p class="inside">Lorem ipsum dolor sit amet consectetur adipisicing elit. Et, odio?</p></div>
            <div class="card-design" id="card5"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/2560px-PHP-logo.svg.png" alt="" srcset=""><p>Php</p> <p class="inside">Lorem ipsum dolor sit amet consectetur adipisicing elit. Et, odio?</p></div>
            <div class="card-design" id="card5"><img src="https://idroot.us/wp-content/uploads/2021/09/perl-logo.png" alt="" srcset=""><p>Perl</p> <p class="inside">Lorem ipsum dolor sit amet consectetur adipisicing elit. Et, odio?</p></div>
          </div>
        </div>
      </div>
    </div>
    <div id="Last_section">
      <img id="profilepic" src="https://scontent.flko7-3.fna.fbcdn.net/v/t39.30808-6/243020014_3052800758378998_8394956843961390262_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=8-G3TDzNXd8AX9R9bZm&_nc_ht=scontent.flko7-3.fna&oh=00_AfAe7FIWW_wmcex3rRoO7lVWJVFzSSAdqroh1EUeOI3u2Q&oe=647583F3" alt="">
      <p> <span>About me</span> <span id="sp_2" >Hello! My name is Aradhana Murarka</span> and I'am B.C.A 5th Semester Student I have learned Java almost 6 Years and buit several mini projects in it also I have good knowledge about Frontend langauges such as Html , CSS JavaScript and Server site langauge Php and also Shell (Bash)commands Structure and Shell Scripting i have quite good understanding about Computer Networks , Advanced Data Structutes Dinamic Programming , Backtracking , Recursion. <span id="sp_3">Contact me </span>
     <a target="_blank"  href="https://www.facebook.com/aradhana.murarka.5/"> <img src="https://cdn3.iconfinder.com/data/icons/picons-social/57/46-facebook-512.png" alt=""></a>
     <a target="_blank"  href="https://www.instagram.com/aradhana_nevea_murarka/"> <img src="https://www.freepnglogos.com/uploads/logo-ig-png/logo-ig-instagram-new-logo-vector-download-5.png" alt=""></a>
    <a target="_blank" href="https://www.linkedin.com/in/aradhana-murarka-b9903b1b8/">  <img src="https://static.vecteezy.com/system/resources/previews/018/930/587/original/linkedin-logo-linkedin-icon-transparent-free-png.png" alt=""></a>
      </p>
      </div>
      
      <footer>
        I hereby declare that the above informations provided by me are true to the best of my knowledge.
      </footer>
     <script src="js/newjavascript.js" type="text/javascript"></script>
<!--        bootstrap javascripts-->
<script
  src="https://code.jquery.com/jquery-3.7.0.min.js"
  integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
