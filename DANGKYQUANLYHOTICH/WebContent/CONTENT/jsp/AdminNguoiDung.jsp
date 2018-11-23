<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!-- Add icon library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="CONTENT/styles/HAF.css">
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/admin.css">

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
                    <p id="bannerCoQuan" class="location">SỞ TƯ PHÁP THÀNH PHỐ HỒ CHÍ MINH</p>
                    <p id="CoQuanCap2" class="locationCap2">UBND PHƯỜNG HIỆP PHÚ QUẬN 9</p>
                </div>
            </div>
        </div>
        <div class="container" style="width:95%">
            <div class="row">
                <!-- Top navigation -->
                <div class="topnav">
                    <!-- Left-aligned links (default) -->
                    <a href="#news">TỔNG QUAN</a>
                    <a href="#contact">TÀI KHOẢN</a>
                    <a href="#news">CƠ QUAN</a>
                    <a href="#contact">PHẦN MỀM</a>
                </div>


            </div>
            <!-- Setup 2000px for test amnition-->
            <div class="paper">
                <div class="controls-edit">
                    <button class="btn add ">THÊM <i class="fa fa-home"></i></button>
                    <button class="btn add ">CHỈNH SỬA <i class="fa fa-home"></i></button>
                </div>
                <div class="title">
                    <div class="col-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <div class="table-responsive">
                                <table class="table table-bordered table-upload table-User">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 20px">STT</th>
                                            <th scope="col">HỌ VÀ TÊN</th>
                                            <th scope="col" style="width: 140px">MÃ CÁN BỘ</th>
                                            <th scope="col" style="width: 180px">EMAIL</th>
                                            <th scope="col" style="width: 180px">SĐT</th>
                                            <th scope="col" style="width: 140px">CHỨC VỤ</th>
                                            <th scope="col" style="width: 140px">QUYỀN</th>
                                            <th scope="col" style="width: 140px">TRẠNG THÁI</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Phan Văn Phước Thịnh</td>
                                            <td>MST0001</td>
                                            <td>123@gmail.com</td>
                                            <td>0975339843</td>
                                            <td>Cán bộ hộ tịch</td>
                                            <td>Người dùng</td>
                                            <td> <button class="btn-state green"></button> Online</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Phan Văn Phước Thịnh</td>
                                            <td>MST0001</td>
                                            <td>123@gmail.com</td>
                                            <td>0975339843</td>
                                            <td>Cán bộ hộ tịch</td>
                                            <td>Người dùng</td>
                                            <td> <button class="btn-state green"></button> Online</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Phan Văn Phước Thịnh</td>
                                            <td>MST0001</td>
                                            <td>123@gmail.com</td>
                                            <td>0975339843</td>
                                            <td>Cán bộ hộ tịch</td>
                                            <td>Người dùng</td>
                                            <td> <button class="btn-state red"></button> Online</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div style="font-size: 15px">
                    <div class="titile">
                        <p>TÀI KHOẢN</p>
                    </div>

                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for=>Họ và Tên</label>
                                <input type="text" class="form-control" id="nam_hovaten" name="nam_hovaten" onblur="validateHoTen(nam_hovaten)">
                                <p class="error" id="error_nam_hovaten"></p>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="">Ngày sinh</label>
                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                <div class="bootstrap-iso">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar">
                                                    </i>
                                                </div>
                                                <input class="form-control" id="nam_ngaysinh" name="date" placeholder="Ngày/Tháng/Năm"
                                                    type="text" onBlur="validateNgaySinh(nam_ngaysinh)" onChange="validateNgaySinh(nam_ngaysinh)" />
                                                <input type="hidden" id="input_nam_ngaysinh" name="nam_ngaysinh" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <p class="error" id="error_nam_ngaysinh"></p>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="">MÃ CÁN BỘ</label>
                                <input type="text" class="form-control" id="nam_CMND" name="nam_CMND" onblur="validateCMND(nam_CMND)">
                                <p class="error" id="error_nam_CMND"></p>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="">Chức vụ</label>
                                <input type="text" class="form-control" id="nam_CMND" name="nam_CMND" onblur="validateCMND(nam_CMND)">
                                <p class="error" id="error_nam_CMND"></p>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="">Quyền sử dụng</label>
                                <input type="text" class="form-control" id="nam_CMND" name="nam_CMND" onblur="validateCMND(nam_CMND)">
                                <p class="error" id="error_nam_CMND"></p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="">Email</label>
                                <input type="text" class="form-control" id="nam_CMND" name="nam_CMND" onblur="validateCMND(nam_CMND)">
                                <p class="error" id="error_nam_CMND"></p>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="">SĐT</label>
                                <input type="text" class="form-control" id="nam_CMND" name="nam_CMND" onblur="validateCMND(nam_CMND)">
                                <p class="error" id="error_nam_CMND"></p>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="">Trạng thái sử dụng </label><br>
                                <label class="switch">
                                    <input type="checkbox" checked>
                                    <span class="slider round"></span>
                                </label>

                                <p class="error" id="error_nam_id_dantoc"></p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="">Tỉnh/TP</label>
                                <select class="form-control" id="nam_id_thanhpho" name="nam_id_thanhpho" onBlur="validateRequired(nam_id_thanhpho)">
                                    <option></option>
                                    <option>Test</option>
                                </select>
                                <p class="error" id="error_nam_id_thanhpho"></p>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="">Quận/Huyện</label>
                                <select class="form-control" id="nam_id_quan" name="nam_id_quan" onBlur="validateRequired(nam_id_quan)">
                                    <option></option>
                                    <option>Test</option>
                                </select>
                                <p class="error" id="error_nam_id_quan"></p>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="form-group">
                                <label for="">Xã/Phường</label>
                                <select class="form-control" id="nam_id_phuong" name="nam_id_phuong" onBlur="validateRequired(nam_id_phuong)">
                                    <option></option>
                                    <option>Test</option>
                                </select>
                                <p class="error" id="error_nam_id_phuong"></p>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="">Địa chỉ chi tiết</label>
                                <input type="text" class="form-control" id="nam_diachi" name="nam_diachi" onBlur="validateRequired(nam_diachi)">
                                <p class="error" id="error_nam_diachi"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="controls-edit">
            <button class="btn add">HỦY BỎ <i class="fa fa-home"></i></button>
            <button class="btn add " style="float: right; margin-right: 45px;" >LƯU <i class="fa fa-home"></i></button>
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

        $(document).ready(function () {
            var table = $('#example').DataTable();

            $('#example tbody').on('click', 'tr', function () {
                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            });

            $('#button').click(function () {
                table.row('.selected').remove().draw(false);
            });
        });

    </script>
</body>

</html>