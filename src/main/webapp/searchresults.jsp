<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <style>
        /* CSS styles here should match the styles used in your HTML page */
        body {
            background-color: #393E41;
            color: #fff;
            font-family: Arial, sans-serif;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #00A651;
            padding: 10px;
            border-bottom: 1px solid #bdbdbd;
        }
        .logo {
            height: 100px;
            width: auto;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            box-sizing: border-box;
        }
        .content {
            background-color: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
        .input-box input {
            width: 300px;
            padding: 10px;
            border-radius: 5px;
            border: none;
        }
        .btn button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #00A651;
            color: #fff;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>
</head>
<body>
	<header>
        <img src="eu_logo@2times_retina_logo.png" alt="EU logo" class="logo">
    </header>
    
    <div class="container">
        <div class="content">
            <h2>Search Results</h2>
            
            <% if (request.getAttribute("notFound") != null && (boolean) request.getAttribute("notFound")) { %>
                <p>No student found with this registration number.</p>
            <% } else { %>
                <form action="ReportServlet" method="post">
                    <input type="hidden" name="regNumber" value="<%= request.getAttribute("regNumber") %>">
                    <input type="hidden" name="studentName" value="<%= request.getAttribute("studentName") %>">
                    <input type="hidden" name="emailAddress" value="<%= request.getAttribute("emailAddress") %>">
                    <input type="hidden" name="phoneNumber" value="<%= request.getAttribute("phoneNumber") %>">
                    
                    <p>Registration Number: <%= request.getAttribute("regNumber") %></p>
                    <p>Student Name: <%= request.getAttribute("studentName") %></p>
                    <p>Email Address: <%= request.getAttribute("emailAddress") %></p>
                    <p>Phone Number: <%= request.getAttribute("phoneNumber") %></p>
                    
                    <!-- Include other fields here -->
                    <button type="submit" class="btn">Generate Report</button>
                </form>
            <% } %>
            
            <a href="javascript:history.back()">Back to Search</a>
        </div>
    </div>
</body>
</html>
