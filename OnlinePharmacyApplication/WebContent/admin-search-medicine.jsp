<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.cognizant.model.MedicineModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel= "stylesheet" type= "text/css" href= "admin-search-medicine.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Medicine Search</title>
<script src= "admin-search-medicine.js"></script>
</head>
<body>
<div class="menu">
		<h3 id="heading">Best Online Pharmacy</h3>
		<ul>
 		    <li><a href="#logout">Logout</a></li>
		</ul>
	</div>

	<p id="top_line">Medicines</p>
	<div>
		<p id= "delete-message">Medicine deleted successfully</p>
		<p id= "add-message">Medicine added to cart  successfully</p>	
	</div>
	<div class= "search-bar">
		<input type= "text" id= "field-search" name= "searchbar" placeholder= "Search Medicine" value= ""/>
		<% String search = request.getParameter("searchbar");
			
		%>
		<button type= "button" value= "" id= "button-search" name= "button-search" onclick="showMedicines()">Search</button>
		<a href= "admin-add-medicine.html"  ><button id= "button-add_Medicine">Add Medicine</button></a>
	</div>
	<p id= "error">Medicine not found</p>

<div id= "medicine_table">
	<table class= "table" id= "table" style="border:1px solid black;">
		<tr id= "row-1">
			<th>Name</th>
			<th>Type</th>
			<th>Unit Value</th>
			<th>Unit</th>
			<th>Price(Rs.)</th>
			<th>Actions</th>
		</tr>
<%
	
	
	//JDBC
		String db_username = "root";
		String db_password = "root";
		String db_driverClassName = "com.mysql.jdbc.Driver";
		String db_url = "jdbc:mysql://localhost:3306/online_pharmacy";
	
	//JDBC connection
		Connection connection = null;
		PreparedStatement statement;
		
		try{
			Class.forName(db_driverClassName);
			connection = DriverManager.getConnection(db_url, db_username, db_password);
			String showQuery = "select * from medicine_table where medName='PauseMF'";
			statement = connection.prepareStatement(showQuery);
			ResultSet resultSet = statement.executeQuery(showQuery);
			while(resultSet.next()){
				%>
				<tr>
				<td><%= resultSet.getString("medName") %></td>
				<td><%= resultSet.getString("medType") %></td>
				<td><%= resultSet.getString("unitValue") %></td>
				<td><%= resultSet.getString("unit") %></td>
				<td><%= resultSet.getString("medPrice") %></td>
				<td id= "action_buttons">
					<a href= "admin-edit-medicine.html"  ><button type= "button" class= "table_button" id= "edit" value= "">Edit</button></a>
					<a href= "admin-delete-medicine.jsp"><button type= "button" class= "table_button" id= "delete" name= "delete"  value= "">Delete</button></a>
				</td>
				</tr>
				<%
			}
			 %>
			 </table>
			 </div>
			 <% 
		}catch(Exception exception){
			out.print(exception.getMessage());
		}finally{
			if(connection != null){
				connection.close();
			}
		}
%>
<footer>
		Copyright © 2019 Best Online Pharmacy
</footer>
</body>

</html>