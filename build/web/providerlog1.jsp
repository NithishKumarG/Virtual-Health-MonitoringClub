<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String pass=null,uid=null;

String a = request.getParameter("user");
String b= request.getParameter("pass");

String name="provider";

//try
//{
/*Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();

String sss1 = "select * from log where name='"+name+"'";

ResultSet rs1=st1.executeQuery(sss1);
while(rs1.next())
{*/
if(("provider".equals(a)) && ("provider".equals(b)))
{
response.sendRedirect("providerhome.jsp");
}
else
{
response.sendRedirect("providerlog.jsp?message=fail");
}
/*}
} 
catch(Exception e1)
{
out.println(e1.getMessage());
}*/



%>