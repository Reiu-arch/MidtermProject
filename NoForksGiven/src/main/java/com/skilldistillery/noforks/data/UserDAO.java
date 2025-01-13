package com.skilldistillery.noforks.data;

import com.skilldistillery.noforks.entities.User;

public interface UserDAO {

	User authenticateUser(String username, String password);
	
	User addUser(User user);
}
