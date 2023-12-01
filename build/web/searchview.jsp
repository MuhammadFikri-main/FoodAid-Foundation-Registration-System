<%@ page import="java.util.*" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
 
<html>
    <head>
        <title>Search</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
                text-transform: capitalize;
                background-color: #F5F5F5;
            }
            .section{
                width: 80%;
                margin: 50px auto;
                border: 2px solid #1E9624;
                box-shadow: 5px 10px 8px #888888;  
                background-color: #ffff;
                padding: 10px 10px;
                line-height: 2.3;
            }
            table{
                width: 100%;
                margin: 0 auto;
                border-collapse: collapse;
                background-color: #ffffff;
            }
            tr:hover {background-color: #f5f5f5;}
            td{
                padding-left: 10px;
                height: 30px;
                border: 1px solid black;
            }
            table td a{
                text-decoration: none;
            }
            h3{
                text-align: center;
            }
            img{
                width: 30px;
            }
        </style>
    </head>
    <body>
        <fieldset class="section">
            <a href="admin.jsp"><img src="asset/back.png"></a>
            <h3>Application Record</h3>
        <table>
            <tr>
                <th>Name</th>
                <th>Type</th>
                <th>Status</th>
                <th>Process</th>
            </tr>
            <%
                int count = 0;
                String color = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
            %>
            <tr>
                <td style="width:55%;"><%=pList.get(0)%></td>
                <td style="text-align:center;width: 15%;"><%=pList.get(1)%></td>
                <td style="text-align:center;width: 15%;"><%=pList.get(2)%></td>
                <td style="text-align:center;width: 15%;"><a href="process.jsp?id=<%=pList.get(3)%>"><img src="asset/next.png" style="width:20px;"></a></td>
            </tr>
            <%
                    }
                }
                if (count == 0) {
            %>
            <tr>
                <td colspan="4" style="text-align: center;"><b>No Record Found..</b></td>
            </tr>
            <%            }
            %>
        </table>
        </fieldset>
    </body>
</html>