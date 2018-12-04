<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DAO.Consts"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--content-->
    <link rel="stylesheet" type="text/css" href="page/styles/HAF.css">
    <link rel="stylesheet" type="text/css" href="page/styles/giayChungTu.css">
    <!--Library datetimepicker-->
    <!-- Extra JavaScript/CSS added manually in "Settings" tab -->
    <!-- Include jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
    <!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
    <script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

    <!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

    <!--Font Awesome (added because you use icons in your prepend/append)-->
    <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
    <!--header and footer-->
</head>
<body>
 <!-- Start Header-->
    <header id="id-header" class="header">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="logo-text">
                        <p id="id-logo-text">HOTICH.NET</p>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- End Header-->

    <!--Start Content-->
    <div id="id-content" class="content-switch">
        <div class="container">
            <div class="row">
                <div class="header_location">
                     <p id="bannerCoQuan" class="location"><%=Consts.LocationCap1%></p>
					<p id="CoQuanCap2" class="locationCap2"><%=Consts.LocationCap2%></p>
                </div>
            </div>


            <div class="row">
                <!-- Setup 2000px for test amnition-->
                <div class="paper">
                    <div class="title">
                        <p>TỜ KHAI ĐĂNG KÝ TRÍCH LỤC HỘ TỊCH</p>
                    </div>
                    <div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                                <div class="title-part">
                                    <div class="col-12 col-sm-6 col-md-6">
                                        <p style="font-size: 18px;font-weight: bold">THÔNG TIN NGƯỜI YÊU CẦU</p>
                                    </div>

                                </div>
                                <div class="content collapse in">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for=>Họ và Tên</label>
                                                <input type="text" class="form-control" id="HoTenYeuCau" onblur="validateHoTen(HoTenYeuCau)">
                                                <p class="error" id="error_HoTenYeuCau"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số CMND</label>
                                                <input type="text" class="form-control" id="CMNDYeuCau" onblur="validateCMND(CMNDYeuCau)">
                                                <p class="error" id="error_CMNDYeuCau"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Nơi cấp</label>
                                                <input type="text" class="form-control" id="NoiCapCMNDYeuCau" onblur="validateRequired(NoiCapCMNDYeuCau)">
                                                <p class="error" id="error_NoiCapCMNDYeuCau"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Ngày cấp</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="input-group">
                                                                <div class="input-group-addon">
                                                                    <i class="fa fa-calendar">
                                                                    </i>
                                                                </div>
                                                                <input class="form-control" id="NgayCapCMNDYeuCau"
                                                                    onblur="validateNgayCap(NgayCapCMNDYeuCau)" name="date"
                                                                    placeholder="Ngày/Tháng/Năm" type="text" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <p class="error" id="error_NgayCapCMNDYeuCau"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quan hệ với người được trích lục</label>
                                                <select class="form-control" id="NguoiYeuCau_QuanHe" onblur="validateRequired(NguoiYeuCau_QuanHe)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_QuanHe"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quan hệ khác </label>
                                                <input type="text" class="form-control" id="NguoiYeuCau_QuanHeKhac"
                                                    onblur="validateRequired(NguoiYeuCau_QuanHeKhac)">
                                                <p class="error" id="error_NguoiYeuCau_QuanHeKhac"></p>
                                            </div>
                                        </div>


                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quốc tịch </label>
                                                <select class="form-control" id="NguoiYeuCau_QuocTich" onblur="validateRequired(NguoiYeuCau_QuocTich)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_QuocTich"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP</label>
                                                <select class="form-control" id="NguoiYeuCau_Tinh" onblur="validateRequired(NguoiYeuCau_Tinh)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_Tinh"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện</label>
                                                <select class="form-control" id="NguoiYeuCau_Huyen" onblur="validateRequired(NguoiYeuCau_Huyen)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_Huyen"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường</label>
                                                <select class="form-control" id="NguoiYeuCau_Phuong" onblur="validateRequired(NguoiYeuCau_Phuong)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_Phuong"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="">Địa chỉ chi tiết</label>
                                                <input type="text" class="form-control" id="NguoiYeuCau_DiaChi" onblur="validateRequired(NguoiYeuCau_DiaChi)">
                                                <p class="error" id="error_NguoiYeuCau_DiaChi"></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                                <div class="title-part">
                                    <p>THÔNG TIN ĐƯỢC TRÍCH LỤC</p>
                                </div>
                                <div class="content ">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for=>Họ và Tên</label>
                                                <input type="text" class="form-control" id="TrichLuc_HoVaTen" onblur="validateHoTen(TrichLuc_HoVaTen)">
                                                <p class="error" id="error_TrichLuc_HoVaTen"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Giới tính</label><br>
                                                <div class="control-sex">
                                                    <input type="radio" name="gender" value="male" id="male" onblur="validateRadio(male, female)">
                                                    Nam
                                                    <input style="margin-left: 20px" type="radio" name="gender" id="female"
                                                        onblur="validateRadio(male, female)" value="female">Nữ
                                                </div>
                                                <p class="error" id="error_male"></p>
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
                                                                    <input class="form-control" id="TrichLuc_ngaySinh"
                                                                        onblur="validateNgayCap(TrichLuc_ngaySinh)" name="date"
                                                                        placeholder="Ngày/Tháng/Năm" type="text" />
                                                                        <input type="hidden" id="input_TrichLuc_ngaySinh" name="nam_ngaysinh"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <p class="error" id="error_TrichLuc_ngaySinh"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số CMND</label>
                                                <input type="text" class="form-control" id="TrichLuc_CMND" onblur="validateCMND(TrichLuc_CMND)">
                                            </div>
                                            <p class="error" id="error_TrichLuc_CMND"></p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Nơi cấp</label>
                                                <input type="text" class="form-control" id="TrichLuc_NoiCap" onblur="validateRequired(TrichLuc_NoiCap)">
                                                <p class="error" id="error_TrichLuc_NoiCap"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Ngày cấp</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="input-group">
                                                                    <div class="input-group-addon">
                                                                        <i class="fa fa-calendar">
                                                                        </i>
                                                                    </div>
                                                                    <input class="form-control" id="TrichLuc_NgayCapBaoTu"
                                                                        onblur="validateNgayCap(TrichLuc_NgayCapBaoTu)" name="date"
                                                                        placeholder="Ngày/Tháng/Năm" type="text" />
    
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <p class="error" id="error_TrichLuc_NgayCap"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Dân tộc</label>
                                                <select class="form-control" id="TrichLuc_danToc" onblur="validateRequired(TrichLuc_danToc)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_TrichLuc_danToc"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-8">
                                            <div class="form-group">
                                                <label for="">Quốc tịch </label>
                                                <select class="form-control" id="TrichLuc_quocTich" onblur="validateRequired(TrichLuc_quocTich)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_TrichLuc_quocTich"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP</label>
                                                <select class="form-control" id="TrichLuc_ThanhPho" onblur="validateRequired(TrichLuc_ThanhPho)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_TrichLuc_ThanhPho"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện</label>
                                                <select class="form-control" id="TrichLuc_Quan" onblur="validateRequired(TrichLuc_Quan)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_TrichLuc_Quan"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường</label>
                                                <select class="form-control" id="TrichLuc_Phuong" onblur="validateRequired(TrichLuc_Phuong)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_TrichLuc_Phuong"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="">Địa chỉ chi tiết</label>
                                                <input type="text" class="form-control" id="TrichLuc_DiaChi" onblur="validateRequired(TrichLuc_DiaChi)">
                                                <p class="error" id="error_TrichLuc_DiaChi"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-4">
                                            <div class="form-group">
                                                <label for="">Loại giấy tờ trích lục</label>
                                                <select class="form-control" id="TrichLuc_LoaiGiayTrichLuc" onblur="validateRequired(TrichLuc_LoaiGiayTrichLuc)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_TrichLuc_LoaiGiayTrichLuc"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số</label>
                                                <input type="text" class="form-control" id="TrichLuc_SoTrichLuc" onblur="validateRequired(TrichLuc_LoaiGiayTrichLuc)">
                                                <p class="error" id="error_TrichLuc_SoTrichLuc"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số quyển</label>
                                                    <input type="text" class="form-control" id="TrichLuc_SoQuyenTrichLuc" onblur="validateRequired(TrichLuc_SoQuyenTrichLuc)">
                                                <p class="error" id="error_TrichLuc_SoQuyenTrichLuc"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP đăng ký</label>
                                                <select class="form-control" id="TrichLuc_TPTrichLuc" onblur="validateRequired(TrichLuc_TPTrichLuc)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_TrichLuc_TPTrichLuc"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện đăng ký</label>
                                                <select class="form-control" id="TrichLuc_QuanTrichLuc" onblur="validateRequired(TrichLuc_QuanTrichLuc)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_TrichLuc_QuanTrichLuc"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường đăng ký</label>
                                                <select class="form-control" id="TrichLuc_PhuongTrichLuc" onblur="validateRequired(TrichLuc_PhuongTrichLuc)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_TrichLuc_PhuongTrichLuc"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="container container-paper">
                            <div class="content-checkbox">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label">Tôi cam đoan đề nghị đăng ký trên đây là đúng sự
                                        thật, được sự thỏa thuận và nhất trí của các bên liên quan theo quy định của
                                        pháp luật. </label>
                                    <label>Tôi hoàn toàn chịu trách nhiệm trước pháp luật về nội dung cam đoan của mình
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---End paper-->
                <div class="row">
                    <div class="control-navigation">
                        <button class="btn  btn-cancel">Hủy bỏ</button>
                        <a href="https://www.google.com.vn" class="btn  btn-continue" onClick="return validateSubmitTrichLuc()">Tiếp
                            tục</a>
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
    <script src="../plugins/scrollmagic/ScrollMagic.min.js"></script>
    <script src="../js/Header.js"></script>
    <script src="../js/valiedateForm.js"></script>
</body>
</html>