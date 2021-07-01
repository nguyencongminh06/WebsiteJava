
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>

<mt:admin_template title="CreateProduct">
	<jsp:attribute name="content">
      
      
      
      <form method="POST" action="${pageContext.request.contextPath}/createProduct">
         <table border="0">
            	<p class="text-danger">${errorString}</p>
            <tr>
               <td>Name</td>
               <td><input type="text" name="productname" value="${product.productname}" /></td>
            </tr>
            <tr>
               <td>Price</td>
               <td><input type="text" name="price" value="${product.price}" /></td>
            </tr>
            <tr>
               <td>Detail</td>
               <td><input type="text" name="detail" value="${product.detail}" /></td>
            </tr>
            <tr>
               <td>Image</td>
               <td><input type="text" name="image" value="${product.image}" /></td>
            </tr>
            <tr>
               <td>ID Cate</td>
               <td><input type="text" name="idc" value="${product.idc}" /></td>
            </tr>
            <tr>
               <td colspan="2">                  
                   <input type="submit" value="Submit" />
                   <a href="productList">Cancel</a>
               </td>
            </tr>
         </table>
      </form>
      	</jsp:attribute>
</mt:admin_template>