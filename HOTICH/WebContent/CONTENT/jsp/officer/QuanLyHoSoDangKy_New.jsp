<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HOTICH.NET</title>
    <jsp:include page="./template/css.jsp"></jsp:include>
    <link href="./CONTENT/styles/officer/QuanLyHoSoDangKy.css" rel="stylesheet"/>
</head>
<body>

<div class="wrapper">
    <jsp:include page="./template/sidebar.jsp"></jsp:include>

    <div class="main-panel">
        <jsp:include page="./template/navbar.jsp"></jsp:include>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content select-loai">
                                <div class="row">
                                    <div class="col-xs-3" style="padding: 0">
                                        <div class="numbers">
											Giấy  
										</div>
                                    </div>
                                    <div class="col-xs-9">
                                    	<select class="form-control loai-giay" id="loai-giay" onchange="showChange()">
                                    		<option value="-1">Tất cả</option>
    										<option value="1">Khai sinh</option>
    										<option value="2">Kết hôn</option>
    										<option value="3">Chứng tử</option>
    										<option value="4">Trích lục</option>
  										</select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-12">
                        <div class="card">
                            <div class="content table-responsive table-full-width container-table">
		  						<table id="table_id" class="table">
									<thead>
		  						    	<tr style="display: table-row">
		  						      		<th class="col-stt">STT</th>
		  						      		<th class="col-ma">ID hồ sơ đăng kí</th>
		  						      		<th class="col-noidung">Nội dung hộ tịch</th>
		  						      		<th class="col-ma">Mã hồ sơ đăng kí</th>
		  						      		<th class="col-ngay">Ngày đăng kí</th>
		  						      		<th class="col-ngay">Ngày hết hạn xử lý</th>
		  						      		<th class="col-ma">Loại giấy tờ</th>
		  						      		<th class="col-tacvu">Tác vụ</th>
		  						    	</tr>
		  						  	</thead>
		  						  	
		  						</table>
		  					</div>
                        </div>
                	</div>
                </div>
               
            </div>
        </div>
    </div>
</div>
<jsp:include page="./template/footer.jsp"></jsp:include>
</body>
	<jsp:include page="./template/js.jsp"></jsp:include>
	<!-- File .js cho datatable -->
	<script type="text/javascript" src="./CONTENT/js/officer/QuanLyHoSoDangKy.js"></script>
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