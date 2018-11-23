<%@ page language="java" contentType="text/html; charset=UTF8"
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
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />

    <!--content-->
    <link rel="stylesheet" type="text/css" href="../../CONTENT/styles/HAF.css">
    <link rel="stylesheet" type="text/css" href="../../CONTENT/styles/view.css">
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
                <div class="col-12 col-sm-12 col-md-12">
                    <div class="header_location">
                        <p id="bannerCoQuan" class="location">SỞ TƯ PHÁP THÀNH PHỐ HỒ CHÍ MINH</p>
                        <p id="CoQuanCap2" class="locationCap2">UBND PHƯỜNG HIỆP PHÚ QUẬN 9</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="part-content">
                    <div class="title-part">
                        <div class="col-12 col-sm-12 col-md-12">
                            <p style="font-size: 18px;font-weight: bold">NỘI DUNG ĐĂNG KÝ HỘ TỊCH ONLINE</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row ">
                <!-- Setup 2000px for test amnition-->
                <!--conntent continute-->
                <div class="container">

                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="item-paper">
                                <div class="item-body">
                                    <h3 class="item-title"><a href="course.html">KHAI SINH</a></h3>
                                    <div class="img-icon">
                                        <img src="../../CONTENT/image/baby.png" width="100%">
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 ctrls-item">
                                            <form action="../../DangKyKhaiSinh.php">
                                                <button type="submit" class="item-control">ĐĂNG KÝ MỚI</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="item-paper">
                                <div class="item-body">
                                    <h3 class="item-title"><a href="course.html">KẾT HÔN</a></h3>
                                    <div class="img-icon">
                                        <img src="../../CONTENT/image/kethon.png" width="100%">
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 ctrls-item">
                                            <form action="../../DangKyKetHon.php">
                                                <button type="submit" class="item-control">ĐĂNG KÝ MỚI</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="item-paper">
                                <div class="item-body">
                                    <h3 class="item-title"><a href="course.html">KHAI TỬ</a></h3>
                                    <div class="img-icon">
                                        <img src="../../CONTENT/image/chungtu.jpg" width="100%">
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 ctrls-item">
                                            <form action="ChungTu.jsp">
                                                <button type="submit" class="item-control">ĐĂNG KÝ MỚI</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="item-paper">
                                <div class="item-body">
                                    <h3 class="item-title"><a href="course.html">TRÍCH LỤC HỘ TỊCH</a></h3>
                                    <div class="img-icon">
                                        <img src="../../CONTENT/image/trichluc.png" width="100%">
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12ctrls-item">
                                            <form action="trichluc.jsp">
                                                <button type="submit" class="item-control">ĐĂNG KÝ</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
    <script src="../../CONTENT/plugins/scrollmagic/ScrollMagic.min.js"></script>
    <script src="../../CONTENT/js/Header.js"></script>
</body>
</html>