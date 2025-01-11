package com.skilldistillery.noforks.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "recipe_comment")
public class RecipeComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	private int id;
	
	private String comments;
	
	@Column(name = "create_date")
	private LocalDateTime createDate;
	
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;
	
	@Column(name = "in_reply_to_id")
	private Integer inReplyToId;

	public RecipeComment() {
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

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Integer getInReplyToId() {
		return inReplyToId;
	}

	public void setInReplyToId(Integer inReplyToId) {
		this.inReplyToId = inReplyToId;
	}

	
	
	@Override
	public String toString() {
		return "RecipeComment [id=" + id + ", comments=" + comments + ", createDate=" + createDate + ", lastUpdate="
				+ lastUpdate + ", inReplyToId=" + inReplyToId + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(comments, createDate, id, inReplyToId, lastUpdate);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RecipeComment other = (RecipeComment) obj;
		return Objects.equals(comments, other.comments) && Objects.equals(createDate, other.createDate)
				&& id == other.id && Objects.equals(inReplyToId, other.inReplyToId)
				&& Objects.equals(lastUpdate, other.lastUpdate);
	}
	
	
	
	
}
