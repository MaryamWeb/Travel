package com.maryam.travel.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.maryam.travel.services.TripService;
import com.maryam.travel.services.UserService;
import com.maryam.travel.models.LoginUser;
import com.maryam.travel.models.Trip;
import com.maryam.travel.models.EditUser;
import com.maryam.travel.models.User;

@Controller
public class HomeController {
	
	@Autowired
	private UserService uServ;
	@Autowired
	private TripService tServ;
	
    @GetMapping("/")
    public String index( Model model, HttpSession session) {
    	User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
    	model.addAttribute("currentUser", loggedInUser);
        return "index.jsp";
    }
    @GetMapping("/register")
	public String register(Model model){
    	model.addAttribute("newLogin", new LoginUser());
    	model.addAttribute("newUser", new User());
		return "register.jsp";
	}
    @PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		uServ.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "register.jsp";
		} else {
			session.setAttribute("user_id", newUser.getId());   
			return "redirect:/";
		}
	}
    @GetMapping("/login")
	public String login(Model model){
    	model.addAttribute("newLogin", new LoginUser());
    	model.addAttribute("newUser", new User());
		return "login.jsp";
	}
    @PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		User u = uServ.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		session.setAttribute("user_id", u.getId());
		return "redirect:/";
	}
    @GetMapping("/dashboard/{user_id}")
	public String user(@PathVariable("user_id") Long id, Model model, HttpSession session){
    	User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
    	User theUser = uServ.findById(id);
		if(theUser == null) {
			return "redirect:/";
		}
		model.addAttribute("theUser", theUser);
		model.addAttribute("currentUser", loggedInUser);
		return "user.jsp";
	}
    @GetMapping("/dashboard/user/edit")
	public String editUser(HttpSession session, Model model) {
		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
		if(loggedInUser == null) {
			return "redirect:/";
		}
		model.addAttribute("currentUser", loggedInUser);
		return "editUser.jsp";
	}
    @PostMapping("/dashboard/{id}/edit")
	public String updateUser(@Valid @ModelAttribute("currentUser") EditUser currentUser, @PathVariable("id") Long id, BindingResult result, HttpSession session, Model model) {
		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
		if(result.hasErrors()) {
			model.addAttribute("currentUser", loggedInUser);
			return "editUser.jsp";
		}
		uServ.updateUser(currentUser,loggedInUser.getId());
		return "redirect:/dashboard/{id}";
	}
    @GetMapping("/trips")
	public String home(HttpSession session, Model model) {
    	User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
    	model.addAttribute("currentUser", loggedInUser);
		model.addAttribute("allTrips", tServ.getTrips());
		return "allTrips.jsp";
	}
    @GetMapping("/trips/new")
	public String newTrip(HttpSession session, Model model) {
		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
		if(loggedInUser == null) {
			return "redirect:/";
		}
		model.addAttribute("allTrips", tServ.getTrips());
		model.addAttribute("newTrip", new Trip());
		return "newTrip.jsp";
	}
    @PostMapping("/trips")
	public String postTrip(@Valid @ModelAttribute("newTrip") Trip newTrip, BindingResult result, 
			HttpSession session, Model model) {
		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
		if(loggedInUser == null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			return "newTrip.jsp";
		}
		newTrip.setCreator(loggedInUser); //This is instead of using the hidden input
		tServ.createTrip(newTrip);
		return "redirect:/";
	}
    @GetMapping("/trip/{id}/join")
	public String joinTrip(@PathVariable("id") Long id, HttpSession session) {
		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
		if(loggedInUser == null) {
			return "redirect:/";
		}
		tServ.joinTrip(id, loggedInUser.getId());
		return "redirect:/trips";
	}
    @GetMapping("/trip/{id}/unjoin")
	public String leaveTrip(@PathVariable("id") Long id, HttpSession session) {
		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
		if(loggedInUser == null) {
			return "redirect:/";
		}
		tServ.unjoinTrip(id, loggedInUser.getId());
		return "redirect:/trips";
	}	
}