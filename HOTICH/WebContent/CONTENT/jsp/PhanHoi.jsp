<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>HOTICH.NET</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="./CONTENT/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<script src="./CONTENT/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="./CONTENT/plugins/jquery/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="./CONTENT/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="./CONTENT/plugins/font/montserrat.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="./CONTENT/styles/HAF.css">
	<link rel="stylesheet" type="text/css" href="./CONTENT/styles/StepOfIndex.css">
	<link rel="stylesheet" type="text/css" href="./CONTENT/styles/manage.css">
	<link rel="stylesheet" type="text/css" href="./CONTENT/styles/phanhoi.css">
</head>
<!-- Start Header-->

    <header id="header" class="header">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="logo-text">
                        <p>HOTICH.NET</p>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- End Header-->

    <!--Start Content-->
    <div id="ct" class="content-switch">
        <div class="container">
            <div class="row">
                <div class="header_location">
                    <p id="bannerCoQuan" class="location">SỞ TƯ PHÁP THÀNH PHỐ HỒ CHÍ MINH</p>
                    <p id="CoQuanCap2" class="locationCap2">UBND PHƯỜNG HIỆP PHÚ QUẬN 9</p>
                </div>
            </div>
		</div>
		<div class="row">
			<div class="row tab-control">
				<div class="tab-col">
					<div class="tab-item isChoice">
						<a href="manage.html" class="tablinks">Hồ sơ</a>
					</div>
				</div>
				<div class="tab-col">
					<div class="tab-item">
						<a href="manageHT.html" class="tablinks">Hộ tịch</a>
					</div>
				</div>
				<div class="tab-col">
					<div class="tab-item">
						<a href="#" class="tablinks">Thống kê</a>
					</div>
				</div>
				<div class="tab-col">
					<div class="tab-item">
						<a href="#" class="tablinks">Người dùng</a>
					</div>
				</div>
				<div class="tab-col">
					<div class="tab-item">
						<a href="#" class="tablinks">Hệ thống</a>
					</div>
				</div>
				<div class="tab-col">
					<div class="tab-item">
						<a href="#" class="tablinks">Trợ giúp</a>
					</div>
				</div>
				<div class="tab-col">
					<div class="tab-item">
						<a href="manageTB.html" class="tablinks notification">
							<span>Thông báo</span>
  							<span class="badge">3</span>
						</a>
					</div>
				</div>
			</div>

            <div class="row manage-content">
                
				<div id="myFilterContainer" class="row container-filter">
					
					<div class="filter active" onclick="filterSelection(-1)">
						<div class="filter-content">
							<div class="filter-img">
								<img src="./CONTENT/image/126503.png" alt="No image">
							</div>
							<p>Tất cả</p>		
						</div>
					</div>

					<div class="filter" onclick="filterSelection(1)">
						<div class="filter-content">
							<div class="filter-img">
								<img src="./CONTENT/image/icon_KhaiSinh.png" alt="No image">
							</div>
							<p>Khai sinh</p>
						</div>
					</div>

					<div class="filter" onclick="filterSelection(2)">
						<div class="filter-content">
							<div class="filter-img">
								<img src="./CONTENT/image/kethon.png" alt="No image">
							</div>
							<p>Kết hôn</p>
						</div>
					</div>

					<div class="filter" onclick="filterSelection(3)">
						<div class="filter-content">
							<div class="filter-img">
								<img src="./CONTENT/image/chungtu.jpg" alt="No image">
							</div>
							<p>Chứng tử</p>
						</div>
					</div>

					<div class="filter" onclick="filterSelection(4)">
						<div class="filter-content">
							<div class="filter-img">
								<img src="./CONTENT/image/giamho.png" alt="No image">
							</div>
							<p>Giám hộ</p>
						</div>
					</div>

					<div class="filter" onclick="filterSelection(5)">
						<div class="filter-content">
							<div class="filter-img">
								<img src="./CONTENT/image/iconNhanQuanHe.png" alt="No image">
							</div>
							<p>Nhận quan hệ</p>
						</div>
					</div>

					<div class="filter" onclick="filterSelection(6)">
						<div class="filter-content">
							<div class="filter-img">
								<img src="./CONTENT/image/NhanConNuoi.jpg" alt="No image">
							</div>
							<p>Nhận con nuôi</p>
						</div>
					</div>

					<div class="filter" onclick="filterSelection(7)">
						<div class="filter-content">
							<div class="filter-img">
								<img src="./CONTENT/image/breakMarrry.png" alt="No image">
							</div>
							<p>Ly hôn</p>
						</div>
					</div>
					
					<div class="filter" onclick="filterSelection(8)">
						<div class="filter-content">
							<div class="filter-img">
								<img src="./CONTENT/image/trichluc.png" alt="No image">
							</div>
							<p>Bản sao</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:if test='${message != null }'>
			<div class="container">
				<c:choose>
					<c:when test='${message != "" }'>
						<div class="alert alert-success alert-dismissible fade in">
						    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						    <strong>Thành công!</strong> Thêm hộ tịch thành công.
						</div>
					</c:when>
					<c:otherwise>
					<div class="alert alert-danger alert-dismissible fade in">
					    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					    <strong>Thất bại!</strong> Thêm hộ tịch thất bại.
					</div>
					</c:otherwise>
				</c:choose>
			</div>
		</c:if>	
		<div class="container">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">XÁC NHẬN ĐĂNG KÝ HỘ TỊCH ONLINE</h4>
                    </div>
                    <div class="row">
                        <div class="modal-body" style="height:auto">
                            <div class="col-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="">EMAIL</label>
                                    <input type="text" class="form-control" id="HoTenYeuCau" style="border: 1px solid #004f7e" value="test@gmail.com" disabled>
                                </div>
                            </div>

                            <div class="col-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="">Số điện thoại</label>
                                    <input type="text" class="form-control" id="HoTenYeuCau" style="border: 1px solid #004f7e" value="0909780658" disabled>
                                </div>
                            </div>
                            <div class="col-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                    <label for="">Phản hồi</label>
									<textarea class="form-control" rows="5" id="phanhoi" style="border: 1px solid #004f7e" ></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="CheckGiayKhaiSinh.html" class="btn btn-primary" style="background-color: #004f7e">Trở lại</a>
                        <a class="btn btn-primary" style="background-color: #004f7e" onclick="goQuanLyDangKy()">Phản hồi >></a>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>


        </div>
    </div>
       <!-- Modal -->
       <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">THÔNG BÁO</h4>
                    </div>
                    <div class="modal-body">
                        <p>GỬI PHẢN HỒI THÀNH CÔNG</p>
						<a href="manage.html" class="btn btn-primary" style="background-color: #004f7e" onclick="return GuiPhanHoi()">Xong</a>
                    </div>
                </div>
            </div>
        </div>
    <!--Start Content-->
    <!-- Start Footer-->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo-text">
                        <p>HOTICH.NET</p>
                    </div>
                    <div class="subrice">
                        <p>Hệ thống đăng ký và quản lý hộ tịch trực tuyến</p>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="footer-imfor">
                        <p>Copyright (C) 2018-2019 HOTICH.NET</p>
                        <p>Phát triển bởi Phan Văn Phước Thịnh - Huỳnh Lê Hữu Hưng</p>
                        <p> SĐT tư vấn - thương mại: 0975 339 843 - 0961 561 682</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer-->
    <script src="./CONTENT/js/phanhoi.js"></script>
    <script>
        var set_height;
        var h;

        set_height = function () {
            $('.header').each(function () {
                // lấy height của chính nó
                var el_height = $(this).height();
                h = $(this).height();
                // gán height cho element
                $(this).css('height', el_height);
            });
        }

        $(window).on('load resize', function () {
            document.getElementById("ct").style.paddingTop = $('.header').height() + 'px';
            document.getElementById("ct").style.fontSize = '0';
        });



    </script>
</body>
</html>