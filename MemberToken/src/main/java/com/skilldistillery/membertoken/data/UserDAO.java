package com.skilldistillery.membertoken.data;

import com.skilldistillery.membertoken.entities.User;

public interface UserDAO {

	User findById(int userId);
}
