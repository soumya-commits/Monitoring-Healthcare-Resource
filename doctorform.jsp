<%@page import="java.sql.*"%>
<%
    String fullname=request.getParameter("fullname");
    String gender=request.getParameter("gender");
    String phone=request.getParameter("phone");
    String email=request.getParameter("email");
    String department=request.getParameter("department");
    String timings=request.getParameter("timings");
    String hospitalname=request.getParameter("hospitalname");
    String area=request.getParameter("area");
    String city=request.getParameter("city");
    String pincode=request.getParameter("pincode");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare","root","root");
        Statement st=con.createStatement();
        
        int i=st.executeUpdate("insert into doctorform values('"+fullname+"','"+gender+"','"+phone+"','"+email+"','"+department+"','"+timings+"','"+hospitalname+"','"+area+"','"+city+"','"+pincode+"')");
        if(i>0)
{
%>
<script>
    window.alert("Doctor Added");
    window.location="adminpage.html";
</script>
<%    
}
else
{
%>
<script>
    window.alert("Please try again");
        window.location="doctorform.html";
    </script>
<%
}
}
catch(Exception e){
out.println(e);
}
%>
