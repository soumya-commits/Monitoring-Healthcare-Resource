<%@page import="java.sql.*"%>
<html>
<head>
    <title>View Doctors</title>
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
        #search-container select {
            width: 50%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        #search-container {
            display:flex;
            align-content:center; 
        }
        #search-button {
            padding: 10px 15px;
            font-size: 16px;
            background-color: #335d95;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        #search-button:hover {
            background-color: #0056b3;
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
    <div id="search-container">
        <form action="patientdoctors.jsp" method="post">
            
            <br>
            <select name="hospitalname" id="hospitalname">
                <option value="" disabled selected>Select hospital</option>
                <option value="Care Hospital">Care Hospital</option>
                <option value="Government Nizamia General Hospital">Government Nizamia General Hospital</option>
                <option value="Yashoda Hospitals">Yashoda Hospitals</option>
                <option value="Osmania General Hospital">Osmania General Hospital</option>
            </select>
            <button type="submit" id="search-button">Search</button>
        </form>
        
    </div>
<%
    String hospitalname = request.getParameter("hospitalname");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare", "root", "root");
            Statement st = con.createStatement();
            
            ResultSet rs = st.executeQuery("SELECT * FROM doctorform WHERE hospitalname='"+hospitalname+"'");

            while(rs.next()) {
%>
    <div id="profile-container">
        <div id="profile-header">
            <p>Doctor Details</p>
        </div>
        <div id="profile-details">
            <table>
                <tr>
                    <th>Name</th>
                    <td><%= rs.getString("fullname") %></td>
                </tr>
                <tr>
                    <th>Department</th>
                    <td><%= rs.getString("department") %></td>
                </tr>
                <tr>
                    <th>Timings</th>
                    <td><%= rs.getString("timings") %></td>
                </tr>
                <tr>
                    <th>Hospital Name</th>
                    <td><%= rs.getString("hospitalname") %></td>
                </tr>
                <tr>
                    <th>Pincode</th>
                    <td><%= rs.getString("pincode") %></td>
                </tr>
            </table>
                
        </div>
    </div>
    <br><br>
<%
            } 
           
        } catch (Exception e) {
            out.println(e);
        }
%>

</div>
</body>
</html>
