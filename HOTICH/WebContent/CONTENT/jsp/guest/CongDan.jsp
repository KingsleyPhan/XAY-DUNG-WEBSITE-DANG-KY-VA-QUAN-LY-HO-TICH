<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	<%@page import="DAO.Consts" %>
<!DOCTYPE html>
<html>
<head>
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
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/guest/CongDan.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        </div>
    </div>
    <div class="parallax" style="height:350px; width: 100%; margin-top:20px">
        <div class="col-sm-3">

			<form action="CongDan/DangKyHoTich.php">
			 <button class="link-chucnang" type="submit" >
                <div class="chucnang">
                    <div class="titles">
                        <p>ĐĂNG KÝ HỘ TỊCH</p>
                    </div>
                    <p class="content-gioithieu"> Hệ thống dịch vụ công trực tuyến là hệ thống giao dịch
                        điện tử các thủ tục hành chính giữa Công dân/ Doanh nghiệp và các cơ quan nhà nước.</p>
                </div>
            </button>
			</form>
           
        </div>
        <div class="col-sm-3">
        <form action="CongDan/TraCuu.php">
         <button class="link-chucnang" type="submit" >
                <div class="chucnang">
                    <div class="titles">
                        <p>TRA CỨU HỒ SƠ</p>
                    </div>
                    <p class="content-gioithieu"> Hệ thống dịch vụ công trực tuyến là hệ thống giao dịch
                        điện tử các thủ tục hành chính giữa Công dân/ Doanh nghiệp và các cơ quan nhà nước.</p>
                </div>
            </button>
        </form>
           
        </div>
        <div class="col-sm-3">
           <button class="link-chucnang" type="submit" >
                <div class="chucnang">
                    <div class="titles">
                        <p>GIỚI THIỆU</p>
                    </div>
                    <p class="content-gioithieu"> Hệ thống dịch vụ công trực tuyến là hệ thống giao dịch
                        điện tử các thủ tục hành chính giữa Công dân/ Doanh nghiệp và các cơ quan nhà nước.</p>
                </div>
            </button>
        </div>
        <div class="col-sm-3">
             <button class="link-chucnang" type="submit" >
                <div class="chucnang">
                    <div class="titles">
                        <p>PHẢN HỒI</p>
                    </div>
                    <p class="content-gioithieu"> Hệ thống dịch vụ công trực tuyến là hệ thống giao dịch
                        điện tử các thủ tục hành chính giữa Công dân/ Doanh nghiệp và các cơ quan nhà nước.</p>

                </div>
            </button>
        </div>
    </div>
   
        <div class="container" style="padding-top: 20px; padding-bottom: -20px; margin-bottom: 0px;">
            <div class="row">
                <div class="col-sm-6">
                        <p class="content-gioithieus"> HỔ TRỢ TƯ VẤN THỦ TỤC ĐANG KÝ HỘ TỊCH</p> 
                        <p class="content-gioithieus" style="text-align: center"><i class="fa fa-phone"></i> 08963254658 </p>
                </div>
                <div class="col-sm-6">
                        <p class="content-gioithieus"> ĐỊA CHỈ TỌA LẠC CƠ QUAN</p> 
                        <p class="content-gioithieus" style="text-align: center">835/23 Đường Trương Văn Thành, Phường Hiệp Phú, Quận 9 </p>
                    </div>
            </div>
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