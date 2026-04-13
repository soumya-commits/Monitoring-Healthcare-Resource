<%@page import="java.sql.*"%>
<html>
<head>
<title>Book Appointemnt</title>
<link rel="stylesheet" href="style.css">
<style>
#body{
height:600px;
background-image:url("alogin.jpg");
font-family: Arial, sans-serif;
background-repeat:no-repeat;
background-size:cover;
align-content: center;
position:relative;
padding:0px 200px 0px 200px;
}
#body::after{
background-color:rgba(0,0,0,0.7);
}
#body button{
background:#335d95;
color:#ffffff;
border-radius:12px;
cursor:pointer;
padding:10px 20px;
width:100%;
font-family: Arial, sans-serif;
font-size:25px;
}
#body button:hover{
background:#00008B;
}
#body h2{
color:#335d95;
text-align:center;
font-size:25px;
}
#Appointment-form{
background:#ffffff;
border-radius: 8px;
max-width: 400px;
text-align:left;
margin:auto;
padding:20px 30px;
}
input{
width: 100%;
padding: 10px;
font-size: 16px;
border: 1px solid #ced4da; 
border-radius: 4px;
}
label{
font-size: 20px;
font-weight: bold;
}
#body a{
color:#335d95;
text-decoration:none;
}
#body a:hover{
text-decoration:underline;
color:#00008B;
}
#logout button:hover{
background:#ff0000;
color:#ffffff;
}
#button-container{
display:flex;
justify-content:center;
gap:7px;
}
</style>
</head>
<body>
<div id="header">
        <h1>Monitoring Healthcare in Government Hospitals</h1>
        <p>Empowering Government Hospitals With Real-Time Resource Management</p>
        <div id="button-container">
<button  onclick="location.href='viewprofile.jsp'">View profile</button>
<button  onclick="location.href='patientdoctors.jsp'">View Doctors Available</button>
<button  onclick="location.href='bookslot.jsp'">Book an appointment</button>
<button  onclick="location.href='upcomingapp.jsp'">Upcoming Appointments</button>

<div id="logout">
 <button  onclick="location.href='index.html'">Logout</button>
</div>
</div>
    </div>
<div id="body">
<div id="Appointment-form">
<h2>Book an Appointment</h2>
<%
    String username = (String) session.getAttribute("username");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare", "root", "root");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM patientdetails WHERE username = '"+username+"'");

            if (rs.next()) {
%>
<form action="slot.jsp" method="post">
  <label for="username">Username:</label><br>
  <input type="text" id="username" name="username" value="<%= username %>" placeholder="Enter Your Username" required readonly><br><br><br>
  <label for="date">Date:</label><br>
  <input type="date" id="date" name="date" placeholder="Enter the date" required><br><br><br>
  <label for="time">Time:</label><br>
  <input type="time" id="time" name="time" placeholder="Enter the time" required ><br><br><br>
<button type="submit">Book an Appointment</button>
</form> 
  <%
            } 
        } catch (Exception e) {
            out.println(e);
        }
%>
</div>
</div>

<div id="footer">
<div id="social">
<h2>Follow us at:</h2>
<a href="https://www.instagram.com/" target="_blank"><img src="istg.png"></a>
<a href="https://www.facebook.com/" target="_blank"><img src="fbook.png"></a>
<a href="https://x.com/__x" target="_blank"><img src="xsocial1.png"></a>
</div>

<div id="contact">
<h2>Contact us at:</h2>
<p><strong>Email: </strong><a href="mailto:dynamiccreators778@gmail.com">Dynamiccreators778@gmail.com</a></p>
<p><strong>Phone: </strong>1234567891, 1800557456<br></p>
<p><strong>Address:</strong>1234 Main Street ,City , Country</p>
</div>
</div>

<div id="copy">
<p>&copy;2024 Healthcare Monitoring Services. All rights reserved.</p>
</div>

</body>
</html>