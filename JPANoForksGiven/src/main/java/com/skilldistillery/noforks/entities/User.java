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
	
	@ManyToMany
	@JoinTable(
			name="meal_comment", 
			joinColumns=@JoinColumn(name="meal_id"), 
			inverseJoinColumns=@JoinColumn(name="user_id"))
	private List<Meal> meals;
	
	@OneToMany(mappedBy = "user")
	private List<Meal> userMeals;
	
	
	@ManyToMany
	@JoinTable(
			name="favorite_meal", 
			joinColumns=@JoinColumn(name="meal_id"), 
			inverseJoinColumns=@JoinColumn(name="user_id"))
	private List<Meal> favoriteMeals;
	
	public User() {
		super();
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
