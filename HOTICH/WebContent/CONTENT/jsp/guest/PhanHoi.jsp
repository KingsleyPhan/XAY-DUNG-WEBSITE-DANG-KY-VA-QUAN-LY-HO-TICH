<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Models.TraCuuHoSoService"%>
<%@page import="DAO.Consts"%>
<%@page import="Models.LoaiGiayToService" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.CreateCode"%>
<!DOCTYPE html>
<html>
<head>
  <title>HOTICH.NET</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/guest/main.css">
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/guest/HAF.css">
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/guest/StepOfIndex.css">
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/guest/TraCuu.css">
</head>
<body>
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
                       <p id="bannerCoQuan" class="location"><%=Consts.LocationCap1%></p>
					<p id="CoQuanCap2" class="locationCap2"><%=Consts.LocationCap2%></p>
                </div>
            </div>
         <div class="row">
						<div class="col-12">
							<div class="container">							
								<form action="PhanHoiEmail" method="POST" onsubmit="return validatePhanHoi()">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title"><i class="fa fa-envelope" style="color:White;"></i> GÓP Ý CỦA CÔNG DÂN</h4>
										</div>
										<div class="row">
											<div class="modal-body" style="height: auto">
												<div class="col-12 col-sm-6 col-md-6">
													<div class="form-group">
														<label for="">EMAIL</label>
														<input type="text" class="form-control" id="NYC_EMAIL" name="NYC_EMAIL" style="border: 1px solid #004f7e" >
													</div>
													<p class="error" id="error_NYC_EMAIL"></p>
												</div>

												<div class="col-12 col-sm-6 col-md-6">
													<div class="form-group">
														<label for="">Mật khẩu</label>
														<input type="password" class="form-control" id="NYC_SDT" name="NYC_SDT" style="border: 1px solid #004f7e"/>
													</div>
													<p class="error" id="error_NYC_SDT"></p>
												</div>
												<div class="col-12 col-sm-12 col-md-12">
													<div class="form-group">
														<label for="">Phản hồi</label>
														<input type="hidden" id="message" name="message" value=""> 
														<textarea class="form-control" rows="5" id="NOIDUNG" name="NOIDUNG" style="border: 1px solid #004f7e"></textarea>
													</div>
													<p class="error" id="error_NOIDUNG"></p>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" style="background-color:#004f7e" class="btn btn-primary" onClick="goBack()">Trở lại</button>
											<button type="submit" style="background-color:#004f7e" onclick="return validatePhanHoi()" class="btn btn-primary">Gửi phản hồi</button>
										</div>
										<!-- /.modal-content -->
										</div>
									<!-- /.modal-dialog -->
								</div>
								</form>
							</div>
							<!--  -->
						</div>
						
					</div>
         
         
            <div class="row footer-CoQuan">
                <div class="col-sm-6">
                    <p class="content-gioithieus"> HỔ TRỢ TƯ VẤN THỦ TỤC ĐANG KÝ HỘ TỊCH</p>
                    <p class="content-gioithieus" style="text-align: center"><i class="fa fa-phone"></i> 08963254658
                    </p>
                </div>
                <div class="col-sm-6">
                    <p class="content-gioithieus"> ĐỊA CHỈ TỌA LẠC CƠ QUAN</p>
                    <p class="content-gioithieus" style="text-align: center">835/23 Đường Trương Văn Thành, Phường Hiệp
                        Phú, Quận 9 </p>
                </div>
            </div>
        </div>
     </form>
    </div>

    <!--Start Content-->
    <!-- Start Footer-->
    <footer style="margin-top: 5px !important;">
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
    <script src="CONTENT/js/guest/index.js"></script>
    <script src="CONTENT/js/guest/valiedateForm.js"></script>
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