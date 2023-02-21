package com.nicholasung.fleaflickr.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.nicholasung.fleaflickr.models.LoginUser;
import com.nicholasung.fleaflickr.models.User;
import com.nicholasung.fleaflickr.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;

	// registers new user
	public User register(User newUser, BindingResult result) {
		// Reject if email is taken (present in database)
		if (userRepo.findByEmail(newUser.getEmail()).isPresent()) {
			result.rejectValue("email", "Taken", "This email is already taken.");
		}
		// Reject if password doesn't match confirmation
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The passwords must match.");
		}
		// Return null if result has errors
		if (result.hasErrors()) {
			// Exit the method and go back to the controller
			// to handle the response
			return null;
		}
		// Hash and set password, save user to database
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		return userRepo.save(newUser);
	}

	// logs in an existing user
	public User login(LoginUser newLogin, BindingResult result) {
		// Find user in the DB by email
		// Reject if NOT present
		if (!this.checkEmail(newLogin.getEmail())) {
			result.rejectValue("email", "Present", "Invalid credentials!");
		}
		// Reject if BCrypt password match fails
		User user = userRepo.findByEmail(newLogin.getEmail()).orElse(null);
		if (user != null) {
			if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
				result.rejectValue("password", "Matches", "Invalid credentials!");
			}
		}
		// Return null if result has errors
		if (result.hasErrors()) {
			// Exit the method and go back to the controller
			// to handle the response
			return null;
		}
		// Otherwise, return the user object
		return user;
	}

	// check if email is in database
	public boolean checkEmail(String email) {
		Optional<User> potentialUser = userRepo.findByEmail(email);
		return potentialUser.isPresent();
	}

	// returns all the users
	public List<User> allUsers() {
		return userRepo.findAll();
	}

	// creates a user
	public User createUser(User b) {
		return userRepo.save(b);
	}

	// retrieves a user
	public User findById(Long id) {
		return userRepo.findById(id).orElse(null);
	}

	// updates a user
	public User updateUser(User b) {
		return userRepo.save(b);
	}

	// updates a exercise for API
	public User updateUser(Long id, String firstName, String lastName, String email, String password) {
		User updatedUser = this.findById(id);
		updatedUser.setFirstName(firstName);
		updatedUser.setLastName(lastName);
		updatedUser.setEmail(email);
		updatedUser.setPassword(password);
		return userRepo.save(updatedUser);
	}

	// deletes a user
	public void deleteUser(User user) {
		userRepo.delete(user);
	}
}
