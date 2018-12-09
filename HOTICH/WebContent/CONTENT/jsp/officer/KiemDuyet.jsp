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
    <link href="./CONTENT/styles/officer/KiemDuyet.css" rel="stylesheet"/>
</head>
<body>

<div class="wrapper">
    <jsp:include page="./template/sidebar.jsp">
    	<jsp:param value="1" name="mode" />
    </jsp:include>
    <div class="main-panel">
        <jsp:include page="./template/navbar.jsp"></jsp:include>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
					<div class="row" style="margin: 0px; padding: 0px;">
		                <div class="col-lg-6 col-sm-6" style="padding-right:0;">
		                	<div class="card">
								<button class="btn  btn-cancel" onclick="goBack()">Trở về</button>
		                	</div>
		                </div>
	                    <div class="col-lg-6 col-sm-6" style="float:right;padding-left:0;">
	                        <div class="card">
	                            <form action="HoSoDangKy/xacNhan" method="post" onsubmit="return submitKiemDuyetKhaiSinh()">
									<input type="hidden" name="NYC_HOVATEN_SUBMIT" id="NYC_HOVATEN_SUBMIT" value='<c:out value='${khaisinh.getNgYeuCau().getHoVaTen()}'></c:out>'>
									<input type="hidden" name="ERROR" id="ERROR" value="">
									<button type="submit" class="btn  btn-continue" >Tiếp tục</button>
								</form>
	                        </div>
	                    </div>
	                </div>
                	<jsp:include page="HoSoDangKyKhaiSinh.jsp">
    					<jsp:param value='${khaisinh }' name="khaisinh" />
    				</jsp:include>
                    <!-- code here .... -->
                    
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="./template/footer.jsp"></jsp:include>
</body>
	<jsp:include page="./template/js.jsp"></jsp:include>
	<!-- File .js cho datatable -->
	<script type="text/javascript" src="./CONTENT/js/officer/KiemDuyet.js"></script>
	<script type="text/javascript">
    	$(document).ready(function(){

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