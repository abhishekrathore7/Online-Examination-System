<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Table V01</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util99.css">
	<link rel="stylesheet" type="text/css" href="css/main99.css">
</head>
<body>



<%@ page import="db.*"%>

<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%! String olda=null; %>
	<%

	 Connection conn = Provider.getOracleConnection();
		Statement st=conn.createStatement();
	String sql="select * from que";
	ResultSet rs=st.executeQuery(sql);
	olda=request.getParameter("id");
	session.setAttribute("olda", olda);
	try{
		if(rs!=null)
		{
	%>
	
	
	
				<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
  					<tr class="table100-head">
  					  <th>Sl No.</th>
  					  <th>QUESTIONS</th>
  					  <th>OPTION A</th>
  					  <th>OPTION B</th>
  					  <th>OPTION C</th>
  					  <th>OPTION D</th>
  					  <th>Correct Ans(option)</th>
  					  <th>Update/Delete</th>
  					</tr>
	<%
			while(rs.next())
			{	
				if(olda.equals(rs.getString("a"))){
			%>	<tbody>
				<tr>
					<td>
						<%=i %>
					</td>
					<td><form>
			 			<input type="text" name="question" value="<%= rs.getString("question")%>">
						
					</td>
					<td>
			 			<input type="text" name="a" value="<%= rs.getString("a")%>">
						
					</td>
					<td>
			 			<input type="text" name="b" value="<%=  rs.getString("b")%>">
						
					</td>
					<td>
			 			<input type="text" name="c" value="<%=  rs.getString("c")%>">
						
					</td>
					<td>
			 			<input type="text" name="d" value="<%=  rs.getString("d")%>">
						
					</td>
					<td>
			 			<input type="text" name="crctans" value="<%= rs.getString("crctans")%>">
						
					</td>
					<td><input type="submit" value="Modify" formaction="zQupdate2.jsp"><a href="zQdelete.jsp?id=<%=rs.getString("a")%>" > - Delete</a></td>
				</tr>
					</div>
			</div>				
		</div>
	</div>
			<%}else{ %><tbody>
				<tr>
					<td>
						<%=i %>
					</td>
					<td>
			 			<%=rs.getString("question") %>
						
					</td>
					<td>
			 			<%=rs.getString("a") %>
						
					</td>
					<td>
			 			<%=rs.getString("b") %>
						
					</td>
					<td>
			 			<%=rs.getString("c") %>
						
					</td>
					<td>
			 			<%=rs.getString("d") %>
						
					</td>
					<td>
			 			<%=rs.getString("crctans") %>
						
					</td>
					<td><a href="zQupdate.jsp?id=<%=rs.getString("a")%>" > - UPDATE</a><br><a href="zQdelete.jsp?id=<%=rs.getString("a")%>" > - Delete</a></td>
				</tr>
					</div>
			</div>				
		</div>
	</div><%} %>
			<%
				i++;
			}
			i=1;

			%>	</tbody>
				</table>
					<hr><center>
				<input type="button" name="Exit" style="white-space: normal;" value="Add Question" class="btn" onclick="window.location.href='AddQuestion.html';"></th>
				<br><br><input type="button" name="Exit"  value="Back" class="btn" onclick="window.location.href='AdminLogin2.jsp';">
</center>
			</section>
			<%
		}
		
		

	}
	


	catch(Exception e)
	{

	}
	st.close();
	rs.close();
	conn.close();
	%>

				
</body>
</html>