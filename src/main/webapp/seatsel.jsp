<%--
  Created by IntelliJ IDEA.
  User: nethu
  Date: 1/2/2023
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<<html lang="zxx">>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <title>Seat Selection</title>


  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">

  <!-- Css Styles -->
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="css/plyr.css" type="text/css">
  <link rel="stylesheet" href="css/style.css" type="text/css">
  <link rel="stylesheet" href="css/seatsel.css" type="text/css">


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
              <li><a href="./index.jsp">Categories <span class="arrow_carrot-down"></span></a>
                <ul class="dropdown">
                  <li><a href="./index.jsp">Category 1</a></li>
                  <li><a href="./index.jsp">Category 2</a></li>
                  <li><a href="./index.jsp">Category 3</a></li>
                  <li><a href="./index.jsp">Category 4</a></li>
                  <li><a href="./index.jsp">Category 5</a></li>
                </ul>
              </li>

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
<div class="Movie-Title" id="mt">Error ! ! !</div>
<!-- Movie Title End-->

<!--Keys Begin -->
<div class="seat-keys">
  <div class="row display">
    <div class="key-piece row">
      <div class="key-seat empty"></div>
      <div class="key-text">Available</div>
    </div>

    <div class="key-piece row">\
      <div class="key-seat occupied"></div>
      <div class="key-text">Occupied</div>
    </div>

    <div class="key-piece row">\
      <div class="key-seat selected"></div>
      <div class="key-text">Selected</div>
    </div>
  </div>
</div>
<!--Keys End -->

<!-- Seat-Selector Begin-->
<div class="Theater-layout">
  <div class="row">
    <div class="seat">J1</div>
    <div class="seat">J2</div>
    <div class="seat">J3</div>
    <div class="seat">J4</div>
    <div class="seat">J5</div>
    <div class="seat">J6</div>
    <div class="seat">J7</div>
    <div class="seat">J8</div>
    <div class="seat">J9</div>
    <div class="seat">J10</div>
    <div class="seat">J11</div>
    <div class="seat">J12</div>
    <div class="seat">J13</div>
    <div class="seat">J14</div>
    <div class="seat">J15</div>
    <div class="seat">J16</div>
  </div>

  <div class="row">
    <div class="seat">I1</div>
    <div class="seat">I2</div>
    <div class="seat">I3</div>
    <div class="seat">I4</div>
    <div class="seat">I5</div>
    <div class="seat">I6</div>
    <div class="seat">I7</div>
    <div class="seat">I8</div>
    <div class="seat">I9</div>
    <div class="seat">I10</div>
    <div class="seat">I11</div>
    <div class="seat">I12</div>
    <div class="seat">I13</div>
    <div class="seat">I14</div>
    <div class="seat">I15</div>
    <div class="seat">I16</div>
  </div>

  <div class="row">
    <div class="seat">H1</div>
    <div class="seat">H2</div>
    <div class="seat">H3</div>
    <div class="seat">H4</div>
    <div class="seat">H5</div>
    <div class="seat">H6</div>
    <div class="seat">H7</div>
    <div class="seat">H8</div>
    <div class="seat">H9</div>
    <div class="seat">H10</div>
    <div class="seat">H11</div>
    <div class="seat">H12</div>
    <div class="seat">H13</div>
    <div class="seat">H14</div>
    <div class="seat">H15</div>
    <div class="seat">H16</div>
  </div>

  <div class="row">
    <div class="seat">G1</div>
    <div class="seat">G2</div>
    <div class="seat">G3</div>
    <div class="seat">G4</div>
    <div class="seat">G5</div>
    <div class="seat">G6</div>
    <div class="seat">G7</div>
    <div class="seat">G8</div>
    <div class="seat">G9</div>
    <div class="seat">G10</div>
    <div class="seat">G11</div>
    <div class="seat">G12</div>
    <div class="seat">G13</div>
    <div class="seat">G14</div>
    <div class="seat">G15</div>
    <div class="seat">G16</div>
  </div>

  <div class="row">
    <div class="seat">E1</div>
    <div class="seat">E2</div>
    <div class="seat">E3</div>
    <div class="seat">E4</div>
    <div class="seat">E5</div>
    <div class="seat">E6</div>
    <div class="seat">E7</div>
    <div class="seat">E8</div>
    <div class="seat">E9</div>
    <div class="seat">E10</div>
    <div class="seat">E11</div>
    <div class="seat">E12</div>
    <div class="seat">E13</div>
    <div class="seat">E14</div>
    <div class="seat">E15</div>
    <div class="seat">E16</div>
  </div>

  <div class="row">
    <div class="seat">D1</div>
    <div class="seat">D2</div>
    <div class="seat">D3</div>
    <div class="seat">D4</div>
    <div class="seat">D5</div>
    <div class="seat">D6</div>
    <div class="seat">D7</div>
    <div class="seat">D8</div>
    <div class="seat">D9</div>
    <div class="seat">D10</div>
    <div class="seat">D11</div>
    <div class="seat">D12</div>
    <div class="seat">D13</div>
    <div class="seat">D14</div>
    <div class="seat">D15</div>
    <div class="seat">D16</div>
  </div>

  <div class="row">
    <div class="seat">C1</div>
    <div class="seat">C2</div>
    <div class="seat">C3</div>
    <div class="seat">C4</div>
    <div class="seat">C5</div>
    <div class="seat">C6</div>
    <div class="seat">C7</div>
    <div class="seat">C8</div>
    <div class="seat">C9</div>
    <div class="seat">C10</div>
    <div class="seat">C11</div>
    <div class="seat">C12</div>
    <div class="seat">C13</div>
    <div class="seat">C14</div>
    <div class="seat">C15</div>
    <div class="seat">C16</div>
  </div>

  <div class="row">
    <div class="seat">B1</div>
    <div class="seat">B2</div>
    <div class="seat">B3</div>
    <div class="seat">B4</div>
    <div class="seat">B5</div>
    <div class="seat">B6</div>
    <div class="seat">B7</div>
    <div class="seat">B8</div>
    <div class="seat">B9</div>
    <div class="seat">B10</div>
    <div class="seat">B11</div>
    <div class="seat">B12</div>
    <div class="seat">B13</div>
    <div class="seat">B14</div>
    <div class="seat">B15</div>
    <div class="seat">B16</div>
  </div>

  <div class="row">
    <div class="seat">A1</div>
    <div class="seat">A2</div>
    <div class="seat">A3</div>
    <div class="seat">A4</div>
    <div class="seat">A5</div>
    <div class="seat">A6</div>
    <div class="seat">A7</div>
    <div class="seat">A8</div>
    <div class="seat">A9</div>
    <div class="seat">A10</div>
    <div class="seat">A11</div>
    <div class="seat">A12</div>
    <div class="seat">A13</div>
    <div class="seat">A14</div>
    <div class="seat">A15</div>
    <div class="seat">A16</div>
  </div>
  <div class="screen">All Eyes This Way Please !</div>
</div>
<!-- Seat-Selector End-->

<!-- Buy Begin -->
<div class="buy-cont">
  <span class="buytxt">Tickets : </span>
  <span class="ticket-count buytxt" id="tc">0</span>

  <span class="buytxt">Total Price : </span>
  <span class="total-price buytxt" id="tp">0</span>

  <input type="button" value="Proceed" name="buy-btn" class="buybtn" id="bbtn">
</div>
<!-- Buy End-->

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
            <li><a href="./index.jsp">Categories</a></li>

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
</body>
</html>