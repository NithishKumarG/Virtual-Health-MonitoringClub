<%@ page import="java.sql.*,databaseconnection.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>	 

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%


String uid=(String)session.getAttribute("uid");
String nam=(String)session.getAttribute("nam");
 ArrayList list = new ArrayList();
            ServletContext context = getServletContext();
            String dirName = context.getRealPath("\\Gallery");
            String paramname = null;
            String file = null;
            String tit = null, min = null,max = null, act = null, disc = null,image = null,mid=null,tid=null;
            String [] title=null;
            java.util.Date now = new java.util.Date();
            String date = now.toString();
            String DATE_FORMAT = "yyyy-MM-dd";
            SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
            String strDateNew = sdf.format(now);
            File file1 = null;
            try {
                MultipartRequest multi = new MultipartRequest(request, dirName, 10 * 1024 * 1024); // 10MB
                Enumeration params = multi.getParameterNames();
                while (params.hasMoreElements()) {
                    paramname = (String) params.nextElement();
                    if (paramname.equalsIgnoreCase("tit")) {
                        tit = multi.getParameter(paramname);
                        title=tit.split(":");
                    }
                    if (paramname.equalsIgnoreCase("minvalue")) {
                        min = multi.getParameter(paramname);
                    }
                     if (paramname.equalsIgnoreCase("maxvalue")) {
                        max = multi.getParameter(paramname);
                    }
                      if (paramname.equalsIgnoreCase("disc")) {
                        disc = multi.getParameter(paramname);
                    }
                       if (paramname.equalsIgnoreCase("minvalue")) {
                        min = multi.getParameter(paramname);
                    }
                       if (paramname.equalsIgnoreCase("actvalue")) {
                        act = multi.getParameter(paramname);
                    }
                    if (paramname.equalsIgnoreCase("image")) {
                        image = multi.getParameter(paramname);
                    }
                             
                }
                int f = 0;
                Enumeration files = multi.getFileNames();
                while (files.hasMoreElements()) {
                    paramname = (String) files.nextElement();
                    if (paramname.equals("d1")) {
                        paramname = null;
                    }
                    if (paramname != null) {
                        f = 1;
                        image = multi.getFilesystemName(paramname);
                        String fPath = context.getRealPath("\\Gallery\\" + image);
                        file1 = new File(fPath);
                        FileInputStream fs = new FileInputStream(file1);
                        list.add(fs);
                    }
                }
                FileInputStream fs1 = null;
               
                int count = 0;
                int comment = 0;
                int lyke = 0;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=null;
                PreparedStatement psmt1=null;
                con=databasecon.getconnection();
                psmt1=con.prepareStatement("insert into medication(`image`,`tid`,`titname`,`minvalue`,`maxvalue`,`disc`,`tname`,`uid`) values(?,?,?,?,?,?,?,?)");
                psmt1.setString(1,image);
                psmt1.setString(2,title[0]);
                psmt1.setString(3,tit);
                psmt1.setString(4,min);
                psmt1.setString(5,max);
                psmt1.setString(6,disc);
                psmt1.setString(7,act);
                psmt1.setString(8,uid);
               
               
               
              
                if (f == 0) {
                    psmt1.setObject(1, null);
                } else if (f == 1) {
                    fs1 = (FileInputStream) list.get(0);
                    psmt1.setBinaryStream(1, fs1, fs1.available());
                }
                Connection con1=null;
PreparedStatement psmt11=null;
String s="pending";

con1=databasecon.getconnection();
psmt11=con1.prepareStatement("insert into token(uid,name,token,query,qdate) values(?,?,?,?,?)");

psmt11.setString(1,uid);
psmt11.setString(2,nam);
psmt11.setString(3,s);
psmt11.setString(4,tit);
psmt11.setString(5,strDateNew);

psmt11.executeUpdate();
                int x = psmt1.executeUpdate();
                if (x != 0) {
                    response.sendRedirect("userAddDetail.jsp?message=success");
                } else {
                    response.sendRedirect("userAddDetail.jsp?message=fail");
                }
            } catch (Exception e) {
                out.println(e.getMessage());
            }
        






        
%>

</body>
</html>
