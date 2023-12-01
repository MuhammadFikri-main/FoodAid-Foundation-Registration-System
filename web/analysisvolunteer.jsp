<%-- 
    Document   : analysisvolunteer
    Created on : May 22, 2019, 11:43:29 AM
    Author     : Fikri
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.sql.Connection" %>
<%
       Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
       PreparedStatement type=null;
       PreparedStatement apa=null;
       Statement profilee=con.createStatement();
     
       String wuary="select * from volunteer";
       String typee="select count(transport)  from volunteer where transport='Yes'";
       String apo="select count(transport) from volunteer where transport='No'";
      
       type=con.prepareStatement(typee);
       apa=con.prepareStatement(apo);
     
       ResultSet rssw=type.executeQuery(typee);//single
       ResultSet kw=apa.executeQuery(apo);//married
              
       PreparedStatement foodhandlingA=null;
       PreparedStatement foodhandlingB=null;
       
       String foodhandlingyes="select count(foodhandling_exp) from volunteer where foodhandling_exp='Yes'";
       String foodhandlingno="select count(foodhandling_exp)  from volunteer where foodhandling_exp='No'";
       
       foodhandlingA=con.prepareStatement(foodhandlingyes);
       foodhandlingB=con.prepareStatement(foodhandlingno);
       
       ResultSet foodA=foodhandlingA.executeQuery(foodhandlingyes);//yes
       ResultSet foodB=foodhandlingB.executeQuery(foodhandlingno);//no
       
       PreparedStatement memberNGOA=null;
       PreparedStatement memberNGOB=null;
       
       String memberNGOyes="select count(member_of_ngo) from volunteer where member_of_ngo='Yes'";
       String memberNGOno="select count(member_of_ngo)  from volunteer where member_of_ngo='No'";
       
       memberNGOA=con.prepareStatement(memberNGOyes);
       memberNGOB=con.prepareStatement(memberNGOno);
       
       ResultSet memberA=memberNGOA.executeQuery(memberNGOyes);//yes
       ResultSet memberB=memberNGOB.executeQuery(memberNGOno);//no
       
       PreparedStatement voluntary_workA=null;
       PreparedStatement voluntary_workB=null;
       
       String voluntary_workyes="select count(voluntary_worK) from volunteer where voluntary_work='Yes'";
       String voluntary_workno="select count(voluntary_worK) from volunteer where voluntary_work='No'";

       voluntary_workA=con.prepareStatement(voluntary_workyes);
       voluntary_workB=con.prepareStatement(voluntary_workno);
       
       ResultSet voluntaryA=voluntary_workA.executeQuery(voluntary_workyes);//yes
       ResultSet voluntaryB=voluntary_workB.executeQuery(voluntary_workno);//no
       
       
%>
<html>
    <table>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Home</title>
    </head>
     <style>
            body{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
                text-transform: capitalize;
            }
            #nav{
                height: 100%;
                width: 180px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                padding-top: 20px;
            }
            #nav a{
                padding: 6px 8px 6px 16px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
            }
            #nav a:hover {
                background-color: #1E9624;
                color: #f1f1f1;
              }
            .base{
                margin-left: 180px; /* Same as the width of the sidenav */
                padding: 20px 10px;
            }
            fieldset{
                margin: 0 auto;
                display: none;
                width:80%;
                padding:20px;
                margin-top:50px;
                border: 1px solid #1E9624;
            }
            #third{
                margin: 0 auto;
                display:block;
                width:80%;
                padding:20px;
                margin-top:50px;
            }
            input[type=submit]{
                border: none;
                padding: 7px;
                background-color: #1E9624;
                color: white;
                margin-top: 13px;
                width: 20%;
            }
            h2{
                text-align: center;
                font-size: 13px;
                text-transform: uppercase;
            }
            h3{text-align: center;
                font-size: 15px;
            }
            .section{
                width: 80%;
                margin: 0 auto;
                padding: 20px;
            }
            img{
                width: 20px;
            }
            table{
                width: 100%;
                margin: 0 auto;
                border-collapse: collapse;
            }
            tr:hover {background-color: #f5f5f5;}
            td{
                height: 30px;
                border: 1px solid black; 
            }
            table td a{
                text-decoration: none;
            }
            .center{
                text-align: center;
            }
            input[type=text],input[type=password]{
                width:100%;
                margin: 0px ;
                margin-bottom: 13px; 
                height:20px;
                padding:3px;
                border:1px solid black;
                background-color: white;
            }
        </style>
    <body>
        <h1>Volunteer Information Analysis</h1>
<% 
                while(rssw.next())
           {                  
                while(kw.next())
           {           
                while(foodA.next())
           {          
                while(foodB.next())
           {
                while(memberA.next())
           {        
                while(memberB.next())
           {      
                while(voluntaryA.next())
           {        
                while(voluntaryB.next())
           {        
%>           

</table>

<script>

window.onload = function () {

var chart = new CanvasJS.Chart("chartContainerinfo", {
	animationEnabled: true,
	title:{
		text: "Volunteer Information"
	},	
	axisY: {
		
		titleFontColor: "#4F81BC",
		lineColor: "#4F81BC",
		labelFontColor: "#4F81BC",
		tickColor: "#4F81BC"
	},
	axisY2: {
	
		titleFontColor: "#C0504E",
		lineColor: "#C0504E",
		labelFontColor: "#C0504E",
		tickColor: "#C0504E"
	},	
	toolTip: {
		shared: true
	},
	legend: {
		cursor:"pointer",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "column",
		name: "Yes",
		legendText: "Yes",
		showInLegend: true, 
		dataPoints:[
			{ label: "Trasport", y: <%=rssw.getString(1)%> },
			{ label: "Food Handling", y: <%=foodA.getString(1)%> },
			{ label: "Member of NGO", y: <%=memberA.getString(1)%> },
			{ label: "Voluntary Work", y: <%=voluntaryA.getString(1)%> }
			
		]
	},
	{
		type: "column",	
		name: "No",
		legendText: "No",
		axisYType: "secondary",
		showInLegend: true,
		dataPoints:[
			{ label: "Transport", y: <%=kw.getString(1)%> },
			{ label: "Food Handling", y:<%=foodB.getString(1)%> },
			{ label: "Member of NGO", y: <%=memberB.getString(1)%>},
			{ label: "Voluntary Work", y:<%=voluntaryB.getString(1)%> }
			
		]
	}]
});
chart.render();

function toggleDataSeries(e) {
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	}
	else {
		e.dataSeries.visible = true;
	}
	charta.render();
}

}

</script>

<%
}
           }    
           }
           }
           }
           }
           }
           }       
%>

<div id="chartContainerinfo" style="height: 250px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</html>

       

       
