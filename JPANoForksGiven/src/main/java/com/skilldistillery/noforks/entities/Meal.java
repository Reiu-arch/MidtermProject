package com.skilldistillery.noforks.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Meal {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "user_id")
	private int userId;
	
	private String name;
	
	@Column(name = "create_date")
	private LocalDateTime createDate;
	
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;
	
	private String notes;
	
	@Column(name = "meal_type_id")
	private int mealTypeId;
	
	@Column(name = "image_url")
	private String imageUrl;

	public Meal() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

	public int getMealTypeId() {
		return mealTypeId;
	}

	public void setMealTypeId(int mealTypeId) {
		this.mealTypeId = mealTypeId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		return "Meal [id=" + id + ", userId=" + userId + ", name=" + name + ", createDate=" + createDate
				+ ", lastUpdate=" + lastUpdate + ", notes=" + notes + ", mealTypeId=" + mealTypeId + ", imageUrl="
				+ imageUrl + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(createDate, id, imageUrl, lastUpdate, mealTypeId, name, notes, userId);
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
				&& mealTypeId == other.mealTypeId && Objects.equals(name, other.name)
				&& Objects.equals(notes, other.notes) && userId == other.userId;
	}
	
	
	
}

