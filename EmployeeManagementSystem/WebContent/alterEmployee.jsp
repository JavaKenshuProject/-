<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "entity.EmployeeBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>従業員情報変更</title>
		</head>
			<body>
			<% HttpSession httpSession = request.getSession();
				if(httpSession.getAttribute("user") == null){
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request, response);
				}


				EmployeeBean employee = (EmployeeBean)httpSession.getAttribute("employee");

					String empCode = employee.getEmpCode();
	                String lname = employee.getlName();
	                String fname = employee.getfName();
	                String lkana_name = employee.getlRubyName();
	                String fkana_name = employee.getfRubyName();
	                String sex = employee.getSex();
	                String sectionname = employee.getSectionName();

	                httpSession.setAttribute("empCode", empCode);
			%>
			<div align = "center">
			<h3>従業員情報変更</h3>
			<h5>従業員コード：<%=empCode %></h5>
				<form action = "./UpdateServlet" method = "post">
				<table>
					<tr>
				<td align = "right">氏:<input type = "text" name = "lname" value = "<%=lname %>" ></td>
				<td>名:<input type = "text" name = "fname" value = "<%=fname %>"></td>
					</tr>
					<tr>
				<td>(フリガナ)氏:<input type = "text" name = "lkana_name" value = "<%=lkana_name%>"></td>
				<td>名:<input type = "text" name = "fkana_name" value = "<%=fkana_name %>" ></td>
					</tr>
					<tr>
				<%if(sex.equals("男")){%>
					<td>性別　　　男:<input type = "radio" name = "sex" value = "1" checked></td>
					<td>女:<input type = "radio" name = "sex" value = "2"></td>
				<%}else{%>
					<td>性別　　　男:<input type = "radio" name = "sex" value = "1"></td>
					<td>女:<input type = "radio" name = "sex" value = "2" checked></td>
				<%}
				%>

				</tr>
				</table>
					所属部署名<input type = "text" name = "sectionName" value = "<%=sectionname%>"> <br>

			<input type="submit"  value="更新"  name="ACTION">

				</form>
			</div>
			</body>
</html>