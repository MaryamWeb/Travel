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

import com.maryam.travel.services.UserService;
import com.maryam.travel.models.LoginUser;
import com.maryam.travel.models.User;

@Controller
public class HomeController {
	
	@Autowired
	private UserService uServ;
	
    @GetMapping("/")
    public String index() {
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
    @GetMapping("/dashboard")
	public String user(Model model){
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
    @PostMapping("/dashboard/user/edit")
	public String updateUser(@Valid @ModelAttribute("currentUser") User currentUser, BindingResult result, HttpSession session, Model model) {
		User loggedInUser = uServ.findOne( (Long) session.getAttribute("user_id") );
		if(result.hasErrors()) {
			model.addAttribute("currentUser", loggedInUser);
			return "editUser.jsp";
		}
			//uServ.update(currentUser);
			return "redirect:/dashboard";
	}
}