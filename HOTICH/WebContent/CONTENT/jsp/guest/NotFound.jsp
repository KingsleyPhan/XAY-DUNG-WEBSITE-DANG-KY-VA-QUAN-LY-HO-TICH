<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <style>
        *, :before, :after {
  box-sizing: border-box;
}

body {
  display: flex;
  align-items: center;
  background: #E3F2FD;
  min-width: 275px;
  height: 100vh;
  margin: 0 10vw;
  overflow: hidden;
  color: #138FF2;
  font-family: Roboto;
}

.wrapper {
  flex-grow: 2;
  width: 40vw;
  max-width: 500px;
  margin: 0 auto;
}

h1 {
  margin: 0;
  font-size: 6em;
  font-weight: 100;
}

p {
  width: 95%;
  font-size: 1.5em;
  line-height: 1.4;
}

.buttons {
  white-space: nowrap;
  display: inline-block;
}

span {
  display: block;
  text-transform: uppercase;
  color: #B9DDFB;
  letter-spacing: 1.5px;
  text-align: center;
}
a {
  display: inline-block;
  padding: .8em 1em;
  margin-right: 1em;
  margin-bottom: 1em;
  border: 3px solid #B9DDFB;
  color: #138FF2;
  font-weight: 500;
  text-transform: uppercase;
  text-decoration: none;
  letter-spacing: .2em;
  position: relative;
  overflow: hidden;
  transition: .3s;
}
  a :hover {
    color: #E3F2FD;
  }
    a :before {
      top: 0;
    }
  a :before {
    content: '';
    background: #138FF2;
    height: 100%;
    width: 100%;
    position: absolute;
    top: -100%;
    left: 0;
    transition: .3s;
    z-index: -1;
  }



.space {
  width: 75px;
  height: calc(50vh + 75/2);
  border-top-left-radius: 75px/2;
  border-top-right-radius: 75px/2;
  overflow: hidden;
  margin: calc(50vh - 75/2) auto 0 auto;
  position: relative;
  pointer-events: none;
  -webkit-transform: translateZ(0);
}

.blackhole {
  border: 75px/15 solid #1674D1;
  height: 75px;
  width: 75px;
  border-radius: 50%;
  position: absolute;
  top: 0;
  left: 0;
}
.blackhole:after {
    content: '';
    height: calc(100% + 75px/15*2);
    width: calc(100% + 75px/15*2);
    border: 75px/15 solid #1674D1;
    border-right-color: transparent;
    border-bottom-color: transparent;
    border-radius: 50%;
    position: absolute;
    top: -75px/15;
    left: -75px/15;
    z-index: 5;
    transform: rotate(45deg);
  }


.ship {
  height: 75px*2;
  width: 75px - 75px/15*4;
  margin-left: 75px/15*2;
  background: url("https://cbwconline.com/IMG/Codepen/Space%20Ship.svg") center/contain no-repeat;
  animation: blackhole 4s infinite linear;
  position: absolute;
  bottom: -75px*2;
}

@keyframes blackhole {
  to {
    transform: translateY(-100vh);
  }
}

@media (max-width: 600px) {
  body {margin: 0 5vw}
}

.btn-back
{
    width: 150px;
    height: 40px;
    cursor: pointer;
    background-color: transparent;
    border: 2px solid #138FF2;
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12) !important;
    color:  #138FF2;
    font-size: 14px;
    font-weight: 600;
    
}
.btn-back:hover
{
    background-color: #138FF2;
    color: #E3F2FD;
}
    </style>
<div class="wrapper">
<h1>UHM..</h1> 
  <p> Truy cập không hợp lệ hoặc xảy ra lỗi.<br> Hãy thử lại sau!</p>
  
  <form action="DangNhap.php"> 
  <button class="btn-back" type="submit">
  Trở lại trang chủ
  
  </button>
  </form>
  
</div>
 
<div class="space"></div>
<div class="blackhole"></div>
 <div class="ship"></div>
</body>
</html>