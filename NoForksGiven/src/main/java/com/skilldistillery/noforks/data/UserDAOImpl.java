package com.skilldistillery.noforks.data;

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
		em.persist(user);
		return user;
	}

	@Override
	public List<Recipe> findAllRecipes() {
	String jpql = "SELECT r FROM Recipe r WHERE r.enabled=true";
	List<Recipe> recipes = em.createQuery(jpql, Recipe.class).getResultList();
		return recipes;
	}

}
