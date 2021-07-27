<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Admin | Edit Product
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
<div class="content">
     <div class="container-fluid">
     <div class="container">
	<p style="color: red;">${errorString}</p>

	<c:if test="${not empty product}">
	<form method="POST"	action="${pageContext.request.contextPath}/admin/editProduct">
					<legend>Sửa Sản Phẩm:</legend>
					<label>id</label> <br>
					<input type="text" name="id" value="${product.id}" readonly required ><br> 
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
					<br> <button type="submit" class="btn btn-success">Submit</button>
					<button class="btn btn-warning"><a href="${pageContext.request.contextPath}/admin/productList">Cancel</a></button>
			</form>
	</c:if>
	</div>
	</div>
	</div>
	</body>
</html>