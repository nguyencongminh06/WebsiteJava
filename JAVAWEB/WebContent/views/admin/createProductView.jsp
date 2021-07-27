
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Material Dashboard by Creative Tim
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/dashboard/material-dashboard.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" />
</head>
<body>
<!-- navbar -->
<jsp:include page="slidebar.jsp" />
<!-- /navbar -->

	<div class="content">
		<div class="container-fluid">
		<div class="row">
		<c:if test="${not empty message}">
			<div class="alert alert-${alert}">
				${message}
			</div>
		</c:if>
		<div class="col-md-4"></div>
		<div class="col-md-6">
			<form method="POST"	action="${pageContext.request.contextPath}/admin/addProduct">
					<legend>Thêm Sản Phẩm:</legend>
					<label>Tên Sản Phẩm</label> <br>
					<input type="text" name="productname" value="${product.productname}" ><br> 
					<label>Giá Bán</label><br>
					<input type="text" name="price" value="${product.price}"><br>
					<label>Chi Tiết</label><br>
					<textarea name="detail" rows="10" cols="30">${product.detail}</textarea><br><br>
					<label>Ảnh</label><br>
					<input type="text" name="image" value="${product.image}"/><br><br>
					<label>Danh Mục:</label>
					  <select name="category" class="form-select">
					  	<c:forEach items="${category}" var="o">
					    	<option value="${o.idc}">${o.catename}</option>
					    </c:forEach>
					  </select>
					  <br>
					<br> <input type="submit" value="Submit">
			</form>
			</div>
			<div class="col-md-2"></div>
			</div>
			
<!-- ------------------------------------------------			-->
			
			
			<%-- <form method="POST"	action="${pageContext.request.contextPath}/admin/createProduct">
				<table border="0">
					<p class="text-danger">${errorString}</p>
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
						<td>Detail</td>
						<td><input type="text" name="detail"
							value="${product.detail}" /></td>
					</tr>
					<tr>
						<td>Image</td>
						<td><input type="text" name="image" value="${product.image}" /></td>
					</tr>
					<tr>
						<td>Category</td>
						<td><c:forEach items="${productList}" var="product">

							</c:forEach></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Submit" /> <a
							href="productList">Cancel</a></td>
					</tr>
				</table>
			</form> --%>
		</div>
	</div>

</body>

</html>