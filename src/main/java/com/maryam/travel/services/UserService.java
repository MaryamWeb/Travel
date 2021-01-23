package com.maryam.travel.services;

package com.maryam.ideas.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.maryam.travel.models.LoginUser;
import com.maryam.travel.models.User;
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
	
	public User findOne(String email) {
		Optional<User> potentialUser = userRepo.findByEmail(email);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}
	
	public User register(User newUser, BindingResult result) {
		if(findOne(newUser.getEmail()) != null) {
			result.rejectValue("email", "Unique", "This email is already in use!");
		}
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
		}
		if(result.hasErrors()) {
			return null;
		} else {
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt()); //hash password
			newUser.setPassword(hashed);
			return userRepo.save(newUser);
		}
	}
	public User login(LoginUser newLogin, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		User user = findOne(newLogin.getEmail());
		if(user == null) {
			result.rejectValue("email", "Unique", "Sorry. This email does not exist in our database");
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
}