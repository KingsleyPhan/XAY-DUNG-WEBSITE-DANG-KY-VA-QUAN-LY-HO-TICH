<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="home" value="/" scope="request" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HOTICH.NET</title>
    <jsp:include page="./template/css.jsp"></jsp:include>
    <!-- Code css here -->
    <link rel="stylesheet" type="text/css" href="./CONTENT/styles/officer/ThongKe.css">
</head>
<body>

<div class="wrapper">
    <jsp:include page="./template/sidebar.jsp">
    	<jsp:param value="3" name="mode" />
    </jsp:include>
    <div class="main-panel">
        <jsp:include page="./template/navbar.jsp"></jsp:include>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                
                    <!-- code here .... -->
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Users Behavior</h4>
                                <p class="category">24 Hours performance</p>
                            </div>
                            <div class="content">
                                <div id="chartContainer" style="height: 300px; width: 100%;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- end code here -->
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="./template/footer.jsp"></jsp:include>
</body>
	<jsp:include page="./template/js.jsp"></jsp:include>
	<!-- Code js here -->
	<script src="./CONTENT/js/officer/ThongKe.js"></script>
	<script type="text/javascript">
    	$(document).ready(function(){
    		demo.initChartist();
        	$.notify({
            	icon: 'ti-gift',
            	message: "Welcome to <b>Paper Dashboard</b> - a beautiful Bootstrap freebie for your next project."

            },{
                type: 'success',
                timer: 4000
            });

    	});
	</script>
</html>