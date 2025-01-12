package com.skilldistillery.noforks.entities;

import java.time.LocalDateTime;
import java.util.List;

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
public class Recipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	
	@Column(name="prep_time_minutes")
	private Integer prepTimeMin;
	
	@Column(name="cook_time_minutes")
	private Integer cookTimeMin;
	private String instructions;
	private Integer servings;
	private String difficulty;
	
	@Column(name="user_id")
	private int userId;
	private String ingredients;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@Column(name="create_date")
	private LocalDateTime createDate;
	
	@Column(name="last_update")
	private LocalDateTime lastUpdate;

	@ManyToMany
	@JoinTable(
			name="meal_has_recipe",
			joinColumns=@JoinColumn(name="meal_id"),
			inverseJoinColumns=@JoinColumn(name="recipe_id"))
	private List<Meal> meals;
	
	@ManyToMany(mappedBy="recipes")
	  private List<Diet> diets;
	
	@ManyToMany(mappedBy="recipes")
	private List<Cuisine> cuisines;
	
	@OneToMany(mappedBy ="meal")
	private List<RecipeComment> RecipeComments;
	
	@OneToMany(mappedBy = "meal")
	private List<RecipeReview> RecipeReviews;
	
	public Recipe() {
		super();
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getPrepTimeMin() {
		return prepTimeMin;
	}
	public void setPrepTimeMin(Integer prepTimeMin) {
		this.prepTimeMin = prepTimeMin;
	}
	public Integer getCookTimeMin() {
		return cookTimeMin;
	}
	public void setCookTimeMin(Integer cookTimeMin) {
		this.cookTimeMin = cookTimeMin;
	}
	public String getInstructions() {
		return instructions;
	}
	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}
	public int getServings() {
		return servings;
	}
	public void setServings(int servings) {
		this.servings = servings;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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
	
	
	public List<RecipeComment> getRecipeComments() {
		return RecipeComments;
	}

	public void setRecipeComments(List<RecipeComment> recipeComments) {
		RecipeComments = recipeComments;
	}

	public List<RecipeReview> getRecipeReviews() {
		return RecipeReviews;
	}

	public void setRecipeReviews(List<RecipeReview> recipeReviews) {
		RecipeReviews = recipeReviews;
	}

	public List<Cuisine> getCuisines() {
		return cuisines;
	}

	public void setCuisines(List<Cuisine> cuisines) {
		this.cuisines = cuisines;
	}

	public List<Diet> getDiets() {
		return diets;
	}

	public void setDiets(List<Diet> diets) {
		this.diets = diets;
	}

	public void setServings(Integer servings) {
		this.servings = servings;
	}

	public List<Meal> getMeals() {
		return meals;
	}

	
	public void setMeals(List<Meal> meals) {
		this.meals = meals;
	}

	@Override
	public String toString() {
		return "Recipe [id=" + id + ", name=" + name + ", description=" + description + ", prepTimeMin=" + prepTimeMin
				+ ", cookTimeMin=" + cookTimeMin + ", instructions=" + instructions + ", servings=" + servings
				+ ", difficulty=" + difficulty + ", userId=" + userId + ", ingredients=" + ingredients + ", imageUrl="
				+ imageUrl + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate + "]";
	}
	
}
