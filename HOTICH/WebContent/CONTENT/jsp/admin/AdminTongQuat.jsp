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

    <link rel="stylesheet" type="text/css" href="CONTENT/styles/guest/HAF.css">
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/admin/admin.css">
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/admin/Admin_TongQuat.css">



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
            .padd-icon
            {
                margin-right: 10px;
            }
        </style>

        <div class="container " style="width:95%">
            <div class="row">
                <!-- Top navigation -->
                <div class="topnav menu-top">
                    <!-- Left-aligned links (default) -->
                    <form action="admin">
                     <button type="submit"  style=" background-color:rgb(243, 93, 33);"><i class="fa fa-list fa-lg padd-icon"></i>TỔNG QUAN</button>
                    </form>
                     <form action="taikhoannguoidung">
                     <button type="submit"  ><i class="fa fa-address-book-o fa-lg padd-icon"></i>TÀI KHOẢN NGƯỜI DÙNG</button>
                    </form>
                     <form action="ThietLapCoQuan">
                     <button type="submit" ><i class="fa fa-cogs fa-lg padd-icon"></i>THIẾT LẬP CƠ QUAN</button>
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
            <div class="paper" style="height:1000px; margin-top: 20px;">
                <div class="row">
                  
                    <div class="col-sm-9">
                        
                        </div>
                        <div class="col-sm-3 col-right" >

                            <div class="imfor-Table">
                                <div class="head-imfor">
                                    <p>THÔNG BÁO</p>
                                </div>
                                <div class="content-imfor"> 
                                        <marquee direction="up" scrollamount="3">> Hệ thống đang cập nhật phần mềm về các DÂN TỘC, QUỐC GIA, <br> > Nếu xảy ra lỗi vui lòng liên hệ đường dây nóng: 0909090909090 <br> Xin chân thành cảm ơn! <br> HOTICH.NET</marquee>
                                </div>
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

    <script src="CONTENT/js/guest/index.js"></script>
    <script src="CONTENT/js/guest/Header.js"></script>
 
</body>
</html>