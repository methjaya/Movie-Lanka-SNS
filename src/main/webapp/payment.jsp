<%--
  Created by IntelliJ IDEA.
  User: nethu
  Date: 1/14/2023
  Time: 1:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.sahansajava.dbcon_booking" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.concurrent.ScheduledExecutorService" %>
<%@ page import="java.util.concurrent.ScheduledFuture" %>
<%@ page import="java.util.concurrent.Executors" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="java.io.IOException" %>

<html><!DOCTYPE html>
<<html lang="zxx">>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Payment</title>


    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/seatsel.css" type="text/css">
    <link rel="stylesheet" href="css/payment.css?v=1.1" type="text/css">


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

<!--invoice Payment Begin-->
<div class="invoice-wrapper">
    <div class="invoice-body">
        <div class="primary-details">
            <span>Date : </span>
            <span id="order-date">DD-MM-YYYY</span><br>
            <span>Invoice No : </span>
            <span id="ticket-no">00000000</span>
        </div>

        <form class="ticket-detail-form" action="payment" method="post" id="payment-form">
            <table class="ticket-detail-table" border="1">
                <tr>
                    <th>Ticket No.</th>
                    <th>Seat No.</th>
                    <th>Date and Time</th>
                    <th>Price</th>
                </tr>

                <%
                    //Get the Seat Numbers

                    String Selected_Date = (String) session.getAttribute("Date");
                    String Selected_Time = (String) session.getAttribute("Time");
                    String Selected_Theatre = (String) session.getAttribute("Name");
                    String Movie_Name = "Harry Potter And The Deathly Hallows: Part 1";

                    String Time_Date = String.format("2023-%s %s:00",Selected_Date,Selected_Time);
                    List<String> Seats = new ArrayList<>();

                    dbcon_booking objbooking = new dbcon_booking();


                    if(session.getAttribute("Seats") != null)
                    {
                        String Seat_String = session.getAttribute("Seats").toString();
                        Seats = Arrays.asList(Seat_String.split(","));
                    }else
                    {
                        out.print("Seats Session Lost - payment");
                    }

                    int n = 0;

                    for(String Seat : Seats)
                    {
                        n++;
                        out.print("<tr>");
                        out.print("<td>"+n+"</td>");
                        out.print("<td>"+Seat+"</td>");
                        out.print("<td>"+Time_Date+"</td>");
                        out.print("<td>350</td>");
                        out.print("</tr>");
                    }
                %>
            </table>


            <div class="invoice-description">
                <p>
                    I (<input class = "in" type="text" name="Fname" id="in-fname" placeholder="*First Name" required> , <input class = "in" type="text" name="Lname" id="in-lname" placeholder="*Last Name" required>, <input class = "in" type="text" name="NIC" id="in-nic" placeholder="*NIC" required>, <input class = "in" type="email" name="Email" id="in-email" placeholder="*Email" required>) herby confirm,<br><br>

                    <%
                        out.print("I order <span class=\"movie-dt\" id=\"mtotp\">"+n+"</span> tickets for the movie : <span class=\"movie-dt\" id=\"mname\">"+Movie_Name+"</span>, on Date and Time : <span class=\"movie-dt\" id=\"mdate\">"+Time_Date+"</span>, for the price of : Rs.<span class=\"movie-dt\" id=\"mprice\">"+(n * 350)+"</span>/= and\n" +
                                "                    I acknowledge all the Terms and Conditions of the movie theatre including, the dates cannot be changed or the tickets cannot be cancelled once the order is placed and will obey them till the end of the movie.<br><br>(Note :- Buy button will appear once all the input fields are filled !.)");
                    %>
                </p>
            </div>

            <input type="hidden" name="PStatus" id="PStatus" value="0">
            <input type="hidden" name="INvoize" id="invoice_num" value="0">

            <div id="paypal-button-container" class="ppdiv"></div>
        </form>
    </div>
</div>
<!--invoice Payment End-->

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
<script src="js/bootstrap.min.js"></script>
<script src="js/player.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="js/payment.js?v=1.1"></script>

<script src="https://www.paypal.com/sdk/js?client-id=AYIYLvmHGPyjg7520TCmTpuTYUUqkEXfk0hjhc0D-nvLVIUyAqEK2GSikEcH72lcUpEWqeTKrpApSveA&currency=USD&intent=capture&enable-funding=venmo" data-sdk-integration-source="integrationbuilder"></script>
<script src="js/paypal.js?v=2"></Script>
</body>
</html>
