<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DAO.Consts"%>
<%@page import="Models.CreateCode"%>
<!DOCTYPE html>
<html>
<head>
  <title>HOTICH.NET</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/XacNhanDangKy.css">
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/HAF.css">
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/StepOfIndex.css">

</head>
<body>
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
          <form action="NopHoSo" method="post" onsubmit="return validateSubmitXacNhanNopHoSo()">
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
                                    <input type="text" class="form-control" name="xacNhanEmail" id="xacNhanEmail"  style="border: 1px solid #004f7e" onblur="validateHoTen(xacNhanEmail)">
                                </div>
                            </div>

                            <div class="col-12 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label for="">Số điện thoại</label>
                                    <input type="text" name="xacNhanDienThoai"  id="xacNhanDienThoai" class="form-control"  style="border: 1px solid #004f7e" onblur="validateHoTen(xacNhanDienThoai)">
                                </div>
                            </div>
                            <div class="col-12 col-sm-12 col-md-12">
                              <%
                                CreateCode cs = new CreateCode();
                            %>
                                <div class="form-group">
                                    <label for="">MÃ XÁC NHẬN</label>
                                    <p id="textXacNhan"  style="text-align: center; font-size: 18px"><%=cs.Code() %></p>
                                </div>
                            </div>
                            <div class="col-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                    <label for="">Nhập mã xác nhận</label>
                                    <input type="text" class="form-control" name="id_typeXacNhan" id="id_typeXacNhan" style="border: 1px solid #004f7e" onblur="validateHoTen(id_typeXacNhan)">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" style="background-color: #004f7e">Trở lại</button>
                        <button type="submit" class="btn btn-primary" style="background-color: #004f7e" onclick="return SearchCoQuan()">Gửi
                            >></button>
                    </div>


                 
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
</form>

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
                        <p  id="id_error">GỬI ĐĂNG KÝ THÀNH CÔNG</p>
                    </div>
                    
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
    <script src="CONTENT/plugins/scrollmagic/ScrollMagic.min.js"></script>
    <script src="CONTENT/js/index.js"></script>
        <script src="CONTENT/js/valiedateForm.js"></script>
    <script>
    function CheckThongBao()
    {
    	var imfor =  document.getElementById("id_error").innerHTML;
    	if(imfor="Không thể nộp đơn yêu cầu. Xin kiểm tra lại !!!")
    		return false;
    	else
    		return true;
    }
    
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