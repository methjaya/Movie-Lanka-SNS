<%--
  Created by IntelliJ IDEA.
  User: nethu
  Date: 1/2/2023
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="UTF-8">
  <meta name="description" content="Sahansa">
  <meta name="keywords" content="sahansa">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Sahansa</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">

  <!-- Css Styles -->
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="css/plyr.css" type="text/css">
  <link rel="stylesheet" href="css/style.css" type="text/css">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script>

    $(document).ready(function() {
      $.get("movie?mId='"+sessionStorage.getItem("id")+"'", function(responseJson) {

          // $("#dsp-p"+x.toString()).text(item);

      });
    });

  </script>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
  <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header">
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
              <li><a href="./categories.html">Categories <span class="arrow_carrot-down"></span></a>
                <ul class="dropdown">
                  <li><a href="./category1.html">Category 1</a></li>
                  <li><a href="./category2.html">Category 2</a></li>
                  <li><a href="./category3.html">Category 3</a></li>
                  <li><a href="./category4.html">Category 4</a></li>
                  <li><a href="./category5.html">Category 5</a></li>
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
          <a href="./login.html"><span class="icon_profile"></span></a>
        </div>
      </div>
    </div>
    <div id="mobile-menu-wrap"></div>
  </div>
</header>
<!-- Header End -->

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="breadcrumb__links">
          <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
          <a href="./categories.html">Categories</a>
          <a href="#">Fantasy</a>
          <span>Harry Potter And The Deathly Hallows: Part 1</span>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Breadcrumb End -->
<!-- Anime Section Begin -->
<section class="anime-details spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="anime__video__player">

          <iframe width="1080" height="600"
                  src="https://www.youtube.com/embed/fFGS4zZWGoA">
          </iframe>
          <!--  <video id="player" playsinline controls data-poster="./videos/poster.jpg">
              <source src="https://www.youtube.com/watch?v=VyHV0BRtdxo" type="video/mp4" />
              <!-- Captions are optional
              <track kind="captions" label="English captions" src="#" srclang="en" default />
            </video>-->
        </div>



        <!--    -->

        <!-- Anime Section Begin -->
        <section class="anime-details spad">
          <div class="container">
            <div class="anime__details__content">
              <div class="row">
                <div class="col-lg-9">
                  <div class="anime__details__text">
                    <div class="anime__details__title">
                      <h3>Harry Potter And The Deathly Hallows: Part 1</h3>
                    </div>
                    <div class="anime__details__rating">
                      <div class="rating">
                        <a href="#"><i class="fa fa-star"></i></a>
                        <a href="#"><i class="fa fa-star"></i></a>
                        <a href="#"><i class="fa fa-star"></i></a>
                        <a href="#"><i class="fa fa-star"></i></a>
                        <a href="#"><i class="fa fa-star-half-o"></i></a>
                      </div>

                    </div>
                    <p>After Voldemort takes over the Ministry of Magic, Harry, Ron and Hermione are forced into hiding.
                      They try to decipher the clues left to them by Dumbledore to find and destroy Voldemort's Horcruxes.</p>
                    <div class="anime__details__widget">
                      <div class="row">
                        <div class="col-lg-6 col-md-6">
                          <ul>

                            <li><span>Release Date:</span> 19 Nov, 2010</li>

                            <li><span>Genre:</span> Action, Adventure, Fantasy, Magic</li>
                          </ul>
                        </div>
                        <div class="col-lg-6 col-md-6">
                          <ul>

                            <li><span>Rating:</span> 8.5 / 161 times</li>
                            <li><span>Duration:</span> 2h 26m</li>

                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="anime__details__btn">

                      <a href="/booktickets.html" class="watch-btn"><span>Book Tickets</span> <i
                              class="fa fa-angle-right"></i></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>




            <div class="row">
              <div class="col-lg-8 col-md-8">
                <div class="anime__details__review">
                  <div class="section-title">
                    <h5>Reviews</h5>
                  </div>
                  <div class="anime__review__item">
                    <div class="anime__review__item__pic">
                      <img src="img/anime/review-1.jpg" alt="">
                    </div>
                    <div class="anime__review__item__text">
                      <h6>BEing Meth- <span>1 Hour ago</span></h6>
                      <p>Patta oi meka !!</p>
                    </div>
                  </div>

                </div>
                <div class="anime__details__form">
                  <div class="section-title">
                    <h5>Your Comment</h5>
                  </div>
                  <form action="#">
                    <textarea placeholder="Your Comment"></textarea>
                    <button type="submit"><i class="fa fa-location-arrow"></i> Review</button>
                  </form>
                </div>
              </div>

            </div>
          </div>
        </section>
        <!-- Anime Section End -->


        <!-- Footer Section Begin -->
        <footer class="footer">
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
                    <li><a href="./categories.html">Categories</a></li>

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

        <!-- Search model Begin -->
        <div class="search-model">
          <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch"><i class="icon_close"></i></div>
            <form class="search-model-form">
              <input type="text" id="search-input" placeholder="Search here.....">
            </form>
          </div>
        </div>
        <!-- Search model end -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/player.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>

</body>

</html>