//package com.nicholasung.fleaflickr.controllers;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//import javax.validation.Valid;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//
//import com.nicholasung.fleaflickr.models.Comment;
//import com.nicholasung.fleaflickr.models.Ticket;
//import com.nicholasung.fleaflickr.models.User;
//import com.nicholasung.fleaflickr.services.CommentService;
//import com.nicholasung.fleaflickr.services.TicketService;
//import com.nicholasung.fleaflickr.services.UserService;
//
//@Controller
//public class TicketController {
//
//		@Autowired
//	   private UserService userServ;
//	   @Autowired
//	   private CommentService commentServ;
//	   @Autowired
//	   private TicketService ticketServ;
//	   
//	   // DASHBOARD
//	   @GetMapping("/home")
//	   public String home(HttpSession session, Model model) {
//		   if(session.getAttribute("user") == null) {
//			   return "redirect:/logout";
//		   }
////		   User user = (User) session.getAttribute("user");
//		   List<Ticket> tickets = ticketServ.allTickets();
////		   List<Ticket> commented = ticketServ.ticketsCommented(user);
////		   List<User> following = userServ.usersFollowed(user);
////		   List<User> followers = user.getFollowers();
//		   model.addAttribute("tickets", tickets);
////		   model.addAttribute("commentedFor", commented);
////		   model.addAttribute("following", following);
////		   model.addAttribute("followers", followers);
//		   return "home.jsp";
//	   }
//	   // Add comment
//	   @GetMapping("/comment/{userId}/{ticketId}")
//	   public String addComment(@PathVariable("userId") Long userId, 
//			   @PathVariable("ticketId") Long ticketId) {
////		   ticketServ.addComment(ticketId, userId);
//		   return "redirect:/home";
//	   }
//	   // Remove comment
//	   @GetMapping("/remove/comment/{userId}/{ticketId}")
//	   public String removeComment(@PathVariable("userId") Long userId, 
//			   @PathVariable("ticketId") Long ticketId) {
////		   ticketServ.removeComment(ticketId, userId);
//		   return "redirect:/home";
//	   }
//	   
//	   // SHOW EXERCISE INFO
//	   @GetMapping("/names/{id}")
//	   public String show(HttpSession session, @PathVariable("id") Long id, 
//			   Model model) {
//		   if(session.getAttribute("user") == null) {
//			   return "redirect:/logout";
//		   }
//		   User user = (User) session.getAttribute("user");
////		   model.addAttribute("commented", ticketServ.commentedForTicket(user, id));
//		   Ticket ticket = ticketServ.findById(id);
//		   model.addAttribute("ticket", ticket);
//		   return "show.jsp";
//	   }
//	   
//	   // ADD EXERCISE
//	   @GetMapping("/names/new")
//	   public String addTicket(HttpSession session, 
//			   @ModelAttribute("ticket") Ticket emptyTicket) {
//		   if(session.getAttribute("user") == null) {
//			   return "redirect:/logout";
//		   }
//		   return "create.jsp";
//	   }
//	   // Add Ticket
//	   @PostMapping("/names/new")
//	   public String addTicket(HttpSession session,
//			   @Valid @ModelAttribute("ticket") Ticket filledTicket, 
//			   BindingResult result) {
//		   if(result.hasErrors()) {		   
//			   return "create.jsp";
//		   }
//		   ticketServ.createTicket(filledTicket);
//		   return "redirect:/home";
//	   }
//	   
//	   // EDIT EXERCISE
//	   @GetMapping("/names/edit/{id}")
//	   public String editTicket(HttpSession session, 
//			   @PathVariable("id") Long id, Model model) {
//		   if(session.getAttribute("user") == null) {
//			   return "redirect:/logout";
//		   }
//		   Ticket ticket = ticketServ.findById(id);
//		   model.addAttribute("ticket", ticket);
//		   return "edit.jsp";
//	   }
//	   // Edit Ticket
//	   @PutMapping("/names/edit/{id}")
//	   public String editTicket(HttpSession session, @PathVariable("id") Long id,
//			   Model model, @Valid @ModelAttribute("ticket") Ticket editedTicket,
//			   BindingResult result) {
//		   if(result.hasErrors()) {
//			   model.addAttribute("ticket", editedTicket);
//			   return "edit.jsp";
//		   }
//		   ticketServ.updateTicket(editedTicket);
//		   return "redirect:/home";
//	   }
//	   
//	   // DELETE EXERCISE
//	   @GetMapping("/names/{id}/delete")
//	   public String deleteTicket(@PathVariable("id") Long id) {
//			ticketServ.deleteTicket(ticketServ.findById(id));
//			return "redirect:/home";
//	   }
//	   
//	   // ADD COMMENT
//	   @GetMapping("/tickets/{id}/comments")
//	   public String addComment(HttpSession session, Model model,
//			   @PathVariable("id") Long id,
//			   @ModelAttribute("comment") Comment emptyComment) {
//		   if(session.getAttribute("user") == null) {
//			   return "redirect:/logout";
//		   }
//		   Ticket ticket = ticketServ.findById(id);
//		   List<Comment> comments = commentServ.allTicketComments(id);
//		   model.addAttribute("ticket", ticket);
//		   model.addAttribute("comments", comments);
//		   return "comments.jsp";
//	   }
//	   // Add Comment
//	   @PostMapping("/tickets/{ticketId}/comments")
//	   public String addComment(@PathVariable("ticketId") Long ticketId, Model model,
//			   @Valid @ModelAttribute("comment") Comment filledComment, 
//			   BindingResult result) {
//		   if(result.hasErrors()) {	
//			   Ticket ticket = ticketServ.findById(ticketId);
//			   List<Comment> comments = commentServ.allTicketComments(ticketId);
//			   model.addAttribute("ticket", ticket);
//			   model.addAttribute("comments", comments);
//			   return "comments.jsp";
//		   }
//		   commentServ.createComment(filledComment);
//		   return "redirect:/tickets/{ticketId}/comments";
//	   }
//	   
//	   // DELETE COMMENT
//	   @GetMapping("/tickets/{ticketId}/comments/{commentId}/delete")
//	   public String deleteComment(@PathVariable("ticketId") Long ticketId, 
//			   @PathVariable("commentId") Long commentId) {
//			commentServ.deleteComment(commentServ.findById(commentId));
//			return "redirect:/tickets/{ticketId}/comments";
//	   }
//}
