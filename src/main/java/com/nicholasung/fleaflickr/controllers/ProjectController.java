package com.nicholasung.fleaflickr.controllers;

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
import org.springframework.web.bind.annotation.PutMapping;

import com.nicholasung.fleaflickr.models.Project;
import com.nicholasung.fleaflickr.models.Ticket;
import com.nicholasung.fleaflickr.models.User;
import com.nicholasung.fleaflickr.services.ProjectService;
import com.nicholasung.fleaflickr.services.TicketService;
import com.nicholasung.fleaflickr.services.UserService;

@Controller
public class ProjectController {

	@Autowired
	private UserService userServ;

	@Autowired
	private ProjectService projectServ;

	@Autowired
	private TicketService ticketServ;

	// PUBLIC PROJECTS DASHBOARD
	@GetMapping("/fleaflickr/all-projects")
	public String allProjects(HttpSession session, Model model) {
		List<Project> projects = projectServ.allProjects();
		model.addAttribute("projects", projects);
		return "view-projects-public.jsp";
	}

	// USER DASHBOARD
	@GetMapping("/fleaflickr/projects")
	public String home(HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		User user = (User) session.getAttribute("user");
		List<Project> projectsOnTeam = projectServ.allProjectsOnTeam(user);
		model.addAttribute("projectsOnTeam", projectsOnTeam);
		return "view-projects.jsp";
	}

	// PROJECT HUB
	@GetMapping("/fleaflickr/projects/available")
	public String projectHub(HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		User user = (User) session.getAttribute("user");
		List<Project> projectsNotOnTeam = projectServ.allProjectsNotOnTeam(user);
		// List<Project> projectsOnTeam = projectServ.allProjectsOnTeam(user);
		model.addAttribute("projectsNotOnTeam", projectsNotOnTeam);
		// model.addAttribute("projectsOnTeam", projectsOnTeam);
		return "available-projects.jsp";
	}

	// Join Team
	@GetMapping("/join/{userId}/{projectId}")
	public String joinTeam(@PathVariable("userId") Long userId,
			@PathVariable("projectId") Long projectId) {
		projectServ.addUserToProject(projectId, userId);
		return "redirect:/fleaflickr/projects";
	}

	// Leave Team
	@GetMapping("/leave/{userId}/{projectId}")
	public String leaveTeam(@PathVariable("userId") Long userId,
			@PathVariable("projectId") Long projectId) {
		projectServ.removeUserFromProject(projectId, userId);
		return "redirect:/fleaflickr/projects";
	}

	// SHOW PROJECT INFO
	@GetMapping("/fleaflickr/projects/{id}")
	public String showProject(HttpSession session, @PathVariable("id") Long id,
			Model model) {
		// if (session.getAttribute("user") == null) {
		// 	return "redirect:/logout";
		// }
		User user = (User) session.getAttribute("user");
		model.addAttribute("joinedProject", projectServ.isOnProject(user, id));
		Project project = projectServ.findProject(id);
		model.addAttribute("project", project);
		return "project-details.jsp";
	}
	
	// ADD PROJECT
	@GetMapping("/fleaflickr/projects/new")
	public String addProject(HttpSession session,
	@ModelAttribute("project") Project emptyProject) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		return "create-project.jsp";
	}
	
	// Add Project
	@PostMapping("/fleaflickr/projects/new")
	public String addProject(HttpSession session,
			@Valid @ModelAttribute("project") Project filledProject,
			BindingResult result) {
		if (result.hasErrors()) {
			return "create-project.jsp";
		}
		User user = (User) session.getAttribute("user");
		projectServ.createProject(filledProject);
		projectServ.addUserToProject(filledProject.getId(), user.getId());
		return "redirect:/fleaflickr/projects";
	}

	// EDIT PROJECT
	@GetMapping("/fleaflickr/projects/edit/{id}")
	public String editProject(HttpSession session,
			@PathVariable("id") Long id, Model model) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		Project project = projectServ.findProject(id);
		model.addAttribute("project", project);
		return "edit-project.jsp";
	}
	
	// Edit Project
	@PutMapping("/fleaflickr/projects/edit/{id}")
	public String editProject(HttpSession session, @PathVariable("id") Long id,
			Model model, @Valid @ModelAttribute("project") Project editedProject,
			BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("project", editedProject);
			return "edit-project.jsp";
		}
		User user = (User) session.getAttribute("user");
		projectServ.updateProject(editedProject);
		projectServ.addUserToProject(editedProject.getId(), user.getId());
		return "redirect:/fleaflickr/projects";
	}
	
	// DELETE PROJECT
	@GetMapping("/fleaflickr/projects/{id}/delete")
	public String deleteProject(@PathVariable("id") Long id) {
		projectServ.deleteProject(id);
		return "redirect:/fleaflickr/projects";
	}

	// ADD TICKET
	@GetMapping("/fleaflickr/projects/{id}/tickets")
	public String addTicket(HttpSession session, Model model,
	@PathVariable("id") Long id,
			@ModelAttribute("ticket") Ticket emptyTicket) {
		// if (session.getAttribute("user") == null) {
		// 	return "redirect:/logout";
		// }
		Project project = projectServ.findProject(id);
		List<Ticket> tickets = ticketServ.allProjectTickets(id);
		List<User> allUsers = userServ.allUsers();
		model.addAttribute("allUsers", allUsers);
		model.addAttribute("project", project);
		model.addAttribute("tickets", tickets);
		return "view-tickets.jsp";
	}
	// Add Ticket
	@PostMapping("/fleaflickr/projects/{projectId}/tickets")
	public String addTicket(@PathVariable("projectId") Long projectId, Model model,
	@Valid @ModelAttribute("ticket") Ticket filledTicket,
	BindingResult result) {
		if (result.hasErrors()) {
			Project project = projectServ.findProject(projectId);
			List<Ticket> tickets = ticketServ.allProjectTickets(projectId);
			model.addAttribute("project", project);
			model.addAttribute("tickets", tickets);
			return "view-tickets.jsp";
		}
		ticketServ.createTicket(filledTicket);
		return "redirect:/fleaflickr/projects/{projectId}/tickets";
	}

	// SHOW TICKET INFO
	@GetMapping("/fleaflickr/projects/{projectId}/tickets/{ticketId}")
	public String showTicket(HttpSession session, @PathVariable("projectId") Long projectId,
	@PathVariable("ticketId") Long ticketId, Model model) {
		// if (session.getAttribute("user") == null) {
		// 	return "redirect:/logout";
		// }
		User user = (User) session.getAttribute("user");
		Project project = projectServ.findProject(projectId);
		Ticket ticket = ticketServ.findTicket(ticketId);
		model.addAttribute("joinedProject", projectServ.isOnProject(user, projectId));
		model.addAttribute("project", project);
		model.addAttribute("ticket", ticket);
		return "ticket-details.jsp";
	}

	// EDIT TICKET
	@GetMapping("/fleaflickr/projects/{projectId}/tickets/{ticketId}/edit")
	public String editTicket(HttpSession session, @PathVariable("projectId") Long projectId, 
		@PathVariable("ticketId") Long ticketId, Model model) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		Ticket ticket = ticketServ.findTicket(ticketId);
		Project project = projectServ.findProject(projectId);
		List<User> allUsers = userServ.allUsers();
		model.addAttribute("allUsers", allUsers);
		model.addAttribute("project", project);
		model.addAttribute("ticket", ticket);
		return "edit-ticket.jsp";
	}

	// Edit Ticket
	@PutMapping("/fleaflickr/projects/{projectId}/tickets/{ticketId}/edit")
	public String editTicket(HttpSession session, @PathVariable("projectId") Long projectId, 
		@PathVariable("ticketId") Long ticketId, Model model, @Valid @ModelAttribute("ticket") Ticket editedTicket,
			BindingResult result) {
		if (result.hasErrors()) {
			Project project = projectServ.findProject(projectId);
			List<User> allUsers = userServ.allUsers();
			model.addAttribute("allUsers", allUsers);
			model.addAttribute("project", project);
			model.addAttribute("ticket", editedTicket);
			return "edit-ticket.jsp";
		}
		// User user = (User) session.getAttribute("user");
		ticketServ.updateTicket(editedTicket);
		// ticketServ.addUserToTicket(editedTicket.getId(), user.getId());
		return "redirect:/fleaflickr/projects/{projectId}/tickets";
	}
	
	// DELETE TICKET
	@GetMapping("/fleaflickr/projects/{projectId}/tickets/{ticketId}/delete")
	public String deleteTicket(@PathVariable("projectId") Long projectId,
			@PathVariable("ticketId") Long ticketId) {
		ticketServ.deleteTicket(ticketId);
		return "redirect:/fleaflickr/projects/{projectId}/tickets";
	}
}
