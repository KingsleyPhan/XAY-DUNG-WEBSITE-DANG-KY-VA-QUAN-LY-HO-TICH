<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HOTICH.NET</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src=" https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Include Date Range Picker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
    <!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
    <script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

    <!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
<link rel="stylesheet" type="text/css"
	href="CONTENT/styles/guest/HAF.css">
<link rel="stylesheet" type="text/css"
	href="CONTENT/styles/admin/admin.css">
<link rel="stylesheet" type="text/css"
	href="CONTENT/styles/admin/Admin_TongQuat.css">
	<link rel="stylesheet" type="text/css"
	href="CONTENT/styles/admin/TongQuanCoQuan.css">

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
                <div class="header_location" style="margin-top: 130px; margin-bottom: 20px">
                    <p id="bannerCoQuan" class="location">SỞ TƯ PHÁP THÀNH PHỐ HỒ CHÍ MINH</p>
                    <p id="CoQuanCap2" class="locationCap2">UBND PHƯỜNG HIỆP PHÚ QUẬN 9</p>
                </div>
            </div>
        </div>

        <style>
            .padd-icon {
                margin-right: 10px;
            }
        </style>

        <div class="container " style="width:95%">
            <div class="row">
                <!-- Top navigation -->
                 <div class="topnav menu-top">
                    <!-- Left-aligned links (default) -->
                    <form action="admin">
                     <button type="submit"  ><i class="fa fa-list fa-lg padd-icon"></i>TỔNG QUAN</button>
                    </form>
                     <form action="taikhoannguoidung">
                     <button type="submit"  ><i class="fa fa-address-book-o fa-lg padd-icon"></i>TÀI KHOẢN NGƯỜI DÙNG</button>
                    </form>
                     <form action="ThietLapCoQuan">
                     <button type="submit"  style=" background-color:rgb(243, 93, 33);"><i class="fa fa-cogs fa-lg padd-icon"></i>THIẾT LẬP CƠ QUAN</button>
                    </form>
                     <form action="">
                       <button type="submit" ><i class="fa fa-cubes  fa-lg padd-icon"></i>QUẢN LÝ PHẦN MỀM</button>
                    </form>
                     <form action="">
                     <button type="submit" ><i class="fa fa-info-circle fa-lg padd-icon" ></i>THÔNG TIN PHẦN MỀM</button>
                    </form>
                </div>
            </div>
            <!-- Setup 2000px for test amnition-->
            <div class="paper">
                <div class="row">

                    <div class="col-sm-12">
                        <div class="row">
                            <div class="titile" style="margin-top: 20px">
                                <p><i class="fa fa-list-alt" style="padding-right:10px"></i>THÔNG TIN CƠ BẢN CƠ QUAN
                                    CÔNG QUYỀN</p>
                            </div>
                            <div>
                                <table class="table table-striped table-bordered">
                                    <tbody>
                                    
                                        <tr>
                                            <td class="title-Coquan">Địa chỉ cơ quan</td>
                                            <td class="Content-Coquan">
                                            <form action="ThemDiaChiCoQuan">
                                  
                                                <div class="DiaChiCoquan">
                                                    <p>${DCCQ}</p>
                                                    <div class="form-group" style="display:none" id="Frm_diaChiCoQuan">
                                                        <input type="text" class="form-control" id="DiaChiCoQuan" name="DiaChiCoQuan"
                                                            onblur="validateRequired(DiaChiCoQuan)">
                                                        <p class="error" id="error_DiaChiCoQuan"></p>
                                                         <a class="btn-sav Huy-link" onclick="myFunctions()">Hủy</a>
                                                        <button style="float: right;" type="submit" id="buttonCancel" class="btn btn-sav "
                                                            onclick="return validateRequired(DiaChiCoQuan)">Lưu thay đổi</button>

                                                    </div>
                                                </div>
											 </form>
                                            </td>
                                            <td class="ThaoTac"><button class="btn-edit"  onclick="EditDiaChiCoQuan()"><i class="fa fa-edit" style="margin-right: 3px"></i>Chỉnh
                                                    sửa</button></td>
                                        </tr>
                                       
                                        <tr>
                                            <td class="title-Coquan">Số điện thoại</td>
                                            <td class="Content-Coquan">
                                             <form action="ThemSoDienThoaiCoQuan">
                                                <div class="SDTCoquan">
                                                    <p>${SDTCQ}</p>
                                                    <div class="form-group" style="display:none" id="Frm_SDTCoQuan">
                                                        <input type="text" class="form-control" id="SDTCoQuan" name="SDTCoQuan"
                                                            onblur="validateRequired(DiaChiCoQuan)">
                                                        <p class="error" id="error_SDTCoQuan"></p>
                                                        <a class="btn-sav Huy-link" onclick="myFunctions()">Hủy</a>
                                                        <button type="submit" style="float: right;" id="buttonCancel" class="btn btn-sav "
                                                            onclick="return  validateSDT(SDTCoQuan)">Lưu thay đổi</button>

                                                    </div>
                                                </div>
                                                </form>
                                            </td>
                                            <td class="ThaoTac"><button class="btn-edit" onclick="EditSDTCoQuan()"><i class="fa fa-edit" style="margin-right: 3px"></i>Chỉnh sửa</button></td>
                                        </tr>
                                        <tr>
                                            <td class="title-Coquan">E - mail</td>
                                            <td class="Content-Coquan">  <div class="EMAILCoquan">
                                                <form action="ThemEmailCoQuan">
                                                    <p>${EMAILCOQUAN}</p>
                                                    <div class="form-group" style="display:none" id="Frm_EMAILCoQuan">
                                                        <input type="text" class="form-control" id="EMAILCoQuan" name="EMAILCoQuan"
                                                            onblur="validateRequired(DiaChiCoQuan)">
                                                        <p class="error" id="error_EMAILCoQuan"></p>
                                                         <a class="btn-sav Huy-link" onclick="myFunctions()">Hủy</a>
                                                        <button type="submit" style="float: right;" id="buttonCancel" class="btn btn-sav "
                                                            onclick="return validateEmail(EMAILCoQuan)">Lưu thay đổi</button>

                                                    </div>
                                                    </form>
                                                </div>
                                                </td>
                                            <td class="ThaoTac"><button class="btn-edit" onclick="EditEmailCoQuan()"><i class="fa fa-edit" style="margin-right: 3px"></i>Chỉnh sửa</button></td>
                                        </tr>
                                        <tr>
                                            <td class="title-Coquan">Giới thiệu</td>
                                            <td class="Content-Coquan"> <form action="ThemGioiThieuCoQuan"> <div class="GioiThieuCoquan">
                                                    <p>${GioiThieuCoQuan}</p>
                                                    <div class="form-group" style="display:none" id="Frm_GioiThieuCoQuan">
                                                            <textarea class="form-control" id="GioiThieuCoQuan" name="GioiThieuCoQuan" rows="4" cols="50">
                                                                    </textarea>
                                                        <p class="error" id="error_GioiThieuCoQuan"></p>
                                                         <a class="btn-sav Huy-link" onclick="myFunctions()">Hủy</a>
                                                        <button  type="submit" style="float: right;" id="buttonCancel" class="btn btn-sav "
                                                            onclick="validateRequired(GioiThieuCoQuan)">Lưu thay đổi</button>

                                                    </div>
                                                </div></form></td>
                                            <td class="ThaoTac"><button class="btn-edit" onclick="EditGioiThieuCoQuan()"><i class="fa fa-edit" style="margin-right: 3px"></i>Chỉnh sửa</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="titile" style="margin-top: 20px">
                        <p><i class="fa fa-list-alt" style="padding-right:10px"></i>THÔNG TIN NGƯỜI TRƯỞNG CƠ QUAN</p>
                    </div>
                    <div>
                        <table class="table table-striped table-bordered">
                            <tbody>
                                <tr>
                                    <td class="title-Coquan">Họ và Tên</td>
                                    <td class="Content-Coquan"><form action="ThemTenChuTich">  <div class="TenTruong">
                                            <p>${TR_TEN}</p>
                                            <div class="form-group" style="display:none" id="Frm_TenTruong">
                                                <input type="text" class="form-control" id="TenTruong" name="TenTruong"
                                                    onblur="validateRequired(TenTruong)">
                                                <p class="error" id="error_TenTruong"></p>
                                                 <a class="btn-sav Huy-link" onclick="myFunctions()">Hủy</a>
                                                <button type="submit" style="float: right;" id="buttonCancel" class="btn btn-sav "
                                                    onclick="return validateRequired(TenTruong)">Lưu thay đổi</button>

                                            </div>
                                        </div></form></td>
                                    <td class="ThaoTac"><button class="btn-edit" onclick="EditTenTruong()"><i class="fa fa-edit" style="margin-right: 3px"></i>Chỉnh sửa</button></td>
                                </tr>
                                <tr>
                                    <td class="title-Coquan">SĐT</td>
                                    <td class="Content-Coquan"> <form action="ThemSoDienThoaiChuTich"> <div class="SDTTruong">
                                            <p>${TR_SDT}</p>
                                            <div class="form-group" style="display:none" id="Frm_SDTTruong">
                                                <input type="text" class="form-control" id="SDTTruong" name="SDTTruong"
                                                    onblur="validateRequired(SDTTruong)">
                                                <p class="error" id="error_SDTTruong"></p>
                                                 <a class="btn-sav Huy-link" onclick="myFunctions()">Hủy</a>
                                                <button type="submit" style="float: right;" id="buttonCancel" class="btn btn-sav "
                                                    onclick="return  validateSDT(SDTTruong)">Lưu thay đổi</button>

                                            </div>
                                        </div></form></td>
                                    <td class="ThaoTac"><button class="btn-edit"  onclick="EditSDTTruong()"><i class="fa fa-edit" style="margin-right: 3px"></i>Chỉnh sửa</button></td>
                                </tr>
                                <tr>
                                    <td class="title-Coquan">E-mail</td>
                                    <td class="Content-Coquan"> <form action="ThemEmailChuTich"> <div class="EmailTruong">
                                            <p>${TR_EMAIL}</p>
                                            <div class="form-group" style="display:none" id="Frm_EmailTruong">
                                                <input type="text" class="form-control" id="EmailTruong" name="EmailTruong"
                                                    onblur="validateRequired(EmailTruong)">
                                                <p class="error" id="error_EmailTruong"></p>
                                                 <a class="btn-sav Huy-link" onclick="myFunctions()">Hủy</a>
                                                <button type="submit" style="float: right;" id="buttonCancel" class="btn btn-sav "
                                                    onclick="return validateEmail(EmailTruong)">Lưu thay đổi</button>

                                            </div>
                                        </div></form></td>
                                    <td class="ThaoTac"><button class="btn-edit"  onclick="EditEmailTruong()"><i class="fa fa-edit" style="margin-right: 3px"></i>Chỉnh sửa</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="titile" style="margin-top: 20px">
                        <p><i class="fa fa-list-alt" style="padding-right:10px"></i>THÔNG TIN NGƯỜI PHÓ CƠ QUAN</p>
                    </div>
                    <div>
                            <table class="table table-striped table-bordered">
                                    <tbody>
                                        <tr>
                                            <td class="title-Coquan">Họ và Tên</td>
                                            <td class="Content-Coquan"><form action="ThemTenPhoChuTich"> <div class="TenPho">
                                                    <p>${PR_TEN}</p>
                                                    <div class="form-group" style="display:none" id="Frm_TenPho">
                                                        <input type="text" class="form-control" id="TenPho" name="TenPho"
                                                            onblur="validateRequired(TenPho)">
                                                        <p class="error" id="error_TenPho"></p>
                                                         <a class="btn-sav Huy-link" onclick="myFunctions()">Hủy</a>
                                                        <button type="submit" style="float: right;" id="buttonCancel" class="btn btn-sav "
                                                            onclick="return validateRequired(TenPho)">Lưu thay đổi</button>
        
                                                    </div>
                                                </div></form></td>
                                            <td class="ThaoTac"><button class="btn-edit" onclick="EditTenPho()"><i class="fa fa-edit" style="margin-right: 3px"></i>Chỉnh sửa</button></td>
                                        </tr>
                                        <tr>
                                            <td class="title-Coquan">SĐT</td>
                                            <td class="Content-Coquan">   <form action="ThemSoDienThoaiPhoChuTich"><div class="SDTPho">
                                                    <p>${PR_SDT}</p>
                                                    <div class="form-group" style="display:none" id="Frm_SDTPho">
                                                        <input type="text" class="form-control" id="SDTPho" name="SDTPho"
                                                            onblur="validateRequired(SDTPho)">
                                                        <p class="error" id="error_SDTPho"></p>
                                                         <a class="btn-sav Huy-link" onclick="myFunctions()">Hủy</a>
                                                        <button type="submit" style="float: right;" id="buttonCancel" class="btn btn-sav "
                                                            onclick="return  validateSDT(SDTPho)">Lưu thay đổi</button>
        
                                                    </div>
                                                </div></form></td>
                                            <td class="ThaoTac"><button class="btn-edit"  onclick="EditSDTPho()"><i class="fa fa-edit" style="margin-right: 3px"></i>Chỉnh sửa</button></td>
                                        </tr>
                                        <tr>
                                            <td class="title-Coquan">E-mail</td>
                                            <td class="Content-Coquan"> 
                                            <form action="ThemEmailPhoChuTich">
                                            <div class="EmailPho">
                                                    <p>${PR_EMAIL}</p>
                                                    <div class="form-group" style="display:none" id="Frm_EmailPho">
                                                        <input type="text" class="form-control" id="EmailPho" name="EmailPho"
                                                            onblur="validateRequired(EmailPho)">
                                                        <p class="error" id="error_EmailPho"></p>
                                                         <a class="btn-sav Huy-link" onclick="myFunctions()">Hủy</a>
                                                        <button type="submit" style="float: right;" id="buttonCancel" class="btn btn-sav "
                                                            onclick="return validateEmail(EmailPho)">Lưu thay đổi</button>
        
                                                    </div>
                                                </div></form></td>
                                            <td class="ThaoTac"><button class="btn-edit"  onclick="EditEmailPho()"><i class="fa fa-edit" style="margin-right: 3px"></i>Chỉnh sửa</button></td>
                                        </tr>
                                    </tbody>
                                </table>
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
        	<script src="CONTENT/js/guest/index.js"></script>
			<script src="CONTENT/js/guest/Header.js"></script>
			<script src="CONTENT/js/admin/AdminNguoIDung.js"></script>
			<script src="CONTENT/js/admin/Coquan.js"></script>
			<script src="CONTENT/js/guest/valiedateForm.js"></script>
			<script>
function myFunctions() {
    location.reload();
}
</script>
</body>
</html>