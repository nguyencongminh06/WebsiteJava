<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Edit Product</h3>

	<p style="color: red;">${errorString}</p>

	<c:if test="${not empty product}">
		<form method="POST"
			action="${pageContext.request.contextPath}/editProduct">
			<input type="hidden" name="id" value="${product.id}" />
			<table border="0">
				<tr>
					<td>ID</td>
					<td style="color: red;">${product.id}</td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input type="text" name="productname"
						value="${product.productname}" /></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input type="text" name="price" value="${product.price}" /></td>
				</tr>
				<tr>
					<td>Image</td>
					<td><input type="text" name="image" value="${product.image}" /></td>
				</tr>
				
				<tr>
					<td>ID Category</td>
					<td><input type="text" name="idc" value="${product.idc}" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Submit" /> <a
						href="${pageContext.request.contextPath}/admin/productList">Cancel</a></td>
				</tr>
			</table>
		</form>
	</c:if>
</body>
</html>