<%-- 
    Document   : analysisbeneficial
    Created on : May 22, 2019, 11:45:21 AM
    Author     : Fikri
--%>

<%-- 
    Document   : analysis2
    Created on : May 21, 2019, 8:11:48 PM
    Author     : Pieee
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
       PreparedStatement campur=null;
       PreparedStatement genderA=null;
       PreparedStatement genderB=null;
      
       String wuary="select count(gender)  from beneficiaries where gender='Male Female'";
       String gendermale="select count(gender)  from beneficiaries where gender='Male'";
       String genderfemale="select count(gender) from beneficiaries where gender='Female'";
      
       genderA=con.prepareStatement(gendermale);
       genderB=con.prepareStatement(genderfemale);
       campur=con.prepareStatement(wuary);
     
       ResultSet rst=campur.executeQuery(wuary);
       ResultSet rss=genderA.executeQuery(gendermale);//single
       ResultSet k=genderB.executeQuery(genderfemale);//married
              
       PreparedStatement specificfoodA=null;
       PreparedStatement specificfoodB=null;
       
       String specificfoodyes="select count(specific_food) from beneficiaries where specific_food='Yes'";
       String specificfoodno="select count(specific_food)  from beneficiaries where specific_food='No'";
       
       specificfoodA=con.prepareStatement(specificfoodyes);
       specificfoodB=con.prepareStatement(specificfoodno);
       
       ResultSet foodA=specificfoodA.executeQuery(specificfoodyes);//yes
       ResultSet foodB=specificfoodB.executeQuery(specificfoodno);//no
       
       PreparedStatement vehicleA=null;
       PreparedStatement vehicleB=null;
       
       String vehicleyes="select count(vehicle) from beneficiaries where vehicle='Yes'";
       String vehicleno="select count(vehicle)  from beneficiaries where vehicle='No'";
       
       vehicleA=con.prepareStatement(vehicleyes);
       vehicleB=con.prepareStatement(vehicleno);
       
       ResultSet vehicA=vehicleA.executeQuery(vehicleyes);//yes
       ResultSet vehicB=vehicleB.executeQuery(vehicleno);//no
       
       PreparedStatement kitchenA=null;
       PreparedStatement kitchenB=null;
       
       String kitchenyes="select count(kitchen) from beneficiaries where kitchen='Yes'";
       String kitchenno="select count(kitchen) from beneficiaries where kitchen='No'";

       kitchenA=con.prepareStatement(kitchenyes);
       kitchenB=con.prepareStatement(kitchenno);
       
       ResultSet kitchA=kitchenA.executeQuery(kitchenyes);//yes
       ResultSet kitchB=kitchenB.executeQuery(kitchenno);//no
       
       PreparedStatement facilitiesA=null;
       PreparedStatement facilitiesB=null;
       
       String facilitiesyes="select count(facilities) from beneficiaries where facilities='Yes'";
       String facilitiesno="select count(facilities)  from beneficiaries where facilities='No'";
       
       facilitiesA=con.prepareStatement(facilitiesyes);
       facilitiesB=con.prepareStatement(facilitiesno);
       
       ResultSet faciliA=facilitiesA.executeQuery(facilitiesyes);//yes
       ResultSet faciliB=facilitiesB.executeQuery(facilitiesno);//no
       
       PreparedStatement coldstorageA=null;
       PreparedStatement coldstorageB=null;
       
       String coldstorageyes="select count(cold_storage) from beneficiaries where cold_storage='Yes'";
       String coldstorageno="select count(cold_storage)  from beneficiaries where cold_storage='No'";
       
       coldstorageA=con.prepareStatement(coldstorageyes);
       coldstorageB=con.prepareStatement(coldstorageno);
       
       ResultSet coldA=coldstorageA.executeQuery(coldstorageyes);//yes
       ResultSet coldB=coldstorageB.executeQuery(coldstorageno);//no
       
       PreparedStatement chefA=null;
       PreparedStatement chefB=null;
       
       String chefyes="select count(chef) from beneficiaries where chef='Yes'";
       String chefno="select count(chef) from beneficiaries where chef='No'";

       chefA=con.prepareStatement(chefyes);
       chefB=con.prepareStatement(chefno);
       
       ResultSet chA=chefA.executeQuery(chefyes);//yes
       ResultSet chB=chefB.executeQuery(chefno);//no
       
       PreparedStatement purchasefoodA=null;
       PreparedStatement purchasefoodB=null;
       
       String purchasefoodyes="select count(purchase_food) from beneficiaries where purchase_food='Yes'";
       String purchasefoodno="select count(purchase_food)  from beneficiaries where purchase_food='No'";
       
       purchasefoodA=con.prepareStatement(purchasefoodyes);
       purchasefoodB=con.prepareStatement(purchasefoodno);
       
       ResultSet purchaseA=purchasefoodA.executeQuery(purchasefoodyes);//yes
       ResultSet purchaseB=purchasefoodB.executeQuery(purchasefoodno);//no
        

  
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
       
                while(rss.next())
           {                  
                while(k.next())
           { 
                 while(rst.next())
           {                  
                while(foodA.next())
           {          
                while(foodB.next())
           {
                while(vehicA.next())
           {        
                while(vehicB.next())
           {      
                while(kitchA.next())
           {        
                while(kitchB.next())
           {  
                while(faciliA.next())
           {          
                while(faciliB.next())
           {
                while(coldA.next())
           {        
                while(coldB.next())
           {      
                while(chA.next())
           {        
                while(chB.next())
           {        
                while(purchaseA.next())
           {        
                while(purchaseB.next())
           {        
              
%>           

</table>

<script>
window.onload = function () {
var chartgender = new CanvasJS.Chart("chartContainergender", {
	
	
	title:{
		text:"Gender"
	},
	axisX:{
		interval: 1
	},
	axisY2:{
		interlacedColor: "rgba(1,77,101,.2)",
		gridColor: "rgba(1,77,101,.1)",
	},
	data: [{
		type: "bar",
		name: "Gender",
		axisYType: "secondary",
		color: "#1E9624",
		dataPoints: [
			{ y: <%=rss.getString(1)%>, label: "Male" },
			{ y: <%=k.getString(1)%>, label: "Female" },
                        { y: <%=rst.getString(1)%>, label: "Both" }	
                        
		
		]
	}]
        
});
chartgender.render();

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title:{
		text: "Beneficial Information"
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
			{ label: "Food", y:<%= foodA.getString(1)%> },
			{ label: "Vehicle", y:<%= vehicA.getString(1)%> },
			{ label: "Kitchen", y: <%= kitchA.getString(1)%> },
			{ label: "Facilities", y: <%= faciliA.getString(1)%> },
			{ label: "Cold storage", y: <%= coldA.getString(1)%> },
                        { label: "Chef", y: <%= chA.getString(1)%> },
			{ label: "Purchase food", y: <%= purchaseA.getString(1)%> }
		]
	},
	{
		type: "column",	
		name: "No",
		legendText: "No",
		axisYType: "secondary",
		showInLegend: true,
		dataPoints:[
			{ label: "Food", y: <%= foodB.getString(1)%> },
			{ label: "Vehicle", y: <%= vehicB.getString(1)%>},
			{ label: "Kitchen", y: <%= kitchB.getString(1)%> },
			{ label: "Facilities", y: <%= faciliB.getString(1)%> },
			{ label: "Cold storage", y: <%= coldB.getString(1)%> },
                        { label: "Chef", y: <%= chB.getString(1)%> },
			{ label: "Purchase food", y: <%= purchaseB.getString(1)%> }
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
	chart.render();
}

}

</script>

<% }}}}}}}}}}}}}}}}} %>
<div id="chartContainergender" style="height: 370px; width: 100%;"></div>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</html>

