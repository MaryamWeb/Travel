package com.maryam.travel.controllers;

import javax.servlet.http.HttpServletRequest;
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
import com.maryam.travel.services.ActivityService;
import com.maryam.travel.services.TripService;
import com.maryam.travel.services.UserService;
import com.maryam.travel.models.LoginUser;
import com.maryam.travel.models.Trip;
import com.maryam.travel.models.Activity;
import com.maryam.travel.models.EditUser;
import com.maryam.travel.models.User;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Controller
public class HomeController {
	
	@Autowired
	private UserService uServ;
	@Autowired
	private TripService tServ;
	@Autowired
	private ActivityService aServ;
	
    @GetMapping("/")
    public String index( Model model, HttpSession session) {
    	User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
    	model.addAttribute("currentUser", loggedInUser);
        return "index.jsp";
    }
    @GetMapping("/register")
	public String register(Model model, HttpSession session){
    	User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
    	model.addAttribute("currentUser", loggedInUser);
    	model.addAttribute("newLogin", new LoginUser());
    	model.addAttribute("newUser", new User());
		return "register.jsp";
	}
    @PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
    	User u = uServ.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "register.jsp";
		} else {
			session.setAttribute("user_id", newUser.getId());   
			redirectAttributes.addAttribute("id", u.getId());
			return "redirect:/dashboard/{id}";
		}
	}
    @GetMapping("/login")
	public String login(Model model, HttpSession session){
    	User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
    	model.addAttribute("currentUser", loggedInUser);
    	model.addAttribute("newLogin", new LoginUser());
    	model.addAttribute("newUser", new User());
		return "login.jsp";
	}
    @GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		return "redirect:/";
	}
    @PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		User u = uServ.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		System.out.println(u.getId());
		session.setAttribute("user_id", u.getId());
		redirectAttributes.addAttribute("id", u.getId());
		return "redirect:/dashboard/{id}";
	}
    @GetMapping("/dashboard/{user_id}")
	public String user(@PathVariable("user_id") Long id, Model model, HttpSession session){
    	User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
    	User theUser = uServ.findById(id);
		if(theUser == null) {
			return "redirect:/";
		}
		model.addAttribute("allTrips", tServ.getTrips());
		model.addAttribute("theUser", theUser);
		model.addAttribute("currentUser", loggedInUser);
		return "user.jsp";
	}
    @GetMapping("/dashboard/{user_id}/{trip_id}")
   	public String userActivities(@PathVariable("user_id") Long user_id, @PathVariable("trip_id") Long trip_id, Model model, HttpSession session){
       	User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
       	Trip currentTrip = tServ.findTrip(trip_id);
       	User theUser = uServ.findById(user_id);
   		if(loggedInUser == null) {
   			return "redirect:/";
   		}
   		if(currentTrip == null) {
   			return "redirect:/";
   		}
   		model.addAttribute("currentTrip", currentTrip);
   		model.addAttribute("theUser", theUser);
   		model.addAttribute("currentUser", loggedInUser);
   		model.addAttribute("activities", aServ.getActInTrip(trip_id));
   		return "userActivities.jsp";
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
    @GetMapping("/trip/{trip_id}")
	public String trip(@PathVariable("trip_id") Long id, Model model, HttpSession session) {
		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
		if(loggedInUser == null) {
			return "redirect:/";
		}
		Trip currentTrip = tServ.findTrip(id);
		model.addAttribute("activities", aServ.getActInTrip(id));
		model.addAttribute("currentTrip", currentTrip);
		model.addAttribute("currentUser", loggedInUser);
		return "trip.jsp";
	}
    @GetMapping("/trips/new")
	public String newTrip(HttpSession session, Model model) {
		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
		if(loggedInUser == null) {
			return "redirect:/login";
		}
		model.addAttribute("currentUser", loggedInUser);
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
    
    @PostMapping("/search")
    public String searchResults(HttpServletRequest request , Model model,HttpSession session) {
    	User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
    	String q = request.getParameter("q");
    	model.addAttribute("currentUser", loggedInUser);
    	model.addAttribute("countriesfound", tServ.searchByCountry(q));
        model.addAttribute("resultCount", tServ.searchByCountry(q).size());
        model.addAttribute("searchItem", q);
    	return "searchResult.jsp";
    }
    @GetMapping("/trip/{trip_id}/activity")
   	public String addActivity(@PathVariable("trip_id") Long id, Model model, HttpSession session) {
   		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
   		if(loggedInUser == null) {
   			return "redirect:/";
   		}
   		Trip currentTrip = tServ.findTrip(id);
   		model.addAttribute("currentTrip", currentTrip);
   		model.addAttribute("newActivity", new Activity());
   		model.addAttribute("currentUser", loggedInUser);
   		return "addActivity.jsp";
   	}
    @PostMapping("/trip/{trip_id}/activity")
	public String postActivity(@Valid @ModelAttribute("newActivity") Activity newActivity, BindingResult result,  @PathVariable("trip_id") Long id, HttpSession session, Model model) {
		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
		Trip currentTrip = tServ.findTrip(id);
		if(loggedInUser == null) {
			System.out.println("log");
			return "redirect:/";
		}
		if(result.hasErrors()) {
			model.addAttribute("currentTrip", currentTrip);
			model.addAttribute("currentUser", loggedInUser);
			return "addActivity.jsp";
		}
		newActivity.setTrip(currentTrip);
		newActivity.setCreator(loggedInUser);  
		aServ.createAct(newActivity);
		return "redirect:/trip/{trip_id}";
	}
    @GetMapping("/trip/{trip_id}/activity/{activity_id}/join")
   	public String joinActivity(@PathVariable("activity_id") Long activity_id, @PathVariable("trip_id") Long trip_id,HttpSession session) {
   		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
   		Trip currentTrip = tServ.findTrip(trip_id);
   		if(loggedInUser == null) {
   			return "redirect:/";
   		}
   		if(!currentTrip.isOnTrip(loggedInUser.getId())) {
   			return "redirect:/trip/{trip_id}";
   		}
   		aServ.joinActivity(activity_id, loggedInUser.getId());
   		
   		return "redirect:/trip/{trip_id}";
   	}
    @GetMapping("/trip/{trip_id}/activity/{activity_id}/unjoin")
   	public String unjoinActivity(@PathVariable("activity_id") Long activity_id, @PathVariable("trip_id") Long trip_id,HttpSession session) {
   		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
   		Trip currentTrip = tServ.findTrip(trip_id);
   		if(loggedInUser == null) {
   			return "redirect:/";
   		}
   		if(!currentTrip.isOnTrip(loggedInUser.getId())) {
   			System.out.println("not on Trip");
   			return "redirect:/trip/{trip_id}";
   		}
   		aServ.unjoinActivity(activity_id, loggedInUser.getId());
   		
   		return "redirect:/trip/{trip_id}";
   	}
    
}