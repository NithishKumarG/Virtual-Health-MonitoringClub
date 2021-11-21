<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title></title>
<link href="style.css" rel="stylesheet" type="text/css" />


<style type="text/css">

.style1 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 12px;
}

#bb:hover
{
text-decoration: underline;
}

fieldset
{
border-color: maroon;
border-radius: 5px;
border-size: 1px;  	
}



</style>
<script type="text/javascript">
function valid()
{
	var a= document.f.tok.value;
	if(a=="")
		{
		alert("Enter Token");
		document.f.tok.focus();
		return false;
		}
		
}

</script>


</head>

<body>
<%
String uid=(String)session.getAttribute("uid");
String name=(String)session.getAttribute("nam");
Connection conx=null;
PreparedStatement ps=null;

try{
conx=databasecon.getconnection();
ps=conx.prepareStatement("delete  from graph");
ps.executeUpdate();
}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>

<!--Header Background Part Starts -->
<div id="header-bg">
	<!--Header Contant Part Starts -->
	<div id="header">
		<a href="#" class="style1"><font size="+3"><center> Virtual Health Club <br />Monitoring</center></font></a>
		<!--Login Background Starts -->
		
		<!--Login Background Ends -->
		<br class="spacer" />
  </div>
	<!--Header Contant Part Ends -->
</div>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<div id="navigation-bg">
	<!--Navigation Part Starts -->
	<div id="navigation">
		<ul class="mainMenu">
			<li><a href="userhome.jsp" title="Home" class="selectMenu">USER</a></li>
			<li><a href="index.html" >Logout</a></li>
		<!--	<li><a href="query.jsp">Query</a></li>
			<li><a href="sprofile.jsp">Search profile</a></li>
			<li><a href="myprofile.jsp">My Profile</a></li>
			<li><a href="palert.jsp" class="selectMenu">Privacy Alert</a></li>-->
		</ul>
		
		</div>
	<!--Navigation Part Ends -->
</div>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg">
	<!--Our Company Part Starts -->
	<div id="ourCompany-part">
	<table align="center">
	<tr>
    
    <!-- left Side Menu -->
    
    <td width="300" valign="top">
    <fieldset>
    <table height="350">
    <tr>
    <td><form>
    &nbsp;&nbsp;<a href="userhome.jsp"><font size="+1" color="green"><input type="image" src="images/forum.jpg" width="25" height="25" >&nbsp;&nbsp; Query</font></a><br><br>
    &nbsp;&nbsp;<a href="qresult.jsp"><font size="+1" color="red"><input type="image" src="images/icon-more.gif" width="25" height="25" >&nbsp;&nbsp;Query Result</font></a><br><br>
     &nbsp;&nbsp;<a href="index.html" ><font size="+1" color="green"><input type="image" src="images/login1.png" width="25" height="25" >&nbsp;&nbsp;Logout</font></a><br><br>
    </form>
    </td>
    </tr>
    </table>
    </fieldset>
     </td>
    
     
     <!-- left Side Menu End-->
     
     <!--  Gap -->
     
     <td width="10"></td>
     
     <!--  Gap -->
     
      <!-- rigth Side content -->
      
    <td width="650">
    <div id="user_detail">
    <fieldset >
    <span class="paragraping1" style="background:#CCFF33"><strong> Query result : </strong></span>
    <table height="350">
    <tr>
    <td width="416" style="border:1px solid #DDD;" valign="top"> 
    <table align="center" width="600" style="border:1px solid #326363;" bgcolor="#FFFFFF">
   
	 
<%
int c=1,d=1,g=1,a=1;
String tok=request.getParameter("tok");	
tok=ABEEncryption.encrypt(tok, "ABEEncryption");
Connection con=null,con1=null,con3=null;
String qry=null;
PreparedStatement psmt=null,psmt1=null,psmt3=null;
ResultSet rs=null,rs1=null;
try{
con=databasecon.getconnection();
psmt=con.prepareStatement("select query from token where token='"+tok+"'");
rs=psmt.executeQuery();
if(rs.next())
{
qry=rs.getString(1);



String mid=null,min=null,max=null,dis=null;
try{
con1=databasecon.getconnection();
psmt1=con1.prepareStatement("select `mid`,`tid`,`titname`,`minvalue`,`maxvalue`,`disc` from medication where `titname` = '"+qry+"'");
rs1=psmt1.executeQuery();

while(rs1.next())
{

mid=rs1.getString(1);
min=rs1.getString(4);
max=rs1.getString(5);
dis=rs1.getString(6);



/********************for graph end************/

%>
<tr height="60">
<td colspan="3" class="paragraping1">&nbsp;&nbsp;&nbsp;&nbsp;<strong><%=c++%>.&nbsp;&nbsp;Attribute Name :</strong> &nbsp;&nbsp;&nbsp;&nbsp;<strong><font size="2" color="#FF6600"><%=qry%></font></strong>&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

<tr height="60">
	<td class="paragraping1" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Discription : &nbsp;&nbsp;&nbsp;&nbsp;<font color="#333300" size="+1"><%=dis%></font></strong></td>  	
</tr>
<tr>
      <td class="paragraping1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Related Posts :</strong></td>
</tr>
	  	 
<%
Connection con2=null;
PreparedStatement psmt2=null;
ResultSet rs2=null;
try{
con2=databasecon.getconnection();
psmt2=con2.prepareStatement("select `pid`,`mid`,`postby`,`comments`,`date` from relatedposts where `mid`='"+mid+"'");
rs2=psmt2.executeQuery();
while(rs2.next())
{
%>
<tr>
	  	<td class="paragraping"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=d++%>&nbsp;&nbsp;Posted By :&nbsp;&nbsp;&nbsp;&nbsp;<%=rs2.getString(3)%></strong></td>
</tr>
<tr>		
		<td class="paragraping">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Discription :<font color="#0033FF"><%=rs2.getString(4)%></font></td>
</tr>
<tr>		
		<td class="paragraping">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Posted Date :<font color="#FF0000"><%=rs2.getString(5)%></font></td>
	
</tr>	


<%
}
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}

}
}

catch(Exception ex)
{
out.println("Error in connection : "+ex);
}
}


else
{
response.sendRedirect("qresult.jsp?message=fail");
}
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}

%>
   
      
 <tr>
 <td height="50"></td>
 </tr>    

</table>
   
    </table>
    </fieldset>
  
    </div>
    </td>
    
    <!-- rigth Side content end -->
    
    
    </tr>
		</table>
		
	
	<!--Our Company Part Ends -->
</div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<div id="futurePlan-bg">
	<!--Future Plans Contant Part Starts -->
	
	<!--Future Plans Contant Part Ends -->
</div>
</body>
</html>
