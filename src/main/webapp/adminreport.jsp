<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #393E41;
            color: #FFFFFF;
            padding: 20px;
        }
        h1 {
            color: #00A651;
        }
        .printed-by {
            font-style: italic;
            color: #00A651;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #FFFFFF;
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Admin Report</h1>
    <p class="printed-by">Printed by: <%= request.getCookies()[0].getValue() %></p> 

    <table>
        <thead>
            <tr>
                
                <th>Registration Number</th>
                <th>Student Name</th>
                <th>Report Time</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="record" items="${reportList}">
                <tr>
                    
                    <td><c:out value="${record.regNumber}" /></td>
                    <td><c:out value="${record.studentName}" /></td>
                    <td><c:out value="${record.reportTime}" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
