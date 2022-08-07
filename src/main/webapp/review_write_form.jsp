<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.dto.OrderItem"%>
<%@page import="com.itwill.shop.dto.review.Review"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>    
<%

if(request.getMethod().equalsIgnoreCase("GET")){
    response.sendRedirect("review_list.jsp");		  
	 return;
}

String oi_noStr = request.getParameter("oi_no");
String o_noStr = request.getParameter("o_no");
String indexStr = request.getParameter("index");
int index = Integer.parseInt(indexStr);

UserInfoService userInfoService = new UserInfoService();
UserInfo userInfo = 
userInfoService.findUser(sUserId);

OrderService orderService = new OrderService();

//ArrayList<Order> orderList =
Order order=
orderService.oneOfOrderProductdetailByUserId(new Order(Integer.parseInt(o_noStr), null, null, 0, sUserId, null));
//Order order= orderList.get(Integer.parseInt(indexStr));
//orderService.findOrderDetailByOrderItemNo(Integer.parseInt(oi_noStr));

ReviewService reviewService = new ReviewService();
/*	private int oi_no;
	private int oi_qty;
	private int o_no;
	
	private Product product;
	*/
if(reviewService.selectByOrderitemNo(new Review(0, null, null, null, 0, null, 0, null, new OrderItem(Integer.parseInt(oi_noStr),0,0,null)))!=null){
	out.println("<script>");
	out.println("alert('이미 작성된 리뷰입니다♡');");
	out.println("location.href='review_list.jsp';");
	out.println("</script>");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
 
<script type="text/javascript">
	function boardCreate() {
		if (f.r_title.value == "") {
			alert("제목을 입력하십시요.");
			f.title.focus();
			return false;
		}
		if (f.r_content.value == "") {
			alert("내용을 입력하십시요.");
			f.content.focus();
			return false;
		}

		f.action = "review_write_action.jsp";
		f.method="POST";
		f.submit();
	}

	function boardList() {
		f.action = "review_list.jsp";
		f.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><%=userInfo.getU_name() %> 님의 리뷰 작성</b></td>
								</tr>
							</table> <br> <!-- write Form  -->
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
										<input type="hidden" name="oi_no" value='<%=oi_noStr %>'>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=order.getU_id()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품명</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="placeholder"  style="width: 150px" name="p_no" value='<%=order.getOrderItemList().get(index).getProduct().getP_name() %>'></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품이미지</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<img width="60px" height="58px" src="image/product/<%=order.getOrderItemList().get(index).getProduct().getP_image()%>" border="0">
									</tr>

									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">구매일자</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<%=order.getO_date() %>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 150px" name="r_title"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<textarea name="r_content" class="textarea" style="width: 350px " rows="10"></textarea></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">별점</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 150px" name="r_rating"></td>
									</tr>
								</table>
							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="리뷰 쓰기" onClick="boardCreate()"> &nbsp;
									<input type="button" value="<%=userInfo.getU_name() %>님의 리뷰 목록" onClick="boardList()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>