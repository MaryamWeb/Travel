package com.maryam.travel.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.maryam.travel.models.LoginUser;
import com.maryam.travel.models.User;
import com.maryam.travel.models.EditUser;
import com.maryam.travel.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;
	
	public User findOne(Long id) {
		if(id == null) {
			return null;
		}
		Optional<User> potentialUser = userRepo.findById(id);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}
	
	public User findOne(String username) {
		Optional<User> potentialUser = userRepo.findByUsername(username);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}
	
	public User register(User newUser, BindingResult result) {
		if(findOne(newUser.getUsername()) != null) {
			result.rejectValue("username", "Unique", "This username is already in use!");
		}
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
		}
		if(result.hasErrors()) {
			return null;
		} else {
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt()); 
			newUser.setPassword(hashed);
			return userRepo.save(newUser);
		}
	}
	public User login(LoginUser newLogin, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		User user = findOne(newLogin.getUsername());
		if(user == null) {
			result.rejectValue("username", "Unique", "Sorry. This username does not exist in our database");
			return null;
		}
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Your username/password combination is incorrect");
		}
		if(result.hasErrors()) {
			return null;
		} else {
			return user;
		}
	}
 
	public User updateUser(EditUser updatedUser, Long userId) {
		  User u = userRepo.findById(userId).orElse(null);
		  u.setFirstName(updatedUser.getFirstName());
		  u.setLastName(updatedUser.getLastName());
		  u.setTagLine(updatedUser.getTagLine());
		  u.setDescription(updatedUser.getDescription());
		  u.setBirthday(updatedUser.getBirthday());
		  u.setProfileImg(updatedUser.getProfileImg());
		  return userRepo.save(u);
		}
	public User findById(Long id) {
		return this.userRepo.findById(id).orElse(null);
	}
}