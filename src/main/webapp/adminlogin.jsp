<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ID Recovery Dashboard</title>
</head>
<style>
    *{
        margin : 0px;
        padding : 0px;
    }
    body{
        background-color: #393E41;
    }
    header{
        width: 100%; 
        box-sizing: border-box;
        background-color:#00A651;
        justify-content: space-between;
        display:grid;
        grid-template-columns: 1fr 1fr 1fr;
        border-bottom:1px solid #bdbdbd;
    }
    header>h1{
        justify-self: center;
        align-self: center;
    }
    header>img{
        height: 120px;
        width: auto;
        margin-top: 5px;
    }
    header button{
        margin:20px 60px;
        border: none;
        color: black;
        background-color: #14473E;
        padding: 7px;
        border-radius: 5px;
        cursor: pointer;
        height: 30px;
        width: 90px;
        justify-self: center;
        align-self: center;

    }
    main{
       
        min-height: calc(100vh - 125.67px);
        background-image: url(wallpaperflare.com_wallpaper\(2\).jpg);
        background-size: cover;
        background-position: center;
        position:relative;
    }
    .dark-background{
        position:absolute;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
    }
    .bottom-container{
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: calc(100vh - 125.67px);
       
    }
    .content{
        height: 350px;
        width: 700px;
        background-color:rgba(0, 0, 0, 0.5);
        border-radius: 10px;
    }
    .content>p{
        text-align: center;
        padding-top: 10px;
        color: aliceblue;
        font-size: 25px;
    }
    .btn{
        display: flex;
        justify-content: center;
        align-items: center;
        
    }
    .btn button{
        margin:20px 60px;
        border: none;
        color: black;
        background-color: #00A651;
        padding: 7px;
        border-radius: 5px;
        cursor: pointer;
        height: 50px;
        width: 100px;
        margin-top:10px ;
    }
    .input-box{
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 9px;
    }
    .input-box input{
        background-color: #BCBEC0;
        border: none;
        padding-top: 5px;
        padding-bottom: 3px;
        padding-left: 6px;
        border-radius: 6px;
        color: #000;
        font-size: 20px;
    }
    input{
    	width:350px;
    	height:40px;
    }
    
</style>
<body>
    <header>
        <img src="eu_logo@2times_retina_logo.png" alt="">
        <h1 id="greeting"></h1>
    </header>
    	
        <main>
        <div class="dark-background">
            <div class="bottom-container">
                <div class="content">
                    <p>Please enter your credentials in the fields below</p>
                    <form id="studentForm" action="AdminLogin" method="post" onsubmit="return validateForm()">
                        
						
                        <div class="input-box">
                            <input type="text" placeholder="Username" name="userName" required>
                        </div>

                        <div class="input-box">
                            <input type="text" placeholder="Email Address" name="emailAddress" required>
                        </div>
                        
                        <div class="input-box">
                            <input type="text" placeholder="Phone Number" name="phoneNumber" required>
                        </div>
                        <div class="btn">
                            <button type="submit"><h2>Login</h2></button>
                        </div>
                        
                         <% if (request.getAttribute("error") != null) { %>
                            <p style="color: red;"><%= request.getAttribute("error") %></p>
                        <% } %>
                    </form>
                </div>
                
            </div>
        </div>
      
    </main>

    <script>
        function validateForm() {
            var regNumberInput = document.querySelector('input[name="regNumber"]');
            var studentNameInput = document.querySelector('input[name="studentName"]');
            var emailAddressInput = document.querySelector('input[name="emailAddress"]');
            var phoneNumberInput = document.querySelector('input[name="phoneNumber"]');

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

            // Validate Email Address
            var emailAddressPattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
            if (!emailAddressPattern.test(emailAddressInput.value)) {
                alert("Invalid Email Address format. Please enter a valid email address.");
                emailAddressInput.focus();
                return false;
            }

            // Validate Phone Number
            var phoneNumberPattern = /^\d{10}$/;
            if (!phoneNumberPattern.test(phoneNumberInput.value)) {
                alert("Invalid Phone Number format. Please enter a 10-digit number.");
                phoneNumberInput.focus();
                return false;
            }

            return true; // Form submission will proceed if all validations pass
        }
    </script>
</body>
</html>