<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<%
	// 문자 인코딩 유형 utf-8 설정
	request.setCharacterEncoding("UTF-8");

	// 폼 페이지에서 입력된 값을 얻어옴 getParameter 메소드 작성
	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
	// 상품 가격이 입력되지 않은 경우 0으로, 입력된 경우 정수형으로 변경
	Integer price;
	if ( unitPrice.isEmpty() ) { price = 0; }
	else { price = Integer.valueOf(unitPrice); }
	
	// 상품 재고 수가 입력되지 않은 경우 0으로, 입력된 경우 정수형으로 변경
	long stock;
	if ( unitsInStock.isEmpty() ) { stock = 0; }
	else { stock = Long.valueOf(unitsInStock); }
	
	// 폼 페이지에서 입력된 데이터를 저장하도록 ProductRepository 클래스의 addProduct() 메소드 호출
	ProductRepository dao = ProductRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	
	dao.addProduct(newProduct);
	
	// products.jsp 페이지로 강제 이동 sendRedirect() 메소드 작성
	response.sendRedirect("products.jsp");
%>
	
