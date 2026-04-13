<%@page import="java.sql.*"%>
<html>
<head>
    <title>View Hospitals</title>
    <link rel="stylesheet" href="style.css">
    <style>
        #body {
            margin: 0;
            font-family: Arial, sans-serif;
            justify-content: center;
            height: 600px;
            padding:20px 50px 20px 50px;
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
        #hospital-details{
            align-content: center;
            padding-left: 250px;
        }
        #hospital-details th{
            width:25px;
        }
        table, td, th {
            align-content: center;
            border: 1px solid;
            width: 75%;
            height: 20px;
            border-collapse: collapse;
        }
        th {
            background-color: #a3d5ff;
            color: #335d95;
            height: 2px;
            width:100px;
            padding-left: 55px;
            padding-right: 50px;
            padding-top:10px;
            padding-bottom:10px;
        }
        td {
            color: #333;
            text-align: center;
            padding-top:5px;
            padding-bottom:5px;
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
    
    
    <div id="profile-header">
            <p>Hospital Details</p>
        </div>
    <br>
    <div id="hospital-details">
    <table>
                <tr>
                    <th>Hospital Name</th>
                    <th>Area</th>
                    <th>City</th>
                    <th>Pincode</th>
                    </tr>
                <tr>
<%
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare", "root", "root");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT hospitalname,area,city,pincode FROM doctorform GROUP BY hospitalname ORDER BY pincode");

            while(rs.next()){
                
%>
                    <td><%= rs.getString("hospitalname") %></td>
                    <td><%= rs.getString("area") %></td>
                    <td><%= rs.getString("city") %></td>
                    <td><%= rs.getString("pincode") %></td>
                </tr>
           
        
<% } 
           
        } catch (Exception e) {
            out.println(e);
        }
%>
 </table>
    </div>
</div>

</body>
</html>

