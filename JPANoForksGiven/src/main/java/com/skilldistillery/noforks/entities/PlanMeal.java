package com.skilldistillery.noforks.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="plan_meal")
public class PlanMeal {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "day_number")
	private Integer dayNumber;
	
	private String notes;
	
	@ManyToOne
	@JoinColumn(name = "meal_id")
	private Meal meal;
	
	@ManyToOne
	@JoinColumn(name = "plan_id")
	private Plan plan;
	
	@ManyToOne
	@JoinColumn(name = "meal_type_id")
	private MealType mealTypeId;

	public PlanMeal() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getDayNumber() {
		return dayNumber;
	}

	public void setDayNumber(Integer dayNumber) {
		this.dayNumber = dayNumber;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	
	public Meal getMeal() {
		return meal;
	}

	public void setMeal(Meal meal) {
		this.meal = meal;
	}
	
	
	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public MealType getMealTypeId() {
		return mealTypeId;
	}

	public void setMealTypeId(MealType mealTypeId) {
		this.mealTypeId = mealTypeId;
	}

	@Override
	public String toString() {
		return "PlanMeal [id=" + id + ", dayNumber=" + dayNumber + ", notes=" + notes + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(dayNumber, id, notes);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PlanMeal other = (PlanMeal) obj;
		return Objects.equals(dayNumber, other.dayNumber) && id == other.id && Objects.equals(notes, other.notes);
	}
	
	
}
