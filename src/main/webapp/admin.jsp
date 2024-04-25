<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel - Generate Report</title>
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
        margin-top:10px;
        
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
        width: 270px;
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
        padding-top: 10px;
        padding-bottom: 3px;
        padding-left: 6px;
        border-radius: 6px;
        color: #000;
        font-size: 20px;
        margin-top:10px;
    }
    input{
    	width:350px;
    	height:40px;
    }
    label{
    	display:block;
    	color:white;
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
				    <p>Admin Panel - Generate Report</p>
				    <form id="studentForm" action="AdminReportServlet" method="post" onsubmit="return validateDates()">
					    <div class="input-box">
					        <label for="start_date">Start Date:</label>
					        <input type="datetime-local" id="start_date" name="start_date" required>
					    </div>
					    
					    <div class="input-box">
					        <label for="end_date">End Date:</label>
					        <input type="datetime-local" id="end_date" name="end_date" required>
					    </div>
					
					    <div class="btn">
					        <button type="submit"><h2>Generate Report</h2></button>
					    </div>
					</form>

				</div>
			</div>
		</div>
    </main>
</body>
<script>
        function validateDates() {
            var startDate = document.getElementById('start_date').value;
            var endDate = document.getElementById('end_date').value;

            if (startDate >= endDate) {
                alert('End Date must be greater than Start Date');
                return false;
            }

            return true;
        }
    </script>
</html>
