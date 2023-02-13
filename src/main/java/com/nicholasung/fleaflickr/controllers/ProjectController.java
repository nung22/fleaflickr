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

@Controller
public class ProjectController {
	
	   @Autowired
	   private ProjectService projectServ;
	   
	   @Autowired
	   private TicketService ticketServ;
	   
	   // DASHBOARD
	   @GetMapping("/projects")
	   public String home(HttpSession session, Model model) {
		   if(session.getAttribute("user") == null) {
			   return "redirect:/logout";
		   }
		   User user = (User) session.getAttribute("user");
		   List<Project> projectsNotOnTeam = projectServ.allProjectsNotOnTeam(user);
		   List<Project> projectsOnTeam = projectServ.allProjectsOnTeam(user);
		   model.addAttribute("projectsNotOnTeam", projectsNotOnTeam);
		   model.addAttribute("projectsOnTeam", projectsOnTeam);
		   return "projects.jsp";
	   }
	   // Join Team
	   @GetMapping("/join/{userId}/{projectId}")
	   public String joinTeam(@PathVariable("userId") Long userId, 
			   @PathVariable("projectId") Long projectId) {
		   projectServ.addUserToProject(projectId, userId);
		   return "redirect:/projects";
	   }
	   // Leave Team
	   @GetMapping("/leave/{userId}/{projectId}")
	   public String leaveTeam(@PathVariable("userId") Long userId, 
			   @PathVariable("projectId") Long projectId) {
		   projectServ.removeUserFromProject(projectId, userId);
		   return "redirect:/projects";
	   }
	   
	   // SHOW PROJECT INFO
	   @GetMapping("/projects/{id}")
	   public String show(HttpSession session, @PathVariable("id") Long id, 
			   Model model) {
		   if(session.getAttribute("user") == null) {
			   return "redirect:/logout";
		   }
		   User user = (User) session.getAttribute("user");
		   model.addAttribute("joinedProject", projectServ.isOnProject(user, id));
		   Project project = projectServ.findProject(id);
		   model.addAttribute("project", project);
		   return "show.jsp";
	   }
	   
	   // ADD PROJECT
	   @GetMapping("/projects/new")
	   public String addProject(HttpSession session, 
			   @ModelAttribute("project") Project emptyProject) {
		   if(session.getAttribute("user") == null) {
			   return "redirect:/logout";
		   }
		   return "create.jsp";
	   }
	   // Add Project
	   @PostMapping("/projects/new")
	   public String addProject(HttpSession session,
			   @Valid @ModelAttribute("project") Project filledProject, 
			   BindingResult result) {
		   if(result.hasErrors()) {		   
			   return "create.jsp";
		   }
		   User user = (User) session.getAttribute("user");
		   projectServ.createProject(filledProject);
		   projectServ.addUserToProject(filledProject.getId(), user.getId());
		   return "redirect:/projects";
	   }
	   
	   // EDIT PROJECT
	   @GetMapping("/projects/edit/{id}")
	   public String editProject(HttpSession session, 
			   @PathVariable("id") Long id, Model model) {
		   if(session.getAttribute("user") == null) {
			   return "redirect:/logout";
		   }
		   Project project = projectServ.findProject(id);
		   model.addAttribute("project", project);
		   return "edit.jsp";
	   }
	   // Edit Project
	   @PutMapping("/projects/edit/{id}")
	   public String editProject(HttpSession session, @PathVariable("id") Long id,
			   Model model, @Valid @ModelAttribute("project") Project editedProject,
			   BindingResult result) {
		   if(result.hasErrors()) {
			   model.addAttribute("project", editedProject);
			   return "edit.jsp";
		   }
		   User user = (User) session.getAttribute("user");
		   projectServ.updateProject(editedProject);
		   projectServ.addUserToProject(editedProject.getId(), user.getId());
		   return "redirect:/projects";
	   }
	   
	   // DELETE PROJECT
	   @GetMapping("/projects/{id}/delete")
	   public String deleteProject(@PathVariable("id") Long id) {
			projectServ.deleteProject(id);
			return "redirect:/projects";
	   }
	   
	   // ADD TASK
	   @GetMapping("/projects/{id}/tickets")
	   public String addTicket(HttpSession session, Model model,
			   @PathVariable("id") Long id,
			   @ModelAttribute("ticket") Ticket emptyTicket) {
		   if(session.getAttribute("user") == null) {
			   return "redirect:/logout";
		   }
		   Project project = projectServ.findProject(id);
		   List<Ticket> tickets = ticketServ.allProjectTickets(id);
		   model.addAttribute("project", project);
		   model.addAttribute("tickets", tickets);
		   return "tickets.jsp";
	   }
	   // Add Ticket
	   @PostMapping("/projects/{projectId}/tickets")
	   public String addTicket(@PathVariable("projectId") Long projectId, Model model,
			   @Valid @ModelAttribute("ticket") Ticket filledTicket, 
			   BindingResult result) {
		   if(result.hasErrors()) {	
			   Project project = projectServ.findProject(projectId);
			   List<Ticket> tickets = ticketServ.allProjectTickets(projectId);
			   model.addAttribute("project", project);
			   model.addAttribute("tickets", tickets);
			   return "tickets.jsp";
		   }
		   ticketServ.createTicket(filledTicket);
		   return "redirect:/projects/{projectId}/tickets";
	   }
	   
	   // DELETE TASK
	   @GetMapping("/projects/{projectId}/tickets/{ticketId}/delete")
	   public String deleteTicket(@PathVariable("projectId") Long projectId, 
			   @PathVariable("ticketId") Long ticketId) {
			ticketServ.deleteTicket(ticketServ.findById(ticketId));
			return "redirect:/projects/{projectId}/tickets";
	   }
}
