<%@page import="java.sql.*"%>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" href="style.css">
    <style>
       
        #body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #f5f7fa, #c3cfe2);
            justify-content: center;
            align-items: center;
            height: 600px;
            padding:25px 100px 15px 500px;
        }
        #profile-container {
            width: 100%;
            max-width: 600px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            justify-content: center;
            align-items: center;
            padding:20px;
        }
        #profile-header {
            background: #335d95;
            color: white;
            padding: 20px 10px;
        }
        #profile-header h1 {
            margin: 0;
            font-size: 24px;
        }
        #profile-header p {
            font-size: 16px;
            margin: 5px 0 0;
        }
        #profile-details {
            padding: 20px;
        }
        #profile-details h2 {
            color: #335d95;
            margin-bottom: 20px;
            font-size: 22px;
        }
        #profile-details table {
            width: 100%;
            border-collapse: collapse;
        }
        #profile-details th, #profile-details td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #f0f0f0;
        }
        #profile-details th {
            font-weight: bold;
            color: #335d95;
        }
        #profile-details td {
            color: #333;
        }
        #logout-button {
            margin-top: 20px;
        }
        #logout-button button {
            background: #ff0000;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }
        #logout-button button:hover {
            background: #cc0000;
        }
    </style>
</head>
<body>
    <div id="header">
<h1>Monitoring Healthcare in Government Hospitals</h1>
<p>Empowering Government Hospitals With Real-Time Resource Management</p>
<button  onclick="location.href='viewprofile.jsp'">View profile</button>
<button  onclick="location.href='patientdoctors.jsp'">View Doctors Available</button>
<button  onclick="location.href='bookslot.jsp'">Book an appointment</button>
<button  onclick="location.href='upcomingapp.jsp'">Upcoming Appointments</button>
    </div>
<div id="body">
<%
    String username = (String) session.getAttribute("username");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare", "root", "root");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM patientdetails WHERE username = '"+username+"'");

            if (rs.next()) {
%>
    <div id="profile-container">
        <div id="profile-header">
            <h1>Welcome, <%= username %>!</h1>
            <p>Your personal details</p>
        </div>
        <div id="profile-details">
            <h2>Profile Information</h2>
            <table>
                <tr>
                    <th>First Name</th>
                    <td><%= rs.getString("firstname") %></td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td><%= rs.getString("lastname") %></td>
                </tr>
                <tr>
                    <th>Date of Birth</th>
                    <td><%= rs.getString("dob") %></td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td><%= rs.getString("gender") %></td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td><%= rs.getString("phone") %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= rs.getString("email") %></td>
                </tr>
            </table>
        </div>
        <div id="logout-button">
            <button onclick="location.href='patientlogin.html'">Logout</button>
        </div>
    </div>
<%
            } 
        } catch (Exception e) {
            out.println(e);
        }
%>

</div>

</body>
</html>
