<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="home" value="/" scope="request" />
	<div class="sidebar">
    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    HOTICH.NET
                </a>
            </div>
            <ul class="nav">
	            <c:choose>
	            	<c:when test="${param.mode == 1 }">
	            		<li class="active">
		                    <a href="QuanLyDangKy">
		                        <i class="ti-write"></i>
		                        <p>ĐĂNG KÝ</p>
		                    </a>
		                </li>
	            	</c:when>
	            	<c:otherwise>
	            		<li>
		                    <a href="QuanLyDangKy">
		                        <i class="ti-write"></i>
		                        <p>ĐĂNG KÝ</p>
		                    </a>
		                </li>
	            	</c:otherwise>
	            </c:choose>
                
             	<c:choose>
	            	<c:when test="${param.mode == 2 }">
	            		<li class="active">
		                    <a href="QuanLyHoTich">
		                        <i class="ti-bookmark-alt"></i>
		                        <p>HỘ TỊCH</p>
		                    </a>
		                </li>
	            	</c:when>
	            	<c:otherwise>
	            		<li >
		                    <a href="QuanLyHoTich">
		                        <i class="ti-bookmark-alt"></i>
		                        <p>HỘ TỊCH</p>
		                    </a>
		                </li>
	            	</c:otherwise>
	            </c:choose>
                
                <c:choose>
	            	<c:when test="${param.mode == 3 }">
	            		<li class="active">
		                    <a href="ThongKe">
		                        <i class="ti-pie-chart"></i>
		                        <p>THỐNG KÊ</p>
		                    </a>
		                </li>
	            	</c:when>
	            	<c:otherwise>
	            		<li>
		                    <a href="ThongKe">
		                        <i class="ti-pie-chart"></i>
		                        <p>THỐNG KÊ</p>
		                    </a>
		                </li>
	            	</c:otherwise>
	            </c:choose>
                
                <li>
                    <a href="typography.html">
                        <i class="ti-user"></i>
                        <p>NGƯỜI DÙNG</p>
                    </a>
                </li>
                <li>
                    <a href="icons.html">
                        <i class="ti-pencil-alt2"></i>
                        <p>TRỢ GIÚP</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.html">
                        <i class="ti-bell"></i>
                        <p>THÔNG BÁO</p>
                    </a>
                </li>
				<li class="active-pro">
                    <a href="upgrade.html">
                        <i class="ti-export"></i>
                        <p>Upgrade to PRO</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>