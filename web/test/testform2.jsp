<%-- 
    Document   : testform2
    Created on : May 10, 2019, 9:39:48 PM
    Author     : Fikri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="./lib/jquery-3.3.1.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>JSP Page</title>
        <style>
            /*basic reset*/
* {margin: 0; padding: 0;}

html {
	height: 100%;
        background: black;
	/*Image only BG fallback*/
	
	/*background = gradient + image pattern combo*/
	/*background: 
		linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6));*/
}
body {
	font-family: montserrat, arial, verdana;
}/*form styles*/
#msform {
	width: 400px;
	margin: 50px auto;
	text-align: center;
	position: relative;
}
#msform fieldset {
	background: white;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
	padding: 20px 30px;
	box-sizing: border-box;
	width: 80%;
	margin: 0 10%;
	
	/*stacking fieldsets above each other*/
	position: relative;
}
/*Hide all except first fieldset*/
#msform fieldset:not(:first-of-type) {
	display: none;
}
/*inputs*/
#msform input, #msform textarea {
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}
/*buttons*/
#msform .action-button {
	width: 100px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px;
}
#msform .action-button:hover, #msform .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
/*headings*/
.fs-title {
	font-size: 15px;
	text-transform: uppercase;
	color: #2C3E50;
	margin-bottom: 10px;
}
.fs-subtitle {
	font-weight: normal;
	font-size: 13px;
	color: #666;
	margin-bottom: 20px;
}
/*progressbar*/
#progressbar {
	margin-bottom: 30px;
	overflow: hidden;
	/*CSS counters to number the steps*/
	counter-reset: step;
}
#progressbar li {
	list-style-type: none;
	color: white;
	text-transform: uppercase;
	font-size: 9px;
	width: 24%;
        border: 2px solid white;
	float: left;
        position: relative;
}
#progressbar li:before {
	content: counter(step);
	counter-increment: step;
	width: 20px;
	line-height: 20px;
	display: block;
	font-size: 10px;
	color: #333;
	background: white;
	border-radius: 3px;
	margin: 0 auto 5px auto;
}
/*progressbar connectors*/
#progressbar li:after {
	content: '';
	width: 100%;
	height: 2px;
	background: white;
	position: absolute;
	left: -50%;
	top: 9px;
	z-index: -1; /*put it behind the numbers*/
}
#progressbar li:first-child:after {
	/*connector not needed before the first step*/
	content: none; 
}
/*marking active/completed steps green*/
/*The number of the step and the connector before it = green*/
#progressbar li.active:before,  #progressbar li.active:after{
	background: #27AE60;
	color: white;
}
        </style>
    </head>
    <body>
        <script>
            
//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({
        'transform': 'scale('+scale+')',
        'position': 'absolute'
      });
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".submit").click(function(){
	return false;
})

        </script>
        <!-- multistep form -->
<form id="msform">
  <!-- progressbar -->
  <ul id="progressbar">
    <li class="active">Account Setup</li>
    <li>Application Details</li>
    <li>Work Experience</li>
    <li>Submit</li>
  </ul>
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Create your account</h2>
    <h3 class="fs-subtitle">This is step 1</h3>
            <table>
                <tr>
                    <td>account</td>
                </tr>
                <tr>
                    <td>Name : </td>
                    <td><input type="text" name="name" placeholder="Name"></td>
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
                <tr>
                    <td><input type="submit" value="Submit">
                    </td><input type="button" name="next" class="next action-button" value="Next" />
                </tr>
            </table>
  </fieldset>
  <fieldset>
    <h2 class="fs-title">Application Details</h2>
    <h3 class="fs-subtitle">Your presence on the social network</h3>
            <table>
               <tr>
                    <td>Have You Done Any Voluntary Work ? : </td>
                    <td>
                        <input type="radio" name="voluntary_work" value="Yes"> Yes
                        <input type="radio" name="voluntary_work" value="No">No
                    </td>
               </tr>
                <tr>
                    <td>Are you a member of any NGO ? : </td>
                    <td>
                        <input type="radio" name="member_of_ngo" value="Yes"> Yes
                        <input type="radio" name="member_of_ngo" value="No">No
                    </td>
                </tr>
       
                <tr>
                    <td>Do you have any experience in food handling ? : </td>
                    <td>
                        <input type="radio" name="foodhandling_exp" value="Yes"> Yes
                        <input type="radio" name="foodhandling_exp" value="No">No
                    </td>
                </tr>
                <tr>
                    <td>Do you have your transport ? : </td>
                    <td>
                        <input type="radio" name="transport" value="Yes"> Yes
                        <input type="radio" name="transport" value="No">No
                    </td>
                </tr>
                <tr>
                    <td>Area Of Interest : </td>
                    <td>
                        <input type="checkbox" name="interest" value="Fund Raising"> Fund Raising
                        <input type="checkbox" name="interest" value="Admin"> Admin<br>
                        <input type="checkbox" name="interest" value="Event Organising"> Event Organising
                        <input type="checkbox" name="interest" value="Communication"> Communication<br>
                        <input type="checkbox" name="interest" value="Food Raising"> Food Raising
                        <input type="checkbox" name="interest" value="Other"> Other<br>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="submit"></td>
                </tr>
            </table>
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">Work Experience</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
            <table>
                <tr>
                    <td>Name Of Company</td>
                    <td>Position held</td>
                    <td>From</td>
                    <td>To</td>
                    <td>Last Drawn Salary</td>
                    <td>Reason For Leaving</td>
                </tr>
                <tr>
                    <td><input type="text" name="company_name"></td>
                    <td><input type="text" name="position"></td>
                    <td><input type="text" name="year_from"></td>
                    <td><input type="year" name="year_to"></td>
                    <td><input type="year" name="last_salary"></td>
                    <td><input type="text" name="leave_reason"></td>
                <tr>
                <tr><td><input type="submit" value="submit"></td></tr>
            </table>
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="submit" name="submit" class="submit action-button" value="Submit" />
  </fieldset>
</form>
    </body>
</html>
