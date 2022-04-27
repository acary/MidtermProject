package com.skilldistillery.membertoken.data;

import java.util.List;

import com.skilldistillery.membertoken.entities.User;

public interface UserDAO {

	User addUser(User user);

	User createUser(User user);

	User findUserById(int userId);

	List<User> findAllUsers();

	User findUserByEmailAndPass(String email, String password);

	User updateUser(int uid, User user);
	

}
