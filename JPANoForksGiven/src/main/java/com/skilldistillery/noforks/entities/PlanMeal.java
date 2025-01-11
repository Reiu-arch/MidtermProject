package com.skilldistillery.noforks.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
