<%--
  Created by IntelliJ IDEA.
  User: nethu
  Date: 1/2/2023
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.sahansajava.dbcon_booking" %>
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
  <link rel="stylesheet" href="css/seatsel.css?v=1.9" type="text/css">


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
            <img src="img/logo2.png" alt="">
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
      <div class="key-seat empty" id="seat-available"></div>
      <div class="key-text">Available</div>
    </div>

    <div class="key-piece row">
      <div class="key-seat unavailable" id="seat-unavailable"></div>
      <div class="key-text">Un-available</div>
    </div>

    <div class="key-piece row">
      <div class="key-seat occupied" id="seat-occupied"></div>
      <div class="key-text">Occupied</div>
    </div>

    <div class="key-piece row">
      <div class="key-seat selected" id="seat-selected"></div>
      <div class="key-text">Selected</div>
    </div>
  </div>
</div>
<!--Keys End -->

<!-- Seat-Selector Begin-->
<div class="Theater-layout">
  <%
    String Selected_Date = (String) session.getAttribute("Date");
    String Selected_Time = (String) session.getAttribute("Time");
    String Selected_Theatre = (String) session.getAttribute("Name");
    String Movie_Name = "Harry Potter And The Deathly Hallows: Part 1";

    String Time_Date = String.format("2023-%s %s:00",Selected_Date,Selected_Time);

    dbcon_booking objbooking =  new dbcon_booking();

    Map<String, String> Seat_Layout = new HashMap<>();
    Map<String, String> Seat_Stats = new HashMap<>();

    Seat_Layout = objbooking.Load_Theatre_Layout(Selected_Theatre);
    Seat_Stats = objbooking.Set_SeatStatus(Selected_Theatre,Movie_Name,Time_Date);

    int Total_Seats = Integer.parseInt(Seat_Layout.get("Seats"));
    int Seats_Per_Row = Integer.parseInt(Seat_Layout.get("prow"));
    int Divider = Integer.parseInt(Seat_Layout.get("Divide"));

    for(int n = 1; n <= (Total_Seats / Seats_Per_Row); n++)
    {
      char Row_Letter = (char)(n + 'A' - 1);
      out.print("<div class=\"row\">");

      for(int m =1; m<= Seats_Per_Row; m++)
      {
        String Seat_N = String.format("%s%d",Row_Letter,m);

        if(Seat_Stats.containsKey(Seat_N))
        {
          if(Integer.parseInt(Seat_Stats.get(Seat_N)) == 0)
          {
            out.print("<div class=\"seat unavailable\">"+Row_Letter+m+"</div>");
          }
          else
          {
            out.print("<div class=\"seat occupied\">"+Row_Letter+m+"</div>");
          }
        }
        else
        {
          out.print("<div class=\"seat\">"+Row_Letter+m+"</div>");
        }
      }
      out.print("</div>");
    }
  %>

  <div class="screen">All Eyes This Way Please !</div>
</div>
<!-- Seat-Selector End-->

<!-- Buy Begin -->
<div class="buy-cont">
  <form action="booking" method="POST" id="buyfrm">
    <span class="buytxt">Tickets : </span>
    <span class="ticket-count buytxt" id="tc">0</span>

    <span class="buytxt">Total Price : </span>
    <span class="total-price buytxt" id="tp">0</span>
    <input type="button" value="Proceed" name="buy-btn" class="buybtn" id="bbtn">
  </form>
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
          <a href="./index.jsp"><img src="img/logo2.png" alt=""></a>
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
          Copyright &copy;<script>document.write(new Date().getFullYear().toString());</script> All rights reserved |  <i class="fa fa-heart" aria-hidden="true"></i> by SNS Developers
        </p>

      </div>
    </div>
  </div>
</footer>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/player.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="js/seatsel.js?v=1.8"></script>
</body>
</html>