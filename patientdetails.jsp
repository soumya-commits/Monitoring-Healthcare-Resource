<%@ page import="java.sql.*"%> 
<%
    String firstname=request.getParameter("firstname");
    String lastname=request.getParameter("lastname");
    String dob=request.getParameter("dob");
    String gender=request.getParameter("gender");
    String phone=request.getParameter("phone");
    String email=request.getParameter("email");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare","root","root");
        Statement st=con.createStatement();
        int i=st.executeUpdate("insert into patientdetails values('"+firstname+"','"+lastname+"','"+dob+"','"+gender+"','"+phone+"','"+email+"','"+username+"','"+password+"')");        
        
        if(i>0)
{
%>
<script>
    window.alert("Registeration Successful");
    window.location="patientlogin.html";
</script>
<%    
}
else
{
%>
<script>
    window.alert("Please try again");
        window.location="patientform.html";
    </script>
<%
}
}
catch(Exception e){
out.println(e);
}
%>
