<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Models.TraCuuHoSoService"%>
<%@page import="DAO.Consts"%>
<!DOCTYPE html>
<html>
<head>
<title>HOTICH.NET</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../styles/XacNhanDangKy.css">
    <link rel="stylesheet" type="text/css" href="../styles/HAF.css"> 
    <link rel="stylesheet" type="text/css" href="../styles/StepOfIndex.css">
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
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">TRA CỨU HỒ SƠ ĐĂNG KÝ HỘ TỊCH ONLINE</h4>
                    </div>
                    <div class="row">
                        <div class="modal-body" style="height:auto">
                            <div class="col-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="">Loại Giấy tờ</label>
                                    <select  style="border: 1px solid #004f7e" class="form-control" id="comboCoQuan">
                                        <option>SỞ TƯ PHÁP TỈNH CÀ MAU</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="">Mã hồ sơ</label>
                                    <input type="text" class="form-control" id="HoTenYeuCau" style="border: 1px solid #004f7e" onblur="validateHoTen(HoTenYeuCau)">
                                </div>
                            </div>
                            <div class="col-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                    <label for="">Mã xác nhận</label>
                                    <%
                                         TraCuuHoSoService TraCuu = new   TraCuuHoSoService();
                                    		String code = TraCuu.GetCodeRamdoom();
                                    %>
                                    <p  style="text-align: center; font-size: 18px">${code}</p>
                                </div>
                            </div>
                            <div class="col-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                    <label for="">Nhập mã xác nhận</label>
                                    <input type="text" class="form-control" id="HoTenYeuCau" style="border: 1px solid #004f7e" onblur="validateHoTen(HoTenYeuCau)">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" style="background-color: #004f7e">Trở lại</button>
                        <button type="button" class="btn btn-primary" style="background-color: #004f7e" onclick="return SearchCoQuan()">Tra cứu
                            >></button>
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
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">THÔNG BÁO</h4>
                    </div>
                    <div class="modal-body">
                        <p>GỬI ĐĂNG KÝ THÀNH CÔNG</p>
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
    <script src="../plugins/scrollmagic/ScrollMagic.min.js"></script>
    <script src="../js/index.js"></script>
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