package com.skilldistillery.noforks.entities;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class MealReviewId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="meal_id")
	private int mealId;

	
	
	public MealReviewId() {
		super();
	}



	public MealReviewId(int userId, int mealId) {
		super();
		this.userId = userId;
		this.mealId = mealId;
	}



	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getMealId() {
		return mealId;
	}
	public void setMealId(int mealId) {
		this.mealId = mealId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public int hashCode() {
		return Objects.hash(mealId, userId);
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MealReviewId other = (MealReviewId) obj;
		return mealId == other.mealId && userId == other.userId;
	}



	@Override
	public String toString() {
		return "MealReviewId [userId=" + userId + ", mealId=" + mealId + "]";
	}
	
}
