<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-----start-container----->
<!-----header-section------>
<div class="header-section">
	<!----- start-header---->
	<div id="home" class="header">
		<div class="container">
			<div class="top-header">
				<div class="logo">
					<a href="#"><img src="<c:url value='/resources/img/logo.png'  />" title="logo"/></a>
				</div>
				<!----start-top-nav---->
				<nav class="top-nav">
					<ul class="top-nav">
						<li class="active"><a href="#home" class="scroll">Home </a></li>
						<li class="page-scroll"><a href="#fea" class="scroll">FEATURES</a></li>
						<li class="page-scroll"><a href="#gallery" class="scroll">Gallery</a></li>
						<li class="page-scroll"><a href="#about" class="scroll">About</a></li>
						<li class="page-scroll"><a href="login" class="scroll">Login</a></li>
						<li class="contatct-active" class="page-scroll"><a
							href="#contact" class="scroll">Contact</a></li>
					</ul>
					<a href="#" id="pull">
						<img src="<c:url value='/resources/img/nav-icon.png'  />" title="menu"/>
					</a>
				</nav>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!----- //End-header---->
	<!----- start-slider---->
	<!----start-slider-script---->
	<script src="<c:url value='/resources/js/responsiveslides.min.js' />"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function() {
			// Slideshow 4
			$("#slider4").responsiveSlides({
				auto : true,
				pager : true,
				nav : true,
				speed : 500,
				namespace : "callbacks",
				before : function() {
					$('.events').append("<li>before event fired.</li>");
				},
				after : function() {
					$('.events').append("<li>after event fired.</li>");
				}
			});

		});
	</script>
	<!--//End-slider-script-->
	<!-- Slideshow 4 -->
	<div id="top" class="callbacks_container">
		<ul class="rslides" id="slider4">
			<li>
			<img src="<c:url value='/resources/img/slide.jpg'  />" alt=""/>
				<div class="caption text-center">
					<div class="slide-text-info">
						<h1>
							Introducing <span>Umbrella.</span>
						</h1>
						<h2>Made to modify and use anywhere</h2>
						<div class="slide-text">
							<ul>
								<li><span> </span>Sed ut perspiciatis unde omnis</li>
								<li><span> </span>Iste natus error sit voluptatem
									accusantium</li>
								<li><span> </span>doloremque laudantium</li>
							</ul>
						</div>
						<div class="clearfix"></div>
						<div class="big-btns">
							<a class="download" href="#"><label> </label>Download</a> <a
								class="view" href="#"><label> </label>Vew Gallery</a>
						</div>
					</div>
				</div></li>
			<li>
			<img src="<c:url value='/resources/img/slide.jpg'  />" alt=""/>
				<div class="caption text-center">
					<div class="slide-text-info">
						<h1>
							Introducing <span>Amazing app.</span>
						</h1>
						<h2>Made to modify and use anywhere</h2>
						<div class="slide-text">
							<ul>
								<li><span> </span>Sed ut perspiciatis unde omnis</li>
								<li><span> </span>Iste natus error sit voluptatem
									accusantium</li>
								<li><span> </span>doloremque laudantium</li>
							</ul>
						</div>
						<div class="clearfix"></div>
						<div class="big-btns">
							<a class="download" href="#"><label> </label>Download</a> <a
								class="view" href="#"><label> </label>Vew Gallery</a>
						</div>
					</div>
				</div></li>
			<li>
			<img src="<c:url value='/resources/img/slide.jpg'  />" alt=""/>
				<div class="caption text-center">
					<div class="slide-text-info">
						<h1>
							Introducing <span>Best app.</span>
						</h1>
						<h2>Made to modify and use anywhere</h2>
						<div class="slide-text">
							<ul>
								<li><span> </span>Sed ut perspiciatis unde omnis</li>
								<li><span> </span>Iste natus error sit voluptatem
									accusantium</li>
								<li><span> </span>doloremque laudantium</li>
							</ul>
						</div>
						<div class="clearfix"></div>
						<div class="big-btns">
							<a class="download" href="#"><label> </label>Download</a> <a
								class="view" href="#"><label> </label>Vew Gallery</a>
						</div>
					</div>
				</div></li>
			<li>
			<img src="<c:url value='/resources/img/slide.jpg'  />" alt=""/>
				<div class="caption text-center">
					<div class="slide-text-info">
						<h1>
							Introducing <span>Amazing app.</span>
						</h1>
						<h2>Made to modify and use anywhere</h2>
						<div class="slide-text">
							<ul>
								<li><span> </span>Sed ut perspiciatis unde omnis</li>
								<li><span> </span>Iste natus error sit voluptatem
									accusantium</li>
								<li><span> </span>doloremque laudantium</li>
							</ul>
						</div>
						<div class="clearfix"></div>
						<div class="big-btns">
							<a class="download" href="#"><label> </label>Download</a> <a
								class="view" href="#"><label> </label>Vew Gallery</a>
						</div>
					</div>
				</div></li>
		</ul>
	</div>
	<div class="clearfix"></div>
	<!--divice-->
	<div class="divice-demo">
		<img src="<c:url value='/resources/img/divice-in-hand.png'  />" title="demo"/>
	</div>
	<!--//divice-->
	<!-- //End-slider-->
</div>
<!--//header-section-->
<!--features-->
<div id="fea" class="features">
	<div class="container">
		<div class="section-head text-center">
			<h3>
				<span class="frist"> </span>AMAZING FEATURES<span class="second">
				</span>
			</h3>
			<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem
				accusantium doloremque laudantium, totam rem aperiam, eaque ipsa
				quae ab illo inventore veritatis et quasi architecto beatae vitae
				dicta.</p>
		</div>
		<!--features-grids-->
		<div class="features-grids">
			<div class="col-md-4 features-grid">
				<div class="features-grid-info">
					<div class="col-md-2 features-icon">
						<span class="f-icon0"> </span>
					</div>
					<div class="col-md-10 features-info">
						<h4>Accusan timar</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="features-grid-info">
					<div class="col-md-2 features-icon">
						<span class="f-icon1"> </span>
					</div>
					<div class="col-md-10 features-info">
						<h4>Accusan timar</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="features-grid-info">
					<div class="col-md-2 features-icon">
						<span class="f-icon2"> </span>
					</div>
					<div class="col-md-10 features-info">
						<h4>Accusan timar</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium.</p>
					</div>
					<div class="clearfix"></div>
				</div>

			</div>
			<!---end-features-grid-->
			<div class="col-md-4 features-grid">
				<div class="big-divice">
					<img src="<c:url value='/resources/img/divice.png'  />" title="features-demo"/>
				</div>
			</div>
			<!---end-features-grid-->
			<div class="col-md-4 features-grid">
				<div class="features-grid-info">
					<div class="col-md-2 features-icon1">
						<span class="f-icon3"> </span>
					</div>
					<div class="col-md-10 features-info">
						<h4>Accusan timar</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="features-grid-info">
					<div class="col-md-2 features-icon1">
						<span class="f-icon4"> </span>
					</div>
					<div class="col-md-10 features-info">
						<h4>Accusan timar</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="features-grid-info">
					<div class="col-md-2 features-icon1">
						<span class="f-icon5"> </span>
					</div>
					<div class="col-md-10 features-info">
						<h4>Accusan timar</h4>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium.</p>
					</div>
					<div class="clearfix"></div>
				</div>

			</div>
			<!---end-features-grid-->
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--//features-grids-->
<!--//features-->
<!--screen-shot-gallery-->
<div id="gallery" class="screen-shot-gallery">
	<div class="container">
		<div class="section-head text-center">
			<h3>
				<span class="frist"> </span>SCREENSHOTS GALLERY<span class="second">
				</span>
			</h3>
			<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem
				accusantium doloremque laudantium, totam rem aperiam, eaque ipsa
				quae ab illo inventore veritatis et quasi architecto beatae vitae
				dicta.</p>
		</div>
	</div>
	<!--sreen-gallery-cursual-->
	<div class="sreen-gallery-cursual">
		<!-- requried-jsfiles-for owl -->
		<link href="<c:url value='/resources/css/owl.carousel.css'  />" rel="stylesheet"/>
		<script src="<c:url value='/resources/js/owl.carousel.js' />"></script>
		<script>
			$(document).ready(function() {
				$("#owl-demo").owlCarousel({
					items : 3,
					lazyLoad : true,
					autoPlay : true,
				});
			});
		</script>
		<!-- //requried-jsfiles-for owl -->
		<!-- start content_slider -->
		<div class="container">
			<div id="owl-demo" class="owl-carousel">
				<div class="item">
					<img class="lazyOwl" data-src="<c:url value='/resources/img/screen.png'  />" alt="screen-name"/>
				</div>
				<div class="item">
					<img class="lazyOwl" data-src="<c:url value='/resources/img/screen.png'  />" alt="screen-name"/>
				</div>
				<div class="item">
					<img class="lazyOwl" data-src="<c:url value='/resources/img/screen.png'  />" alt="screen-name"/>
				</div>
				<div class="item">
					<img class="lazyOwl" data-src="<c:url value='/resources/img/screen.png'  />" alt="screen-name"/>
				</div>
				<div class="item">
					<img class="lazyOwl" data-src="<c:url value='/resources/img/screen.png'  />" alt="screen-name"/>
				</div>
				<div class="item">
					<img class="lazyOwl" data-src="<c:url value='/resources/img/screen.png'  />" alt="screen-name"/>
				</div>
				<div class="item">
					<img class="lazyOwl" data-src="<c:url value='/resources/img/screen.png'  />" alt="screen-name"/>
				</div>
				<div class="item">
					<img class="lazyOwl" data-src="<c:url value='/resources/img/screen.png'  />" alt="screen-name"/>
				</div>
			</div>
		</div>
		<!--//sreen-gallery-cursual-->
	</div>
</div>
<!--//screen-shot-gallery-->
<!-- show-reel -->
<!--pop-up-box-->
<link href="<c:url value='/resources/css/popuo-box.css'  />" media="all" rel="stylesheet"/>
<script src="<c:url value='/resources/js/jquery.magnific-popup.js' />"></script>
<!--//pop-up-box-->
<div class="show-reel text-center">
	<div class="container">
		<h5>
			SHOW <a class="popup-with-zoom-anim" href="#small-dialog"><span>
			</span></a> REEL
		</h5>
		<div id="small-dialog" class="mfp-hide">
			<iframe src="//player.vimeo.com/video/38584262" width="100%"
				height="400" frameborder="0" webkitallowfullscreen
				mozallowfullscreen allowfullscreen> </iframe>
		</div>
		<script>
			$(document).ready(function() {
				$('.popup-with-zoom-anim').magnificPopup({
					type : 'inline',
					fixedContentPos : false,
					fixedBgPos : true,
					overflowY : 'auto',
					closeBtnInside : true,
					preloader : false,
					midClick : true,
					removalDelay : 300,
					mainClass : 'my-mfp-zoom-in'
				});

			});
		</script>
	</div>
</div>
<!-- //show-reel -->
<!--team-->
<div id="about" class="team">
	<div class="container">
		<div class="section-head text-center">
			<h3>
				<span class="frist"> </span>PEOPLE BEHIND THE APP<span
					class="second"> </span>
			</h3>
			<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem
				accusantium doloremque laudantium, totam rem aperiam, eaque ipsa
				quae ab illo inventore veritatis et quasi architecto beatae vitae
				dicta.</p>
		</div>
	</div>
	<!--team-members-->
	<div class="team-members">
		<div class="container">
			<div class="col-md-3 team-member">
				<div class="team-member-info">
					<img class="member-pic" src="<c:url value='/resources/img/team-member4.jpg'  />" title="name"/>
					<h5>
						<a href="#">Jonh Doe eh</a>
					</h5>
					<span>Lead Designer</span> <label
						class="team-member-caption text-center">
						<p>sit aspernatur aut odit aut fugit, sed quia consequuntur
							magni dolores eos qui ratione voluptatem.</p>
						<ul>
							<li><a class="t-twitter" href="#"><span> </span></a></li>
							<li><a class="t-facebook" href="#"><span> </span></a></li>
							<li><a class="t-googleplus" href="#"><span> </span></a></li>
							<div class="clearfix"></div>
						</ul>
					</label>
				</div>
			</div>
			<!-- end-team-member -->
			<div class="col-md-3 team-member">
				<div class="team-member-info">
					<img class="member-pic" src="<c:url value='/resources/img/team-member1.jpg'  />" title="name"/>
					<h5>
						<a href="#">Amanda Fenrnicas</a>
					</h5>
					<span>Lead Developer</span> <label
						class="team-member-caption text-center">
						<p>sit aspernatur aut odit aut fugit, sed quia consequuntur
							magni dolores eos qui ratione voluptatem.</p>
						<ul>
							<li><a class="t-twitter" href="#"><span> </span></a></li>
							<li><a class="t-facebook" href="#"><span> </span></a></li>
							<li><a class="t-googleplus" href="#"><span> </span></a></li>
							<div class="clearfix"></div>
						</ul>
					</label>
				</div>
			</div>
			<!-- end-team-member -->
			<div class="col-md-3 team-member">
				<div class="team-member-info">
					<img class="member-pic" src="<c:url value='/resources/img/team-member2.jpg'  />" title="name"/>
					<h5>
						<a href="#">Hamberg Rodny</a>
					</h5>
					<span>Artist</span> <label class="team-member-caption text-center">
						<p>sit aspernatur aut odit aut fugit, sed quia consequuntur
							magni dolores eos qui ratione voluptatem.</p>
						<ul>
							<li><a class="t-twitter" href="#"><span> </span></a></li>
							<li><a class="t-facebook" href="#"><span> </span></a></li>
							<li><a class="t-googleplus" href="#"><span> </span></a></li>
							<div class="clearfix"></div>
						</ul>
					</label>
				</div>
			</div>
			<!-- end-team-member -->
			<div class="col-md-3 team-member">
				<div class="team-member-info">
					<img class="member-pic" src="<c:url value='/resources/img/team-member3.jpg'  />" title="name"/>
					<h5>
						<a href="#">Jessica Leonardo</a>
					</h5>
					<span>Photographer</span> <label
						class="team-member-caption text-center">
						<p>sit aspernatur aut odit aut fugit, sed quia consequuntur
							magni dolores eos qui ratione voluptatem.</p>
						<ul>
							<li><a class="t-twitter" href="#"><span> </span></a></li>
							<li><a class="t-facebook" href="#"><span> </span></a></li>
							<li><a class="t-googleplus" href="#"><span> </span></a></li>
							<div class="clearfix"></div>
						</ul>
					</label>
				</div>
			</div>
			<!-- end-team-member -->
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
		<!--//team-members-->
	</div>
</div>
<!--//team-->
<div class="clearfix"></div>
<!--people-says-->
<div class="test-monials text-center">
	<div class="container">
		<span>
			<img src="<c:url value='/resources/img/icon1.png'  />" title="quit"/>
		</span>
		<script>
			$(document).ready(function() {
				$("#owl-demo1").owlCarousel({
					items : 1,
					lazyLoad : true,
					autoPlay : true,
					itemsDesktop : 2,
				});
			});
		</script>
		<div id="owl-demo1" class="owl-carousel">
			<div class="item">
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque laudantium, totam rem aperiam,
					eaque ipsa quae ab illo inventore veritatis et quasi architecto
					beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia
					voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
					magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
				<div class="quit-people">
					<img src="<c:url value='/resources/img/quit-people.jpg'  />" title="name"/>
					<h4>
						<a href="#"> Robert Leonaro</a>
					</h4>
					<span>CEO at CUBEDES</span>
				</div>
			</div>
			<div class="item">
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque laudantium, totam rem aperiam,
					eaque ipsa quae ab illo inventore veritatis et quasi architecto
					beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia
					voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
					magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
				<div class="quit-people">
					<img src="<c:url value='/resources/img/quit-people.jpg'  />" title="name"/>
					<h4>
						<a href="#"> Robert Leonaro</a>
					</h4>
					<span>CEO at CUBEDES</span>
				</div>
			</div>
			<div class="item">
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque laudantium, totam rem aperiam,
					eaque ipsa quae ab illo inventore veritatis et quasi architecto
					beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia
					voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
					magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
				<div class="quit-people">
					<img src="<c:url value='/resources/img/quit-people.jpg'  />" title="name"/>
					<h4>
						<a href="#"> Robert Leonaro</a>
					</h4>
					<span>CEO at CUBEDES</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//people-says-->
<!--FEATURED-->
<div class="featured">
	<div class="section-head text-center">
		<h3>
			<span class="frist"> </span>FEATURED IN<span class="second"> </span>
		</h3>
	</div>
	<script>
		$(document).ready(function() {
			$("#owl-demo2").owlCarousel({
				items : 5,
				lazyLoad : true,
				autoPlay : true,
				pagination : false,
			});
		});
	</script>
	<div id="owl-demo2" class="owl-carousel">
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo1.png'  />" title="the verge"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo2.png'  />" title="Mashable"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo3.png'  />" title="TNW"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo4.png'  />" title="bribble"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo1.png'  />" title="the verge"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo1.png'  />" title="the verge"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo2.png'  />" title="Mashable"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo3.png'  />" title="TNW"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo4.png'  />" title="bribble"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo1.png'  />" title="the verge"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo1.png'  />" title="the verge"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo2.png'  />" title="Mashable"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo3.png'  />" title="TNW"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo4.png'  />" title="bribble"/>
		</div>
		<div class="item">
			<img src="<c:url value='/resources/img/brand-logo1.png'  />" title="the verge"/>
		</div>
	</div>
</div>
<!--FEATURED-->
<!--getintouch-->
<div id="contact" class="getintouch">
	<div class="container">
		<div class="section-head text-center">
			<h3>
				<span class="frist"> </span>GET IN TOUCH<span class="second">
				</span>
			</h3>
			<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem
				accusantium doloremque laudantium, totam rem aperiam, eaque ipsa
				quae ab illo inventore veritatis et quasi architecto beatae vitae
				dicta.</p>
		</div>
		<!---->
		<div class="col-md-9 getintouch-left">
			<div class="contact-form col-md-10">
				<h3>Say hello!</h3>
				<form>
					<input type="text" placeholder="Name" required /> 
					<input type="text" placeholder="Email" required />
					<textarea placeholder="Message" required />
					</textarea>
					<input type="submit" value="Send message" />
				</form>
			</div>
			<ul class="footer-social-icons col-md-2 text-center">
				<li><a class="f-be" href="#"><span> </span></a></li>
				<li><a class="f-tw" href="#"><span> </span></a></li>
				<li><a class="f-db" href="#"><span> </span></a></li>
				<li><a class="f-ti" href="#"><span> </span></a></li>
				<li><a class="f-go" href="#"><span> </span></a></li>
				<div class="clearfix"></div>
			</ul>
		</div>
		<div class="col-md-2 getintouch-left">
			<div class="footer-divice">
				<img src="<c:url value='/resources/img/divice-half.png'  />" title="getintouch"/>
			</div>
		</div>
	</div>
</div>
<!---//getintouch-->
<!--footer-->
<div class="footer">
	<div class="container">
		<div class="footer-grids">
			<div class="col-md-3 footer-grid about-info">
				<a href="#">
					<img src="<c:url value='/resources/img/logo.png'  />" title="Umbrella"/>
				</a>
				<p>eusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat.</p>
			</div>
			<div class="col-md-3 footer-grid subscribe">
				<h3>Subscribe</h3>
				<form>
					<input type="text" placeholder="" required /> <input type="submit"
						value="" />
				</form>
				<p>eusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<div class="col-md-3 footer-grid explore">
				<h3>Explore</h3>
				<ul class="col-md-6">
					<li><a href="#">Envato</a></li>
					<li><a href="#">Themecurve</a></li>
					<li><a href="#">Kreativeshowcase</a></li>
					<li><a href="#">Freebiescurve</a></li>
				</ul>
				<ul class="col-md-6">
					<li><a href="#">Themeforest</a></li>
					<li><a href="#">Microsoft</a></li>
					<li><a href="#">Google</a></li>
					<li><a href="#">Yahoo</a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-3 footer-grid copy-right">
				<p>Eusmod tempor incididunt ut labore et dolore magna aliqua. ut
					labore et dolore magna aliqua.</p>
				<p class="copy">
					Template by <a href="http://w3layouts.com/">w3layouts</a>
				</p>
			</div>
			<div class="clearfix"></div>
			<script type="text/javascript">
				$(document).ready(function() {
					/*
					var defaults = {
						containerID: 'toTop', // fading element id
						containerHoverID: 'toTopHover', // fading element hover id
						scrollSpeed: 1200,
						easingType: 'linear' 
					};
					 */

					$().UItoTop({
						easingType : 'easeOutQuart'
					});

				});
			</script>
			<a href="#" id="toTop" style="display: block;"> <span
				id="toTopHover" style="opacity: 1;"> </span></a>
		</div>
	</div>
</div>
<!--//footer-->