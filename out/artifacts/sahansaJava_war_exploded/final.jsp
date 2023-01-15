<%--
  Created by IntelliJ IDEA.
  User: nethu
  Date: 1/14/2023
  Time: 1:04 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<<html lang="zxx">>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <title>Suceessful</title>


  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">

  <!-- Css Styles -->
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="css/plyr.css" type="text/css">
  <link rel="stylesheet" href="css/style.css" type="text/css">
  <link rel="stylesheet" href="css/seatsel.css" type="text/css">
  <link rel="stylesheet" href="css/final.css" type="text/css">


</head>

<body>
<!-- Page Preloader -->
<div id="preloder">
  <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header-seat">
  <div class="container">
    <div class="row">
      <div class="col-lg-2">
        <div class="header__logo">
          <a href="./index.jsp">
            <img src="img/logo.png" alt="">
          </a>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="header__nav">
          <nav class="header__menu mobile-menu">
            <ul>
              <li class="active"><a href="./index.jsp">Homepage</a></li>


              <li><a href="#">Contacts</a></li>
            </ul>
          </nav>
        </div>
      </div>
      <div class="col-lg-2">
        <div class="header__right">
          <a href="#" class="search-switch"><span class="icon_search"></span></a>
          <a href="./index.jsp"><span class="icon_profile"></span></a>
        </div>
      </div>
    </div>
    <div id="mobile-menu-wrap"></div>
  </div>
</header>
<!-- Header End -->

<!-- Movie Title Begin-->
<div class="Movie-Title">Transaction Successful ! ! !</div>
<!-- Movie Title End-->


<div class="Final_Greating" id="FG">
  <img src="./img/popcorn.png" class="img_pop" alt="Popcorn.jpg">
  <p class="greetP">You have Successfully confirmed the purchase !.<br>You'll receive a confirmation email shortly.</p>

  <div class="change-mind" id="chngeMD">
    <span id="chnge_mindID">(Changed your mind ?)</span>
  </div>
</div>


<!-- Footer Section Begin -->
<footer class="footer-seat">
  <div class="page-up">
    <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
  </div>
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <div class="footer__logo">
          <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="footer__nav">
          <ul>
            <li class="active"><a href="./index.jsp">Homepage</a></li>


            <li><a href="#">Contacts</a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-3">
        <p>
          Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved |  <i class="fa fa-heart" aria-hidden="true"></i> by SNS Developers
        </p>

      </div>
    </div>
  </div>
</footer>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/player.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="js/seatsel.js"></script>
<script src="js/final.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</body>
</html>
