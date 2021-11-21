<%@ page import="java.sql.*,databaseconnection.*"%>

<% 
String user=request.getParameter("user");
String pass=request.getParameter("pass");

    String nam=null,uid=null;
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String sql="select * from signup where user='"+user+"' AND pass='"+pass+"'";

	try
	{
	   con=databasecon.getconnection();
	    st=con.createStatement();
	    rs=st.executeQuery(sql);
	    if(rs.next())
	     {
		 uid=rs.getString("uid");
		 nam=rs.getString("name");
		 session.setAttribute("nam",nam);
		 session.setAttribute("uid",uid);
		 response.sendRedirect("userhome.jsp"); 
		}
		else
		{
  	   response.sendRedirect("userlog.jsp?message=fail");
        }
	
	}

	catch(SQLException e1)

	{

		

		System.out.println(e1);

	

	 }



            %>
