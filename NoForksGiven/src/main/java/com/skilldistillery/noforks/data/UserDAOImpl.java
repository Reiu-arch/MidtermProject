package com.skilldistillery.noforks.data;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.noforks.entities.Recipe;
import com.skilldistillery.noforks.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class UserDAOImpl implements UserDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User authenticateUser(String username, String password) {
		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND u.enabled = true";
		User authenticatedUser = null;
		
		try {
			authenticatedUser = em.createQuery(jpql, User.class)
					.setParameter("un", username)
					.setParameter("pw", password)
					.getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid User: " + username);
			e.printStackTrace();
		}
		
		return authenticatedUser;
	}
	
	

	@Override
	public User addUser(User user) {
		user.setEnabled(true);
		em.persist(user);
		return user;
	}

	@Override
	public List<Recipe> findAllRecipes() {
	String jpql = "SELECT r FROM Recipe r WHERE r.enabled=true";
	List<Recipe> recipes = em.createQuery(jpql, Recipe.class).getResultList();
		return recipes;
	}



	@Override
	public boolean deleteByUserId(int userId, User user) {
		User sessionUser = em.find(User.class, userId);
		if (sessionUser.getId() != user.getId()) {
			return false;
		}

		sessionUser.setEnabled(false);
		em.persist(sessionUser);

		return true;
	}



	@Override
	public User editUser(User user) {
		User sessionUser = em.find(User.class, user.getId());

		if (user.getId() != sessionUser.getId()) {
			return user;
		}

		if (user.getId() == sessionUser.getId()) {
			if (sessionUser != null) {
				sessionUser.setUsername(user.getUsername());
				sessionUser.setPassword(user.getPassword());
				sessionUser.setEmail(user.getEmail());
				sessionUser.setProfileImage(user.getProfileImage());
				sessionUser.setBiography(user.getBiography());
				em.persist(sessionUser);
			}
		} 

		return sessionUser;
	}

	@Override
	public List<Recipe> findRecipeByKeyword(String keyword) {
		   if (keyword == null || keyword.trim().isEmpty()) {
		        return new ArrayList<>(); // This will return an empty array list, but i also put a check on the controller. Works fine but still relatively unsure
		    }
		    String jpql = "SELECT r FROM Recipe r WHERE r.keyword LIKE :keyword";
		    return em.createQuery(jpql, Recipe.class)
		             .setParameter("keyword", "%" + keyword.trim() + "%")
		             .getResultList();
	}

}
