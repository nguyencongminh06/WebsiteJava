<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<li class="nav-item"><a class="nav-link" href="views/admin/login1.jsp">Đăng Nhập</a></li>
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
				<a class="btn btn-success btn-sm ml-3" href="show"> <i
					class="fa fa-shopping-cart"></i> Cart <span
					class="badge badge-light">3</span>
				</a>
			</form>
		</ul>
		<li class="nav-item"><a class="nav-link" href="#">Hello ${sessionScope.acc.username}</a></li>
	</div>
</nav>