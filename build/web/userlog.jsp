<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title></title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 12px;
}
-->
</style>
<script language="JavaScript">
function valid()
{
var a = document.f.user.value;
var b = document.f.pass.value;
if(a=="")
{
alert("Enter your Username");
document.f.user.focus();
return false;
}
if(b=="")
{
alert("Enter your Password");
document.f.pass.focus();
return false;
}
}
</script>
</head>

<body>
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
			<li><a href="index.html" class="selectMenu" title="Home">Home</a></li>
			<li><a href="providerlog.jsp" class="selectMenu" title="DOCTOR LOGIN">DOCTOR</a></li>
			<li><a href="stalog.jsp" class="selectMenu" title="CLOUD HASHCODE GENERATOR">HASHCODEGEN</a></li>
			<li><a href="userlog.jsp" class="selectMenu" title="USER">USER</a></li>
		</ul>
		</div>
	<!--Navigation Part Ends -->
</div>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg">
	<!--Our Company Part Starts -->
	<div id="ourCompany-part">
	<table width="920">
	<tr>
	<td align="center">
	<img src="images/user_login.png" width="200" height="200" />
	</td>
	<td>
	<table align="center" width="400" style="border:1px solid green;" bgcolor="#FFFFFF">
		<form name="f" action="userlog1.jsp" method="post" onSubmit="return valid();">
		<tr>
		<td height="36" colspan="2" align="center" bgcolor="#FF9900" class="paragraping">User Login Here</td>
		</tr>
		<tr>
		<td height="52" class="paragraping">Username:</td>
		<td><input type="text" name="user"  class="input"></td>
		</tr>
		<tr>
		<td height="47" class="paragraping">Password:</td>
		<td><input type="password" name="pass" class="input"></td>
		</tr>
		<tr>
		<td height="51"></td>
		<td><input type="submit" name="sub" value="Submit" id="button">&nbsp;&nbsp;<input type="reset" name="clear" value="Clear" id="button">
		
		</td>
		</tr>
		<tr>
		<td colspan="2" align="center" class="paragraping1"> <a href="user_reg.jsp">New User Register Here...</a></td>
		</tr>
		<tr>
<td class="paragraping" colspan="2" align="center"><font size="2"><b><%
							String message=request.getParameter("message");
							if(message!=null && message.equalsIgnoreCase("fail"))
							{
								out.println("<font color='red'><blink>Invalid Username and Password</blink></font>");
							}
						%></b></font></td>
</tr>
		</form>
		</table>
		</td>
		</tr>
		</table>
		
	</div>
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
