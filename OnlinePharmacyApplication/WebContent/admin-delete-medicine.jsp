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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add-Medicine</title>
</head>
<body>
	<%
	/* String medName = request.getParameter("add-name"); */
/* 	String medType = request.getParameter("type");
	String unitValue = request.getParameter("add_unit");
	String medPrice = request.getParameter("add_price");
	String unit = request.getParameter("radio_tag");
	String medExpiryDate = request.getParameter("add_expiry");
	String inStock = request.getParameter("add_instock"); */
	
	//Object Creation
	MedicineModel medicineModel = new MedicineModel();
	/* medicineModel.setMedName(medName); */
	out.print(medicineModel.getMedName());

	
	//JDBC
	String db_username = "root";
	String db_password = "root";
	String db_driverClassName = "com.mysql.jdbc.Driver";
	String db_url = "jdbc:mysql://localhost:3306/online_pharmacy";
	
	//JDBC connection
	Connection connection = null;
	PreparedStatement statement;
	RequestDispatcher dispatcher = null;
	
	try{
		Class.forName(db_driverClassName);
		connection = DriverManager.getConnection(db_url, db_username, db_password);
		/* String checkQuery = "select * from medicine_table where medName='"+medicineModel.getMedName()+"'";
		statement = connection.prepareStatement(checkQuery);
		ResultSet resultSet = statement.executeQuery(checkQuery);
		int flag=0;
		while(resultSet.next()){
			flag=1;
		}
		if(flag==0){ */
		String delQuery = "delete from medicine_table where medName='"+medicineModel.getMedName()+"'";
		statement = connection.prepareStatement(delQuery);
		/* statement.setString(1, medicineModel.getMedName());
		statement.setString(2, medicineModel.getMedType());
		statement.setString(3, medicineModel.getUnitValue());
		statement.setString(4, medicineModel.getMedPrice());
		statement.setString(5, medicineModel.getUnit());
		statement.setString(6, medicineModel.getMedExpiryDate());
		statement.setString(7, medicineModel.getInStock()); */
		statement.executeUpdate();
		dispatcher = request.getRequestDispatcher("admin-edit-medicine.html");
		out.print("Nacho bc");
		/*}
		 else{
		dispatcher = request.getRequestDispatcher("admin-edit-medicine.html"); 
		out.print("Nahi hoga");
		} */
	}catch(Exception exception){
		out.print(exception.getMessage());
	}finally{
		if(connection != null){
			connection.close();
		}
	}
	%>
</body>
</html>