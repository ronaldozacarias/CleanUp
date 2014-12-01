<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="ie ie6 lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="ie ie7 lt-ie9 lt-ie8"        lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="ie ie8 lt-ie9"               lang="en"> <![endif]-->
<!--[if IE 9]>    <html class="ie ie9"                      lang="en"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-ie">
<!--<![endif]-->

<head>
   <!-- Meta-->
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
   <meta name="description" content="">
   <meta name="keywords" content="">
   <meta name="author" content="">
   <title>CleanUp - Encontrando diaristas de maneira inteligente.</title>
   
   <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
   <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->
   <!-- Bootstrap CSS-->
   
   <link href="<c:url value='/resources/assets/bootstrap/css/bootstrap.css'  />" rel="stylesheet"/>
   
   <!-- Vendor CSS-->
   <link href="<c:url value='/resources/assets/fontawesome/css/font-awesome.min.css'  />" rel="stylesheet"/>
   <link href="<c:url value='/resources/assets/animo/animate+animo.css'  />" rel="stylesheet"/>
   
   <!-- App CSS-->
   <link href="<c:url value='/resources/assets/css/app.css'  />" rel="stylesheet"/>
   <link href="<c:url value='/resources/assets/css/common.css'  />" rel="stylesheet"/>
   
   <!-- Modernizr JS Script-->
   <script src="<c:url value='/resources/assets/modernizr/modernizr.js' />" type="application/javascript"></script>
   
   <!-- FastClick for mobiles-->
   <script src="<c:url value='/resources/assets/fastclick/fastclick.js' />" type="application/javascript"></script>
   
   <link href="<c:url value='/resources/assets/css/landing.css'  />" rel="stylesheet"/>
</head>

<body>
   <!-- START wrapper-->
   <header>
      <div class="container">
         <nav class="row">
            <div class="col-md-2 app-logo">
               <a href="#" class="logo-wrapper">
                  <img src="<c:url value='/resources/assets/img/logo.png'  />" alt="App Name" class="img-responsive"/>
               </a>
            </div>
            <div class="col-md-10">
               <ul class="list-inline menuapp-buttons">
<!--                   <li class="mr-lg">                  	 -->
<!--                      <a href="#"> -->
<!--                         <strong>Demo</strong> -->
<!--                      </a> -->
<!--                   </li> -->
<!--                   <li class="mr-lg"> -->
<!--                      <a href="#"> -->
<!--                         <strong>Features</strong> -->
<!--                      </a> -->
<!--                   </li> -->
                  <li>
                  	 <a href="login">
	                  	 <button type="button" class="btn btn-labeled btn-default">Entrar
	                           <span class="btn-label btn-label-right tom-rigth"><i class="fa fa-sign-in"></i>
	                           </span>	                    
	                     </button>
                     </a>
                     
                  </li>
               </ul>
            </div>
         </nav>
         <div class="header-content">
            <div class="row row-flush row-table">
               <div class="col-xs-12 col-lg-6 align-middle">
                  <div data-toggle="play-animation" data-play="fadeInLeft" data-offset="0" class="app-presentation">
                     <img src="<c:url value='/resources/assets/img/landing/app-mobile.png'  />" alt="App Name" class="img-responsive"/>
                  </div>
               </div>
               <div class="col-xs-12 col-lg-6 align-middle">
                  <div class="side-presentation">
                     <div class="h1 header-title">Encontre o que procura</div>
                     <br>
                     <p class="header-subtitle">de maneira prática, cômoda e inteligente.</p>
                     <br>
<!--                      <div class="header-button"> -->
<!--                         <a href="#" class="btn btn-primary btn-lg btn-fw"> -->
<!--                            <strong>Discover Now</strong> -->
<!--                         </a> -->
<!--                      </div> -->
                     <br>
                     <br>
                     <p>Available on</p>
                     <ul class="list-inline store-list">
                        <li>
                           <a href="#">
                              <img src="<c:url value='/resources/assets/img/landing/store-apple.png'  />" alt="App Name" class="img-responsive"/>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <img src="<c:url value='/resources/assets/img/landing/store-google.png'  />" alt="App Name" class="img-responsive"/>
                           </a>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </header>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-lg-6">
               <h2 class="page-header">Multipurpose admin app</h2>
               <p>Find the perfect solution for most of your proyect. Get covered by the features that this app provides.</p>
               <p>Make
                  <strong>Wintermin</strong>the starpoint of your next web app.</p>
               <p>Try out the demo</p>
               <br>
               <p>
                  <a href="#" class="btn btn-success">
                     <strong>Start Demo Now</strong>
                  </a>
               </p>
            </div>
            <div data-toggle="play-animation" data-play="fadeInRight" data-offset="-250" class="col-lg-6">
               <img src="<c:url value='/resources/assets/img/landing/app-multi.png'  />" alt="App Name" class="img-responsive"/>
            </div>
         </div>
      </div>
   </section>
   <section class="bg-white">
      <div class="container">
         <div class="row">
            <div data-toggle="play-animation" data-play="fadeInLeft" data-offset="-250" class="col-lg-6">
               <img src="<c:url value='/resources/assets/img/landing/app-chart.png'  />" alt="App Name" class="img-responsive"/>
            </div>
            <div class="col-lg-6">
               <h2 class="page-header">Awesome Charts</h2>
               <p class="text-md">Present your app information in a simple and easy to understand way. Display any data set with Flot Charts.</p>
               <p>Wintermin includes Area Charts, Simple and Stacked Bar Charts, Line Charts and Pie and Donuts Charts.</p>
               <p>Customize the chart by simpli editing a PHP file or provide a json file on every request.</p>
            </div>
         </div>
      </div>
   </section>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-lg-6">
               <h2 class="page-header">Widgetized App</h2>
               <p>Wintermin comes with a full set of utility classes ready to create widgets for your app.</p>
               <p>Compress your user information in a single panel y customize the elements inside.</p>
               <p>All components are responsive and ready for mobile devices.</p>
               <br>
               <p>
                  <a href="#" class="btn btn-green">
                     <strong>Watch Now</strong>
                  </a>
               </p>
            </div>
            <div data-toggle="play-animation" data-play="fadeInRight" data-offset="-250" class="col-lg-6">
               <img src="<c:url value='/resources/assets/img/landing/app-widget.png'  />" alt="App Name" class="img-responsive"/>
            </div>
         </div>
      </div>
   </section>
   <section id="testimonial" class="bg-primary">
      <div class="container">
         <div id="carousel-testimonial" data-ride="carousel" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators">
               <li data-target="#carousel-testimonial" data-slide-to="0" class="active"></li>
               <li data-target="#carousel-testimonial" data-slide-to="1"></li>
               <li data-target="#carousel-testimonial" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
               <div class="item active">
                  <div class="row">
                     <div class="col-xs-8 col-xs-offset-2">
                        <h4>
                           <em>Etiam id nunc felis. Quisque quam turpis, viverra sit amet auctor laoreet, aliquam vitae neque. Integer sagittis ultricies neque vitae suscipit. Integer ut convallis dui. Praesent vel nisi nibh. Nunc lacinia, sem ac laoreet
                              egestas, risus lacus vulputate dui, quis pellentesque eros est id nisi.</em>
                        </h4>
                        <p>
                           <strong>- John Titor</strong>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="item">
                  <div class="row">
                     <div class="col-xs-8 col-xs-offset-2">
                        <h4>
                           <em>Etiam id nunc felis. Quisque quam turpis, viverra sit amet auctor laoreet, aliquam vitae neque. Integer sagittis ultricies neque vitae suscipit. Integer ut convallis dui. Praesent vel nisi nibh. Nunc lacinia, sem ac laoreet
                              egestas, risus lacus vulputate dui, quis pellentesque eros est id nisi.</em>
                        </h4>
                        <p>
                           <strong>- Mary Mayer</strong>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="item">
                  <div class="row">
                     <div class="col-xs-8 col-xs-offset-2">
                        <h4>
                           <em>Quisque non lacinia lacus. Pellentesque odio purus, egestas ac luctus gravida, rutrum ut quam. Quisque quam turpis, viverra sit amet auctor laoreet, aliquam vitae neque. Curabitur nec congue erat. Aliquam erat volutpat. Phasellus
                              ullamcorper rhoncus sagittis. Sed vestibulum quam ut arcu tempus sed placerat nibh venenatis.</em>
                        </h4>
                        <p>
                           <strong>- John Mayer</strong>
                        </p>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Controls -->
            <a href="#carousel-testimonial" data-slide="prev" class="left carousel-control">
               <em class="fa fa-chevron-circle-left"></em>
            </a>
            <a href="#carousel-testimonial" data-slide="next" class="right carousel-control">
               <em class="fa fa-chevron-circle-right"></em>
            </a>
         </div>
      </div>
   </section>
   <section id="clients" class="bg-white">
      <div class="container">
         <h2 class="section-header">Working with the best
            <br>
            <small class="text-muted text-center">Wintermin makes your life easier. The best choice for your next project.</small>
         </h2>
         <div class="row">
            <div class="col-lg-2 col-md-4 col-xs-6">
               <img src="<c:url value='/resources/assets/img/landing/clients/jquery.png'  />"  alt="client" class="img-responsive"/>
            </div>
            <div class="col-lg-2 col-md-4 col-xs-6">
               <img src="<c:url value='/resources/assets/img/landing/clients/node.png'  />"  alt="client" class="img-responsive"/>
            </div>
            <div class="col-lg-2 col-md-4 col-xs-6">
               <img src="<c:url value='/resources/assets/img/landing/clients/gulp.png'  />"  alt="client" class="img-responsive"/>
            </div>
            <div class="col-lg-2 col-md-4 col-xs-6">
               <img src="<c:url value='/resources/assets/img/landing/clients/jade.png'  />"  alt="client" class="img-responsive"/>
            </div>
            <div class="col-lg-2 col-md-4 col-xs-6">
               <img src="<c:url value='/resources/assets/img/landing/clients/less.png'  />"  alt="client" class="img-responsive"/>
            </div>
            <div class="col-lg-2 col-md-4 col-xs-6">
               <img src="<c:url value='/resources/assets/img/landing/clients/bootstrap.png'  />"  alt="client" class="img-responsive"/>
            </div>
         </div>
      </div>
   </section>
   <section class="bg-purple">
      <div class="container">
         <h2 data-toggle="play-animation" data-play="fadeInUp" data-offset="0" class="section-header">Tons of features
            <br>
            <small class="text-white text-center">Wintermin comes packed with tons of feature ready to use.</small>
         </h2>
         <div class="row">
            <div class="col-lg-3">
               <ul class="feature-list">
                  <li data-toggle="play-animation" data-play="fadeInUp" data-offset="0">
                     <h4>
                        <span class="point point-primary point-lg"></span>Data Tables</h4>
                     <p>Quisque luctus vehicula massa quis ultrices. Nunc et magna in metus pharetra ultricies ac sit amet justo.</p>
                  </li>
                  <li data-toggle="play-animation" data-play="fadeInUp" data-offset="0">
                     <h4>
                        <span class="point point-primary point-lg"></span>Form Validation</h4>
                     <p>Cras dolor ligula, laoreet ac vestibulum sed, molestie id odio. Donec convallis arcu sit amet tortor sagittis in convallis metus facilisis.</p>
                  </li>
                  <li data-toggle="play-animation" data-play="fadeInUp" data-offset="0">
                     <h4>
                        <span class="point point-primary point-lg"></span>Portlets</h4>
                     <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In ante nisi, mollis nec egestas eget, viverra in mi.</p>
                  </li>
                  <li data-toggle="play-animation" data-play="fadeInUp" data-offset="0">
                     <h4>
                        <span class="point point-primary point-lg"></span>Masonry Grid</h4>
                     <p>Quisque et nulla in tortor posuere accumsan eget non magna. Vestibulum a ipsum lectus, ac congue sapien.</p>
                  </li>
               </ul>
            </div>
            <div class="col-lg-6">
               <img src="<c:url value='/resources/assets/img/landing/iphone.png'  />"  alt="App Name" class="img-responsive center-block"/>
            </div>
            <div class="col-lg-3">
               <ul class="feature-list">
                  <li data-toggle="play-animation" data-play="fadeInUp" data-offset="0">
                     <h4>
                        <span class="point point-primary point-lg"></span>CSS3 Animations</h4>
                     <p>Quisque luctus vehicula massa quis ultrices. Nunc et magna in metus pharetra ultricies ac sit amet justo.</p>
                  </li>
                  <li data-toggle="play-animation" data-play="fadeInUp" data-offset="0">
                     <h4>
                        <span class="point point-primary point-lg"></span>Charts</h4>
                     <p>Cras dolor ligula, laoreet ac vestibulum sed, molestie id odio. Donec convallis arcu sit amet tortor sagittis in convallis metus facilisis.</p>
                  </li>
                  <li data-toggle="play-animation" data-play="fadeInUp" data-offset="0">
                     <h4>
                        <span class="point point-primary point-lg"></span>Google Maps</h4>
                     <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In ante nisi, mollis nec egestas eget, viverra in mi.</p>
                  </li>
                  <li data-toggle="play-animation" data-play="fadeInUp" data-offset="0">
                     <h4>
                        <span class="point point-primary point-lg"></span>Full Calendar</h4>
                     <p>Quisque et nulla in tortor posuere accumsan eget non magna. Vestibulum a ipsum lectus, ac congue sapien.</p>
                  </li>
               </ul>
            </div>
         </div>
      </div>
   </section>
   <section id="callout">
      <div data-toggle="play-animation" data-play="fadeInLeftBig" data-offset="-200" class="container text-center">
         <h1>Ready to start? Try this App today</h1>
         <h4>And see why people around the world choose this APP to create great cross-platform websites</h4>
         <ul class="list-inline store-list">
            <li>
               <a href="#">
                  <img src="<c:url value='/resources/assets/img/landing/store-apple.png'  />"  alt="App Name" class="img-responsive"/>
               </a>
            </li>
            <li>
               <a href="#">
                  <img src="<c:url value='/resources/assets/img/landing/store-google.png'  />"  alt="App Name" class="img-responsive"/>
               </a>
            </li>
         </ul>
         <p>
            <br>
            <a href="#" class="btn btn-primary btn-lg btn-oval btn-fw">
               <strong>Join Now!</strong>
            </a>
         </p>
      </div>
   </section>
   <footer class="footer-1 bg-inverse">
      <div class="container">
         <div class="row">
            <div class="col-sm-2 col-xs-6">
               <nav>
                  <h5>PRODUCT</h5>
                  <ul class="list-unstyled">
                     <li><a href="#">Documentation</a>
                     </li>
                     <li><a href="#">Customers</a>
                     </li>
                     <li><a href="#">Tour</a>
                     </li>
                     <li><a href="#">Pricing</a>
                     </li>
                  </ul>
               </nav>
            </div>
            <div class="col-sm-2 col-xs-6">
               <nav>
                  <h5>CONTACT</h5>
                  <ul class="list-unstyled">
                     <li><a href="#">Support</a>
                     </li>
                     <li><a href="#">Sales</a>
                     </li>
                     <li><a href="#">Forum</a>
                     </li>
                     <li><a href="#">Blog</a>
                     </li>
                  </ul>
               </nav>
            </div>
            <div class="col-sm-2 col-xs-6">
               <nav>
                  <h5>COMPANY</h5>
                  <ul class="list-unstyled">
                     <li><a href="#">About</a>
                     </li>
                     <li><a href="#">Press Kit</a>
                     </li>
                     <li><a href="#">Education</a>
                     </li>
                     <li><a href="#">Non-profits</a>
                     </li>
                  </ul>
               </nav>
            </div>
            <div class="col-sm-2 col-xs-6">
               <nav>
                  <h5>Say HI</h5>
                  <ul class="list-unstyled">
                     <li><a href="#">Twitter</a>
                     </li>
                     <li><a href="#">Facebook</a>
                     </li>
                     <li><a href="#">Google+</a>
                     </li>
                     <li><a href="#">Blog</a>
                     </li>
                  </ul>
               </nav>
            </div>
            <div class="col-lg-4 col-xs-12">
               <form action="#" method="post">
                  <h5>SUBSCRIBE TO OUR NEWSLETTER!</h5>
                  <div class="input-group">
                     <input type="email" name="email" placeholder="mail@example.com" required="" class="form-control">
                     <span class="input-group-btn">
                        <button type="submit" class="btn btn-info">Join</button>
                     </span>
                  </div>
                  <!--/input-group -->
               </form>
               <p class="text-muted">
                  <small>We will never send spam and you can unsubscribe any time</small>
               </p>
            </div>
         </div>
      </div>
   </footer>
   <footer class="footer-2">
      <div class="container">
         <div class="row">
            <div class="col-lg-4">
               <p>Copyright 2014 | <a href="#">Terms of Service </a>| <a href="#">Privacy Policy</a>
               </p>
            </div>
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
               <p>Crafted with
                  <em class="fa fa-heart text-danger fa-fw"></em>
                  <span>from BA, Argentina.</span>
               </p>
            </div>
         </div>
      </div>
   </footer>
   <!-- END wrapper-->
   <!-- START Scripts-->
   <!-- Main vendor Scripts-->
   <script src="<c:url value='/resources/assets/jquery/jquery.min.js' />" ></script>
   <script src="<c:url value='/resources/assets/bootstrap/js/bootstrap.min.js' />" ></script>
   
   <!-- Animo-->
   <script src="<c:url value='/resources/assets/animo/animo.min.js' />" ></script>
   
   <!-- Custom script for pages-->
   <script src="<c:url value='/resources/assets/js/pages.js' />" ></script>
   <!-- END Scripts-->
</body>

</html>