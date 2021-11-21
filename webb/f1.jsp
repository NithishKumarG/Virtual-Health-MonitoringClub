<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>

<% Blob image = null;

Connection con = null;

byte[ ] imgData = null ;
//String w=request.getQueryString();
Statement stmt = null;

ResultSet rs = null;
String a=request.getQueryString();
System.out.println(a);



try {

Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cam","root","123");

stmt = con.createStatement();

rs = stmt.executeQuery("select image from medication where mid='"+a+"' ");

while(rs.next()) {

image = rs.getBlob(1);

imgData = image.getBytes(1,(int)image.length());

} 


response.setContentType("image/jpeg");

OutputStream fid1 = response.getOutputStream();

fid1.write(imgData);

fid1.flush();

fid1.close();

} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} finally {

try {



stmt.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();

}

}


%> 