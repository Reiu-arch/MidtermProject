package com.skilldistillery.noforks.entities;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

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
	private int servings;
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



	@Override
	public String toString() {
		return "Recipe [id=" + id + ", name=" + name + ", description=" + description + ", prepTimeMin=" + prepTimeMin
				+ ", cookTimeMin=" + cookTimeMin + ", instructions=" + instructions + ", servings=" + servings
				+ ", difficulty=" + difficulty + ", userId=" + userId + ", ingredients=" + ingredients + ", imageUrl="
				+ imageUrl + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate + "]";
	}
	
}
