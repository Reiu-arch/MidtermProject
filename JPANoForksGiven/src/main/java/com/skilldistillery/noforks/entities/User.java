package com.skilldistillery.noforks.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	private Boolean enabled;
	private String role;
	private String email;
	
	@Column(name="create_date")
	private LocalDateTime createDate;
	
	@Column(name="last_update")
	private LocalDateTime lastUpdate;
	
	@Column(name="profile_image_url")
	private String profileImage;
	private String biography;
	
	@OneToMany(mappedBy = "user")
	private List<MealReview> mealReviews;
	
	@OneToMany(mappedBy = "user")
	private List<RecipeReview> recipeReviews;
	
	@OneToMany(mappedBy = "user")
	private List<Plan> plans;
	
	@ManyToMany
	@JoinTable(
			name="meal_comment", 
			joinColumns=@JoinColumn(name="meal_id"), 
			inverseJoinColumns=@JoinColumn(name="user_id"))
	private List<Meal> meals;
	
	@OneToMany(mappedBy = "user")
	private List<Meal> userMeals;
	
	//FIXME wouldnt the mappedBy be favoriteMeals since thats the name used in the List<Meal> field? -fixed!
	//FIXME also wouldnt this be a one to many relationship? - I think it's manyToMany since its many users have many meals,
	//
	@ManyToMany
	@JoinTable(
			name="favorite_meal", 
			joinColumns=@JoinColumn(name="meal_id"), 
			inverseJoinColumns=@JoinColumn(name="user_id"))
	private List<Meal> favoriteMeals;
	
	//--------------------------------------------------------------
	
	@ManyToMany
	@JoinTable(
			name="followed_user", 
			joinColumns=@JoinColumn(name="user_id"),
			inverseJoinColumns=@JoinColumn(name="followed_user_id"))
	private List<User> followedUsersList;
	
//	@ManyToOne
//	@JoinColumn(name = "user_id")
//	private List<User> followedUsersList;
	
//	@OneToMany(mappedBy = "users")
//	private User userFollowing;
	
	@ManyToMany(mappedBy = "followedUsersList")
	private List<User> userFollowing;
	
	@OneToMany(mappedBy = "user")
<<<<<<< HEAD
	private List<Recipe>recipes;
	
	@OneToMany(mappedBy = "user")
	private List<MealComment>mealComments; 
	
=======
	private List<RecipeComment> recipeComments;
>>>>>>> c83f76cf7bc37710b99e67a11c348365fc5755c2
	
	@OneToMany(mappedBy = "user")
	private List<PlanComment> planComments;

	@OneToMany(mappedBy = "user")
	private List<Recipe> recipes;
	
	public User() {
		super();
	}
	
	
	
	public List<Plan> getPlans() {
		return plans;
	}
	public void setPlans(List<Plan> plans) {
		this.plans = plans;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public LocalDateTime getCreateDate() {
		return createDate;
	}
	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}
	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getBiography() {
		return biography;
	}
	public void setBiography(String biography) {
		this.biography = biography;
	}
	public List<Meal> getMeals() {
		return meals;
	}
	public void setMeals(List<Meal> meals) {
		this.meals = meals;
	}
	public List<Meal> getUserMeals() {
		return userMeals;
	}
	public void setUserMeals(List<Meal> userMeals) {
		this.userMeals = userMeals;
	}
	public List<RecipeReview> getRecipeReviews() {
		return recipeReviews;
	}
	public void setRecipeReviews(List<RecipeReview> recipeReviews) {
		this.recipeReviews = recipeReviews;
	}
	public List<User> getFollowedUsersList() {
		return followedUsersList;
	}
	public void setFollowedUsersList(List<User> followedUsersList) {
		this.followedUsersList = followedUsersList;
	}
	public List<User> getUserFollowing() {
		return userFollowing;
	}
	public void setUserFollowing(List<User> userFollowing) {
		this.userFollowing = userFollowing;
	}
	public List<MealReview> getMealReviews() {
		return mealReviews;
	}
	public void setMealReviews(List<MealReview> mealReviews) {
		this.mealReviews = mealReviews;
	}
	public List<Meal> getFavoriteMeals() {
		return favoriteMeals;
	}
	public void setFavoriteMeals(List<Meal> favoriteMeals) {
		this.favoriteMeals = favoriteMeals;
	}
	public List<Recipe> getRecipes() {
		return recipes;
	}
	public void setRecipes(List<Recipe> recipes) {
		this.recipes = recipes;
	}



<<<<<<< HEAD
	public List<MealComment> getMealComments() {
		return mealComments;
	}



	public void setMealComments(List<MealComment> mealComments) {
		this.mealComments = mealComments;
	}


=======
	public List<PlanComment> getPlanComments() {
		return planComments;
	}

	public void setPlanComments(List<PlanComment> planComments) {
		this.planComments = planComments;
	}

	public List<RecipeComment> getRecipeComments() {
		return recipeComments;
	}

	public void setRecipeComments(List<RecipeComment> recipeComments) {
		this.recipeComments = recipeComments;
	}
>>>>>>> c83f76cf7bc37710b99e67a11c348365fc5755c2

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return id == other.id;
	}

	

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", email=" + email + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate
				+ ", profileImage=" + profileImage + ", biography=" + biography + "]";
	}

}
