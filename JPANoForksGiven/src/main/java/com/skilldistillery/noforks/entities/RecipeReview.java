package com.skilldistillery.noforks.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "recipe_review")
public class RecipeReview {
	
	@EmbeddedId
	private RecipeReviewId id;

	private Integer rating;
	
	private String remarks;
	
	@Column( name = "create_date")
	private LocalDateTime createDate;
	
	@Column( name = "last_update")
	private LocalDateTime lastUpdate;

	public RecipeReview() {
		super();
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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
		return "RecipeReview [rating=" + rating + ", remarks=" + remarks + ", createDate=" + createDate
				+ ", lastUpdate=" + lastUpdate + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(createDate, lastUpdate, rating, remarks);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RecipeReview other = (RecipeReview) obj;
		return Objects.equals(createDate, other.createDate) && Objects.equals(lastUpdate, other.lastUpdate)
				&& Objects.equals(rating, other.rating) && Objects.equals(remarks, other.remarks);
	}

	
	
	
	
	
	
}
