<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<nav>
	<a href="home.do">Home</a>
	<!-- FOR ALL -->
	<a href="browseResults.do" class="button">Browse</a>
	<!-- FOR ALL -->
	<br>
	<c:choose>
		<c:when test="${loggedInUser != null}">

			<a href="account.do">Account</a>
			<!-- shown for logged in -->
			<a href="createrecipe.do">Create Recipe</a>
			<!-- shown for logged in -->
			<a href="myplan.do">My Plan</a>
			<!-- shown for logged in -->
			<a href="createplans.do">Create Plan</a>
			<!-- shown for logged in -->
			<h3>
				<c:out value="Welcome, ${loggedInUser.username}!"></c:out>
			</h3>

		</c:when>
		<c:otherwise>
			<a href="login.do">Login</a>
			<!-- wont be shown upon logging in -->
			<a href="createaccount.do">Sign Up</a>
			<!-- wont be shown upon logging in -->
		</c:otherwise>
	</c:choose>
</nav>
<hr>