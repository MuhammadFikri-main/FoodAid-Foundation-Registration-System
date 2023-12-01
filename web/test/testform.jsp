<%-- 
    Document   : testform
    Created on : May 10, 2019, 9:37:49 PM
    Author     : Fikri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
<title>Multistep Registration Form- Demo Preview</title>
<meta content="noindex, nofollow" name="robots">
<!-- Including CSS File Here -->
<link href="css/style.css" rel="stylesheet" type="text/css">
<!-- Including JS File Here -->
<script src="js/multi_step_form.js" type="text/javascript"></script>
<style>
    /*@import "http://fonts.googleapis.com/css?family=Droid+Serif"; */ /* This Line is to import Google font style */
.content{
width:80%;
margin:20px auto;
border: 2px solid black;
}
.main{
float:left;
width:100%;
border: 2px solid blue;
}
#progressbar{
margin:0;
padding:0;
font-size:18px;
text-align: center;
border: 2px solid red;
}
#active1{
color:red;
}
fieldset{
display:none;
width:80%;
margin: 0 auto;
/*padding:20px;
margin-top:50px;
margin-left:85px;*/
border-radius:5px;
box-shadow:3px 3px 25px 1px gray
}
#first{
display:block;
width:80%;
/*padding:20px;
margin-top:50px;*/
border-radius:5px;
margin-left:85px;
box-shadow:3px 3px 25px 1px gray
}
table{
    margin: 0 auto;
    width: 80%;
}
input[type=text],input[type=password],select{
width:100%;
margin:10px 0;
height:40px;
padding:5px;
border:3px solid #ecb0dc;
border-radius:4px
}
textarea{
width:100%;
margin:10px 0;
height:70px;
padding:5px;
border:3px solid #ecb0dc;
border-radius:4px
}
input[type=submit],input[type=button]{
width:120px;
margin:15px 25px;
padding:5px;
height:40px;
background-color:#a0522d;
border:none;
border-radius:4px;
color:#fff;
font-family:'Droid Serif',serif
}
h2,p{
text-align:center;
font-family:'Droid Serif',serif
}
li{
margin-right:52px;
display:inline;
color:#c1c5cc;
font-family:'Droid Serif',serif
}
    </style>
</head>
<body>
        </script>
<div class="content">
<!-- Multistep Form -->
<div class="main">
    <form action="test1" method="post">
<!-- Progressbar -->
<ul id="progressbar">
<li id="active1">Create Account</li>
<li id="active2">Educational Profiles</li>
<li id="active3">Personal Details</li>
</ul>
<!-- Fieldsets -->
<fieldset id="first">
<h2 class="title">Create your account</h2>
<p class="subtitle">Step 1</p>
<table>
                <tr>
                    <td>account</td>
                </tr>
                <tr>
                    <td>Name : </td>
                    <td><input type="text" name="name" placeholder="Name" ></td>
                </tr>
                <tr>
                    <td>Email : </td>
                    <td> <input type="text" name="email" placeholder="Email"></td>
                </tr>
                <tr>
                    <td>NRIC No : </td>
                    <td> <input type="text" name="nric" placeholder="NRIC"></td>
               </tr>
               <tr>
                    <td>Contact No : </td>
                    <td> <input type="text" name="contact" placeholder="Contact No"></td>
                </tr>
                <tr>
                    <td>Profession or Working Experience : </td>
                    <td><input type="text" name="profession"  placeholder="Profession"></td>
                </tr>
                <tr>
                    <td>Username : </td>
                    <td><input type="text" name="username" placeholder="Username"></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="password" name="password" placeholder="Password"></td>
                </tr>
            </table>
<input id="next_btn1" onclick="next_step1()" type="button" value="Next">
</fieldset>
    </form>
</div>
</div>
</body>
</html>
