
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
    Admin | Product List
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/views/admin/css/style.css" rel="stylesheet" />
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
	<table class="table table-hover dark" >
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Tên Sản Phẩm</th>
				<th scope="col">Giá Bán</th>
				<th scope="col">Chi Tiết</th>
				<th scope="col">Hình Ảnh</th>
				<th scope="col">Sửa</th>
				<th scope="col">Xóa</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${productList}" var="product">
			<tr>
				<td>${product.id}</td>
				<td>${product.productname}</td>
				<td>${product.price}</td>
				<td class="exam1">${product.detail}</td>
				<td><img height="100px" width="100px"
					src="<%=request.getContextPath()%>/images/${product.image}"
					alt="Card image cap" /></td>
					<td><a href="editProduct?id=${product.id}" class="icon"><i class="fas fa-edit"></i></a></td>
					<td><a href="deleteProduct?id=${product.id}" class="icon"><i class="fas fa-trash-alt"></i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
      </div>

</body>

</html>
	