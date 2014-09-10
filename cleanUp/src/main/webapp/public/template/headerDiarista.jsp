<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Navigation -->
<div id='cssmenu'>
	<ul class="navbar-right">
		<li class='active has-sub'><a href='#'>Servicos</a>
			<ul>
				<li class='has-sub'><a href='#'>Product 1</a>
					<ul>
						<li><a href='#'>Sub Product</a></li>
						<li><a href='#'>Sub Product</a></li>
					</ul></li>
				<li class='has-sub'><a href='#'>Product 2</a>
					<ul>
						<li><a href='#'>Sub Product</a></li>
						<li><a href='#'>Sub Product</a></li>
					</ul></li>
			</ul>
		</li>
		<li><a href='#'>fale conosco</a></li>
		
		<li><a href='#'>Perfil</a></li>
		<li><a href="<c:url value='/logout' />"
			title='<spring:message code="header.logout"/>'><spring:message
					code="header.logout" /></a></li>
	</ul>
</div>



