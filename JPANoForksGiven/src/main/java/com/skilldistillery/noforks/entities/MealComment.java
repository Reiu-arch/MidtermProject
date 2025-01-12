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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="meal_comment")
public class MealComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String comments;
	
	@Column(name= "create_date")
	private LocalDateTime createDate;
	
	
	@ManyToOne
	@JoinColumn(name = "meal_id")
	private Meal meal;
	
	@ManyToOne
	@JoinColumn(name="in_reply_to_id")
	private MealComment parentComment;
	
	@OneToMany(mappedBy = "parentComment")
	private List<MealComment> subComments;
	

	public MealComment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}


	public Meal getMeal() {
		return meal;
	}

	public void setMeal(Meal meal) {
		this.meal = meal;
	}
	
	public MealComment getParentComment() {
		return parentComment;
	}

	public void setParentComment(MealComment parentComment) {
		this.parentComment = parentComment;
	}

	public List<MealComment> getSubComments() {
		return subComments;
	}

	public void setSubComments(List<MealComment> subComments) {
		this.subComments = subComments;
	}

	@Override
	public String toString() {
		return "MealComment [id=" + id + ", comments=" + comments + ", createDate=" + createDate + ", meal=" + meal
				+ ", parentComment=" + parentComment + ", subComments=" + subComments + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(comments, createDate, id, meal, parentComment, subComments);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MealComment other = (MealComment) obj;
		return Objects.equals(comments, other.comments) && Objects.equals(createDate, other.createDate)
				&& id == other.id && Objects.equals(meal, other.meal)
				&& Objects.equals(parentComment, other.parentComment) && Objects.equals(subComments, other.subComments);
	}

	
}
