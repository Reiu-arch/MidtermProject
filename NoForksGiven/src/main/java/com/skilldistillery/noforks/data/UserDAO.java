package com.skilldistillery.noforks.data;

import java.util.List;

import com.skilldistillery.noforks.entities.Recipe;
import com.skilldistillery.noforks.entities.User;

public interface UserDAO {

	User authenticateUser(String username, String password);
	
	User addUser(User user);
	
	List<Recipe>findAllRecipes();
	
	boolean deleteByUserId(int userId, User user);
	
	User editUser(User user);
	
	public List<Recipe> findRecipeByKeyword(String keyword);
}
