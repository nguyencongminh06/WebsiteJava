<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 
<link href="https://hocwebgiare.com/thiet_ke_web_chuan_demo/bootstrap_nav/css/bootsnav.css" rel="stylesheet"> -->

<nav class="navbar navbar-expand-sm justify-content-end sticky-top"
	id="my-menu">
	<div class="container">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link navbar-brand"
				href="home"> <i class="fas fa-cloud"></i>Trang Chủ
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Giới Thiệu</a>
			</li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown">Sản Phẩm</a>
				<div class="dropdown-menu bg-dark">
					<c:forEach items="${category}" var="category">
						<a class="dropdown-item" href="category?idc=${category.idc}">${category.catename}</a>
					</c:forEach>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="#">Liên Hệ</a></li>
			<c:if test="${sessionScope.acc.isAdmin == 1}">
				<li class="nav-item"><a class="nav-link" href="admin/dashboard">Admin</a></li>
			</c:if>
			<c:if test="${sessionScope.acc != null}">
				<li class="nav-item"><a class="nav-link" href="LogOutControl">Thoát</a></li>
			</c:if>
			<c:if test="${sessionScope.acc == null}">
				<li class="nav-item"><a class="nav-link"
					href="views/admin/login1.jsp">Đăng Nhập</a></li>
			</c:if>
		</ul>
		<ul class="navbar-nav ml-auto">
			<form action="search" method="post" class="form-inline my-2 my-lg-0">
				<div class="input-group input-group-sm">
					<input value="${txtS}" name="txt" type="text" class="form-control"
						aria-label="Small" aria-describedby="inputGroup-sizing-sm"
						placeholder="Search...">
					<div class="input-group-append">
						<button class="btn btn-warning" type="submit" value="Submit">Search</button>
					</div>
				</div>
				<ul><a type="button" class="btn btn-success" href="cart"><i class="fa fa-shopping-bag"></i></a></ul>
				<%-- <div class="attr-nav">
					<ul>
						<li class="dropdown"><a href="cart" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-shopping-bag"></i>
						</a>
							<ul class="dropdown-menu cart-list">
								<c:forEach items="${sessionScope.cart}" var="row">
									<li><a href="cart" class="photo"><img
											src="<%=request.getContextPath()%>/images/${row.value.product.image }"
											class="cart-thumb" alt="ảnh"></a>
										<h6>
											<a href="cart">${row.value.product.productname}</a>
										</h6>
										<br>
										<p>
											<span class="price">${row.value.quantity} x
												${row.value.unitPrice}VND</span>
										</p></li>
								</c:forEach>
								<li class="total"><span class="pull-right"> 
								<c:set var="total" value="${0}" /> 
								<c:forEach items="${sessionScope.cart}" var="map">
									<c:set var="total"	value="${total + map.value.quantity * map.value.unitPrice}" />
										</c:forEach> <strong>Tổng tiền: ${total }</strong>
										<a href="cart">Giỏ	hàng</a>
								</span></li>
							</ul></li>
					</ul>
				</div> --%>
				<!-- <a class="btn btn-success btn-sm ml-3" href="cart"> <i
					class="fa fa-shopping-cart"></i> Cart <span class="badge badge-light">3</span>
				</a> -->
			</form>
		</ul>
		<c:if test="${sessionScope.acc != null}">
		<li class="nav-item"><a class="nav-link" href="#">Hello
				${sessionScope.acc.username}</a></li>
				</c:if>
	</div>
</nav>