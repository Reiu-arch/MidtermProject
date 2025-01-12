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
@Table(name = "plan_comment")
public class PlanComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String comments;
	
	@Column(name="create_date")
	private LocalDateTime createDate;
	
	@Column(name="user_id")
	private int userId;
	
	@ManyToOne
	@JoinColumn(name = "in_reply_to_id")
	private PlanComment parentComment;
	
	@OneToMany(mappedBy = "parentComment")
	private List<PlanComment> subComments;
	
	@ManyToOne
	@JoinColumn(name = "plan_id")
	private Plan plan;

	public PlanComment() {
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
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	public PlanComment getParentComment() {
		return parentComment;
	}
	public void setParentComment(PlanComment parentComment) {
		this.parentComment = parentComment;
	}
	public List<PlanComment> getSubComments() {
		return subComments;
	}
	public void setSubComments(List<PlanComment> subComments) {
		this.subComments = subComments;
	}
	
	
	
	public Plan getPlan() {
		return plan;
	}
	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	@Override
	public String toString() {
		return "PlanComment [id=" + id + ", comments=" + comments + ", createDate=" + createDate + ", userId=" + userId
				+ ", parentComment=" + parentComment + ", subComments=" + subComments + ", plan=" + plan + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(comments, createDate, id, parentComment, plan, subComments, userId);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PlanComment other = (PlanComment) obj;
		return Objects.equals(comments, other.comments) && Objects.equals(createDate, other.createDate)
				&& id == other.id && Objects.equals(parentComment, other.parentComment)
				&& Objects.equals(plan, other.plan) && Objects.equals(subComments, other.subComments)
				&& userId == other.userId;
	}
	
	
	
	
}
