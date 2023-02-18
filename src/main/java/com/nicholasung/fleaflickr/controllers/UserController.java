package com.nicholasung.fleaflickr.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.nicholasung.fleaflickr.models.LoginUser;
import com.nicholasung.fleaflickr.models.User;
import com.nicholasung.fleaflickr.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userServ;

	// LOGIN & REGISTRATION
	@GetMapping("/")
	public String index() {
		return "redirect:/fleaflickr";
	}

	// LOGIN & REGISTRATION
	@GetMapping("/fleaflickr")
	public String home(Model model) {
		return "index.jsp";
	}
	
	// REGISTER
	@GetMapping("/fleaflickr/signup")
	public String register(Model model) {
		// Bind empty User and LoginUser objects to the JSP
		// to capture the form input
		model.addAttribute("newUser", new User());
		return "signup.jsp";
	}
	// Registration
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result, Model model, HttpSession session) {

		// TO-DO Later -- call a register method in the service
		// to do some extra validations and create a new user!
		userServ.register(newUser, result);

		if (result.hasErrors()) {
			// Be sure to send in the empty LoginUser before
			// re-rendering the page.
			model.addAttribute("newUser", newUser);
			model.addAttribute("newLogin", new LoginUser());
			return "signup.jsp";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.
		session.setAttribute("user", newUser);
		return "redirect:/fleaflickr/projects";
	}

	// LOGIN 
	@GetMapping("/fleaflickr/login")
	public String login(Model model) {
		// Bind empty User and LoginUser objects to the JSP
		// to capture the form input
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}
	// Login
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result, Model model, HttpSession session) {

		// Add once service is implemented:
		// User user = userServ.login(newLogin, result);
		User user = userServ.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			model.addAttribute("newLogin", newLogin);
			return "login.jsp";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.
		session.setAttribute("user", user);
		return "redirect:/fleaflickr/projects";
	}

	// LOGOUT
	@GetMapping("/fleaflickr/logout-page")
	public String home(HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		return "logout.jsp";
	}

	// Log out
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
