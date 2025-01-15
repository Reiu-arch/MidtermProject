package com.skilldistillery.noforks.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Meal {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	
	private String name;
	
	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	
	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;
	
	private String notes;
	
	@Column(name = "image_url")
	private String imageUrl;
	
	@ManyToOne
	@JoinColumn(name = "meal_type_id")
	private MealType mealTypeId;
	
	@ManyToMany(mappedBy = "meals")
	private List<Recipe> recipes;
	
	@OneToMany(mappedBy ="meal")
	private List<MealComment> mealComments;
	
	//through meal_review
	@OneToMany(mappedBy = "meal")
	private List<MealReview> mealReviews;

	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	//through favorite_meal
	//FIXME wouldnt the mappedBy be favoriteMeals since thats the name used in the List<Meal> field?  -fixed!
	//FIXME also wouldnt this be a one to many relationship? - I believe its still many to many (User to Meals) like many to many for Recipe to Diet
	@ManyToMany(mappedBy = "favoriteMeals")
	private List<User> usersWithFavMeals;
	
	@OneToMany(mappedBy ="meal")
	private List<PlanMeal> planmeals;
	
	

	public Meal() {
		super();
	}
	
	
	public void addRecipe (Recipe recipe) {
		if (recipes == null) {recipes = new ArrayList<>();
		}
		if (!recipes.contains(recipe)) {
			recipes.add(recipe);
			recipe.addMeal(this);
		}
		
	}

	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public List<MealReview> getMealReviews() {
		return mealReviews;
	}
	public void setMealReviews(List<MealReview> mealReviews) {
		this.mealReviews = mealReviews;
	}
	public void setMealTypeId(MealType mealTypeId) {
		this.mealTypeId = mealTypeId;
	}

	public MealType getMealTypeId() {
		return mealTypeId;
	}
	public List<Recipe> getRecipes() {
		return recipes;
	}
	public void setRecipes(List<Recipe> recipes) {
		this.recipes = recipes;
	}
	public List<MealComment> getMealComments() {
		return mealComments;
	}
	public void setMealComments(List<MealComment> mealComments) {
		this.mealComments = mealComments;
	}
	public List<PlanMeal> getPlanmeals() {
		return planmeals;
	}
	public void setPlanmeals(List<PlanMeal> planmeals) {
		this.planmeals = planmeals;
	}
	public List<User> getUsersWithFavMeals() {
		return usersWithFavMeals;
	}
	public void setUsersWithFavMeals(List<User> usersWithFavMeals) {
		this.usersWithFavMeals = usersWithFavMeals;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}


	
	
	@Override
	public int hashCode() {
		return Objects.hash(createDate, id, imageUrl, lastUpdate, mealComments, mealReviews, mealTypeId, name, notes,
				planmeals, recipes, user, usersWithFavMeals);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Meal other = (Meal) obj;
		return Objects.equals(createDate, other.createDate) && id == other.id
				&& Objects.equals(imageUrl, other.imageUrl) && Objects.equals(lastUpdate, other.lastUpdate)
				&& Objects.equals(mealComments, other.mealComments) && Objects.equals(mealReviews, other.mealReviews)
				&& Objects.equals(mealTypeId, other.mealTypeId) && Objects.equals(name, other.name)
				&& Objects.equals(notes, other.notes) && Objects.equals(planmeals, other.planmeals)
				&& Objects.equals(recipes, other.recipes) && Objects.equals(user, other.user)
				&& Objects.equals(usersWithFavMeals, other.usersWithFavMeals);
	}
	

	@Override
	public String toString() {
		return "Meal [id=" + id + ", name=" + name + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate
				+ ", notes=" + notes + ", imageUrl=" + imageUrl + ", mealTypeId=" + mealTypeId + ", user=" + user + "]";
	}
	
}

