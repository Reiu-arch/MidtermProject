package com.skilldistillery.noforks.entities;

import java.time.LocalDateTime;
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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Plan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	
	@Column(name="last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;
	private String notes;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@OneToMany(mappedBy ="plan")
	private List<PlanMeal> planmeals;
	
	@OneToMany(mappedBy ="plan")
	private List<PlanComment> plancomments;
	
	@Column(name="schedule_date")
	private LocalDateTime scheduleDate;
	private boolean enabled;
	
	

	public Plan() {
		super();
	}
	
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public List<PlanMeal> getPlanmeals() {
		return planmeals;
	}
	public void setPlanmeals(List<PlanMeal> planmeals) {
		this.planmeals = planmeals;
	}
	public List<PlanComment> getPlancomments() {
		return plancomments;
	}
	public void setPlancomments(List<PlanComment> plancomments) {
		this.plancomments = plancomments;
	}
	public LocalDateTime getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(LocalDateTime scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}



	@Override
	public int hashCode() {
		return Objects.hash(createDate, id, imageUrl, lastUpdate, notes, planmeals, user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Plan other = (Plan) obj;
		return Objects.equals(createDate, other.createDate) && id == other.id
				&& Objects.equals(imageUrl, other.imageUrl) && Objects.equals(lastUpdate, other.lastUpdate)
				&& Objects.equals(notes, other.notes) && Objects.equals(planmeals, other.planmeals)
				&& Objects.equals(user, other.user);
	}
	
	

	@Override
	public String toString() {
		return "Plan [id=" + id + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate + ", user=" + user
				+ ", imageUrl=" + imageUrl + ", scheduleDate=" + scheduleDate + ", enabled=" + enabled + "]";
	}

	

}
