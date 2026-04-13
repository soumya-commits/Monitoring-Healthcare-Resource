<%@ page import="java.sql.*"%> 
<%
    String username=request.getParameter("username");
    String date=request.getParameter("date");
    String time=request.getParameter("time");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcare", "root", "root");
            Statement st = con.createStatement();
            int i = st.executeUpdate("INSERT INTO appointments VALUES('"+username+"','"+date+"','"+time+"')");

            if(i>0)
            {
                
%>
<script>
    window.alert("Appointement booked successfully!");
    window.location="upcomingapp.jsp";
</script>
<%    
}
else
{
%>
<script>
    window.alert("Appointment not booked. Please try again later.");
        window.location="bookslot.jsp";
    </script>
<%
}
}
catch(Exception e){
out.println(e);
}
%>
