<%@page import="java.sql.*"%>
<html>
<head>
    <title>Patient's Appointments</title>
    <link rel="stylesheet" href="style.css">
    <style>
        #body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            justify-content: center;
            align-items: center;
            height: 600px;
            padding:25px 100px 15px 400px;
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

<button  onclick="location.href='doctorform.html'">Add Doctors</button>
<button  onclick="location.href='viewhospitals.jsp'">View Govt. Hospitals</button>
<button  onclick="location.href='admindocs.jsp'">View Doctors</button>
<button  onclick="location.href='viewpatient.jsp'">View Patients</button>
<button  onclick="location.href='patientapp.jsp'">Patient's Appointment</button>

<div id="logout">
 <button  onclick="location.href='index.html'">Logout</button>
</div>
</div>
    </div>
<div id="body">
    
<%
    String username = (String) session.getAttribute("username");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare", "root", "root");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM appointments where username IS NOT NULL" );

            while(rs.next()){
%>
    <div id="profile-container">
        <div id="profile-header">
            <p>Appointment Details</p>
        </div>
        <div id="profile-details">
            <table>
                <tr>
                    <th>User Name</th>
                    <td><%= rs.getString("username") %></td>
                </tr>
                <tr>
                    <th>Date</th>
                    <td><%= rs.getString("date") %></td>
                </tr>
                <tr>
                    <th>Time</th>
                    <td><%= rs.getString("time") %></td>
                </tr>
            </table>
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