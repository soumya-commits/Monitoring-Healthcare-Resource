<%@ page import="java.sql.*"%> 
<%
String username_entered=request.getParameter("username");
String password_entered=request.getParameter("password");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare","root","root");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from patientdetails where username='"+username_entered+"' and password='"+password_entered+"'");  
        
if(rs.next())
{
    String username=rs.getString("username");
    session.setAttribute("username",username); 
%>
<script>
    window.location="viewprofile.jsp";
</script>
<%    
}
else
{
%>
<script>
    window.alert("Incorrect username or password");
        window.location="patientlogin.html";
    </script>
<%
}
}
catch(Exception e){
out.println(e);
}
%>
