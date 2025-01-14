<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<nav>
	<a href="home.do">Home</a><!-- FOR ALL -->
	<a href="browseResults.do">Browse</a><!-- FOR ALL -->
	<br>
	<c:choose>
<c:when test="${loggedInUser != null}">
	<h3> <c:out value = "${loggedInUser.username}"></c:out></h3>
	
	<a href="account.do">Account</a><!-- shown for logged in -->
	<a href="createrecipe.do">Create Recipe</a><!-- shown for logged in -->
	<a href="myplan.do">My Plan</a><!-- shown for logged in -->
	<a href="createplans.do">Create Plan</a><!-- shown for logged in -->
	
</c:when>
	<c:otherwise>
	<a href="login.do">Login</a><!-- wont be shown upon logging in -->
	<a href="createaccount.do">Sign Up</a><!-- wont be shown upon logging in -->
	</c:otherwise>
</c:choose>
</nav>
<hr>