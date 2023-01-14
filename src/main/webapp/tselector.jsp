<%--
  Created by IntelliJ IDEA.
  User: nethu
  Date: 1/14/2023
  Time: 1:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.concurrent.ConcurrentMap" %>
<%@ page import="java.util.concurrent.ConcurrentHashMap" %>
<%@ page import="com.example.sahansajava.dbcon_booking" %>

<!DOCTYPE html>
<<html lang="zxx">>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Time Selection</title>


    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/seatsel.css" type="text/css">
    <link rel="stylesheet" href="css/tseelctor.css" type="text/css">


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

<!-- Select Date Begin -->
<div class="date-select-bar">
    <%
        List<String> All_Available_Dates = new ArrayList<>();
        dbcon_booking objbooking = new dbcon_booking();
        String SDate = "2023-01-31";

        All_Available_Dates = objbooking.Load_Dates();

        int n = 0;
        for(String date : All_Available_Dates){
            n++;
            String[] date_split = date.split("-");
            String Formatted_date = date_split[1] + "-" +date_split[2];
            if(date.equals(SDate))
            {
                out.print("<span class=\"date-bx selected\">"+Formatted_date+"</span>");
            }
            else
            {
                out.print("<span class=\"date-bx\">"+Formatted_date+"</span>");
            }
        }
    %>
</div>
<!--Select Date End-->

<!--Time and Theatre Selector Begin-->
<div class="ttselector-wrapper">
    <div class="ttselector-body" id="time-cont">
        <%
            ConcurrentMap<String, List<String>> Theatre_Details = new ConcurrentHashMap<>();
            Theatre_Details =  objbooking.Load_Times(SDate);

            for (Map.Entry<String, List<String>> theatre : Theatre_Details.entrySet()) {
                String name = theatre.getKey();
                List<String> times = theatre.getValue();

                out.println("<div class=\"ttselector-theatre\">");
                out.println("<span class=\"T-name\">"+name+"</span>");
                out.println("<hr>");
                out.println("<div class=\"t-available-times\">");

                for(String time : times){
                    String[] t_split = time.split(":");
                    String Formatted_Time = t_split[0] + ":" + t_split[1];
                    out.println("<div class=\"time\">"+Formatted_Time+"</div>");
                }

                out.println("</div>");
                out.println("</div>");
            }
        %>
    </div>
</div>
<!--Time and Theatre Selector End-->

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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/player.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="js/tselector.js?v=2.3"></script>
</body>
</html>
