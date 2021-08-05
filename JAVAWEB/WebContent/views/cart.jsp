<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Docle | Giỏ hàng</title>
<!--===============================================================================================-->
 <link href="${pageContext.request.contextPath}/css/styleCart.css" rel="stylesheet" /> 
 <link href="${pageContext.request.contextPath}/css/styleinclude.css" rel="stylesheet" /> 
 <!--===============================================================================================-->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
 <!--===============================================================================================-->
 <link rel="stylesheet" type="text/css" href="./vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!--===============================================================================================-->
 <script src="js/jquery-1.11.1.min.js"></script>
<!--===============================================================================================-->
</head>
<body>
	<!-- navbar -->
	<jsp:include page="menu.jsp" />
	<!-- /Navbar -->
<div class="tieude" style="background-image: url('${pageContext.request.contextPath}/images/banner.jpg')">
</div>
<div class="container"> 
 <table id="cart" class="table table-hover table-condensed"> 
  <thead> 
   <tr> 
    <th style="width:50%">Sản phẩm</th> 
    <th style="width:10%">Giá</th> 
    <th style="width:10%">Số lượng</th> 
    <th style="width:22%" class="text-center">Thành tiền</th> 
    <th style="width:10%"> </th> 
   </tr> 
  </thead> 
  <tbody>
  <c:forEach items="${sessionScope.cart}" var="row">
  <tr> 
   
   <td data-th="Product"> 
    <div class="row">		
     <div class="col-sm-2 hidden-xs">
     	<img src="<%=request.getContextPath()%>/images/${row.value.product.image }" alt="Ảnh"  width="80" heigh="80">
     </div> 
     <div class="col-sm-10"> 
      <h4 class="nomargin">${row.value.product.productname}</h4> 
      
     </div> 
    </div> 
   </td> 
   <td data-th="Price">${row.value.unitPrice}</td> 
   <td data-th="Quantity"><input class="form-control text-center" value="${row.value.quantity }" type="number">
   </td> 
   <td data-th="Subtotal" class="text-center">${row.value.quantity * row.value.unitPrice}</td> 
   <td class="actions" data-th="">
    <a class="btn btn-danger btn-sm"  href="deleteToCart?id=${row.value.product.id}" ><i class="fas fa-trash-alt"></i>
    </a>
   </td> 
  </tr>
  </c:forEach>
  </tbody><tfoot> 
    
   <tr> 
    <td><a href="home" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
    </td> 
    <td colspan="2" class="hidden-xs"> </td> 
    <td class="hidden-xs text-center">
    	<c:set var="total" value="${0}" /> 
    		<c:forEach	items="${sessionScope.cart}" var="map">
					<c:set var="total" value="${total + map.value.quantity * map.value.unitPrice}" />
			</c:forEach> <strong>Tổng tiền: ${total }</strong>
    </td> 
    <td><a href="#" class="btn btn-success btn-block">Thanh toán <i class="fa fa-angle-right"></i></a>
    </td> 
   </tr> 
  </tfoot> 
 </table>
 </div> 
 <!-- footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>