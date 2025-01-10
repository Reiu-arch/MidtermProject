package com.skilldistillery.noforks.data;

import org.springframework.stereotype.Service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class UserDAOImpl implements UserDAO{
	
	@PersistenceContext
	private EntityManager em;

}
