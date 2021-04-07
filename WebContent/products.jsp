<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>

<html>
<head>
<link rel="stylesheet"
	href="./resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>

<body>
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>

	<!-- ProductRepository 클래스의 객체 변수 instance를 호출하는 getInstance() 메소드 작성
	getAllProducts()메소드를 호출하여 반환 결과 값을 ArrayList<Product> 객체 타입의 변수 listOfProducts에 저장 -->
	<%
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>
	
	<div class="container">
		<div class="row" align="center">
			<%
			for (int i = 0; i < listOfProducts.size(); i++) {
				Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
				<img src="c:/upload/<%=product.getFilename()%>"
				style="width: 100%">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p><%=product.getUnitPrice()%>원
				
				<p> <a href ="./product.jsp?id=<%=product.getProductId()%>"
				class="btn btn-secondary" role="button"> 상세정보 &raquo;></a>	
			</div>
			<!-- &raquo : 오른쪽 꺾인 괄호
			<b> : 굵은 글시로 표현 -->
			
			<%
			}
			%>
			
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>