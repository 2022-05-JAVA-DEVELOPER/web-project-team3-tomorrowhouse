<%@page import="com.itwill.shop.service.CartService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int cart_item_count=0;
	String sUserId=(String)session.getAttribute("sUserId");
	if(sUserId!=null){
		CartService cartService=new CartService();
		cart_item_count = cartService.getCartList(sUserId).size();
	}
%>		
<div id="menu">
	<ul>
		<li id="logo"><a href="shop_main.jsp"></a></li>
		<li id="m_mypage"><a href="">마이페이지</a></li>
		<li id="m_order"><a href="order_list.jsp">주문내역</a></li>
		<li id="m_cart"><a href="cart_list.jsp">공지사항</a></li>
		<li id="m_join"><a href="user_wrtie_form.jsp" >회원가입</a></li>
		<li id="m_login"><a href="user_login_form.jsp">로그인</a></li>
		
		<%-- 
		<%if(sUserId==null){  %>
			<li id="mypage" title="나의페이지" ><a href="user_login_form.jsp" ></a></li>
			<li id="cart" title="장바구니"><span class="w3-badge-no-login w3-green-no-login w3-margin-right">0 </span><a href="user_login_form.jsp" title="장바구니"></a></li>
		<%}else{ %>
			<li id="mypage" title="나의페이지" ><a href="user_view.jsp"></a></li>
			<li id="cart" title="장바구니"><span class="w3-badge w3-green w3-margin-right"><%=cart_item_count%></span><a href="cart_view_select_update_qyt_all_check_delete_image.jsp"></a></li>
		<%} %>
		--%>
		
		
		
	</ul>

		
	
</div>