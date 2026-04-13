<%@page import="java.sql.*"%> 
<%
String username_entered=request.getParameter("username");
String dob_entered=request.getParameter("dob");
String new_password=request.getParameter("newpassword");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare","root","root");
        Statement st=con.createStatement();
        int i=st.executeUpdate("update patientdetails set password='"+new_password+"' where username='"+username_entered+"' and dob='"+dob_entered+"'"); 
        
        
if(i>0)
{
%>
<script>
    window.location="patientlogin.html";
    window.alert("Password Updated Successfully");
</script>
<%    
}
else
{
%>
<script>
    window.alert("Incorrect details. Please try again");
        window.location="forgetpassword.jsp";
    </script>
<%
}
}
catch(Exception e){
out.println(e);
}
%>