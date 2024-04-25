<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ID Recovery Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background-color: #393E41;
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
        main {
            min-height: calc(100vh - 100px);
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url(wallpaperflare.com_wallpaper\(2\).jpg);
            background-size: cover;
            background-position: center;
            position: relative;
        }
        .dark-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .content {
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
        .input-box {
            margin-bottom: 15px;
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
        }
    </style>
</head>
<body>
    <header>
        <img src="eu_logo@2times_retina_logo.png" alt="EU logo" class="logo">
    </header>
    <jsp:useBean id="reportDetails" scope="request" class="com.business.Report"/>
        <main>
        <div class="dark-background">
            <div class="content">
                <h2>Enter Credentials</h2>
                <form id="studentForm" action="search-student" method="post" onsubmit="return validateForm()">
                    <div class="input-box">
                        <input type="text" name="regNumber" id="regNumber" placeholder="Registration Number (e.g., S13/04363/21)" required value="<jsp:getProperty name="reportDetails" property="regNumber"/>">
                    </div>
                    <div class="input-box">
                        <input type="text" name="studentName" id="studentName" placeholder="Student Name (e.g., John Doe)" required value="<jsp:getProperty name="reportDetails" property="studentName"/>">
                    </div>
                    <div class="btn">
                        <button type="submit">Find Owner</button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <script>
        function validateForm() {
            var regNumberInput = document.getElementById("regNumber");
            var studentNameInput = document.getElementById("studentName");

            // Validate Registration Number
            var regNumberPattern = /^[A-Z]\d{2}\/\d{5}\/\d{2}$/;
            if (!regNumberPattern.test(regNumberInput.value)) {
                alert("Invalid Registration Number format. Please use the format S13/04363/21.");
                regNumberInput.focus();
                return false;
            }

            // Validate Student Name (each word starts with a capital letter)
            var studentNamePattern = /^[A-Z][a-zA-Z]*(\s[A-Z][a-zA-Z]*)*$/;
            if (!studentNamePattern.test(studentNameInput.value)) {
                alert("Invalid Student Name format. Each word should start with a capital letter.");
                studentNameInput.focus();
                return false;
            }

            return true; // Form submission will proceed if all validations pass
        }
    </script>
</body>
</html>
