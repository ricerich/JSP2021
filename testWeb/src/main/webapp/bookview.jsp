<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";

Connection dbconn = DriverManager.getConnection(url, "madang", "madang");
Statement stmt = dbconn.createStatement();

 String bookid = (request.getParameter("bookid")==null) ? "4" : request.getParameter("bookid");

//  String bookid = request.getParameter("bookid");
 
// if(bookid == null)
// 	bookid = "1";

// if(bookid.equals("")) //���� �ƴ� null �� ó���ؾ� ��
// 	bookid = "1";

//  if(bookid.equals(null))// �̷��� �ϸ� �ȵ�!!!
// 		bookid = "1";

ResultSet myResultSet = stmt.executeQuery("SELECT * FROM BOOK WHERE bookid='" + bookid + "'");

if (myResultSet != null) {
	myResultSet.next();
%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=EUC-KR">
<title>** BOOK VIEW **</title>
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple"
	alink="red">
	<table border="1" cellspacing="0" width="400" bordercolor="#9AD2F7"
		bordercolordark="white" bordercolorlight="#B9E0FA">
		<tr>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;"><b>å �� ��</b></span>
				</p>
			</td>
			<td width="513">
				<p>
					<span style="font-size: 9pt;"> <%=myResultSet.getString("BOOKNAME")%></span>
				</p>
			</td>
		</tr>
		<tr>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;"><b>�� �� ��</b></span>
				</p>
			<td width="513">
				<p>
					<span style="font-size: 9pt;"> <%=myResultSet.getString("PUBLISHER")%></span>
				</p>
			</td>
		</tr>
		<tr>
			<td width="150" height="23">
				<p align="center">
					<span style="font-size: 9pt;"><b>�� ��</b></span>
				</p>
			<td width="513">
				<p>
					<span style="font-size: 9pt;"> <%=myResultSet.getString("PRICE")%></span>
				</p>
			</td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="0" width="400" height="23">
		<tr>
			<td width="150">
				<p align="right">
					<span style="font-size: 9pt;"> <a href="booklist.jsp?">
							<font color="black">���</font>
					</a></span>
				</p>
			</td>
		</tr>
	</table>
	<%
	}
	stmt.close();
	dbconn.close();
	%>
</body>
</html>