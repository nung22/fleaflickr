package com.nicholasung.fleaflickr.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicholasung.fleaflickr.models.Ticket;
import com.nicholasung.fleaflickr.models.User;
import com.nicholasung.fleaflickr.repositories.TicketRepository;
import com.nicholasung.fleaflickr.repositories.UserRepository;

@Service
public class TicketService {
	
	@Autowired
	TicketRepository ticketRepo;
	@Autowired
	UserRepository userRepo;
	@Autowired
	UserService userServ;
	
	// returns all the tickets
	public List<Ticket> allTickets(){
		return ticketRepo.findAll();
	}
	// updates a ticket
	public Ticket updateTicket(Ticket ticket) {
		return ticketRepo.save(ticket);
	}
    // returns all the tickets for a given project
    public List<Ticket> allProjectTickets(Long id) {
    	return ticketRepo.findByProject_Id(id);
    }
	// updates a ticket for API
	public Ticket updateTicket(Long id, String title, String priority, String status,
			User assignee, String description, String issueType) {
		Ticket updatedTicket = this.findById(id);
		updatedTicket.setTitle(title);
		updatedTicket.setPriority(priority);
		updatedTicket.setStatus(status);
		updatedTicket.setAssignee(assignee);
		updatedTicket.setDescription(description);
		updatedTicket.setIssueType(issueType);
		return ticketRepo.save(updatedTicket);
	}
    // creates a ticket
	public Ticket createTicket(Ticket ticket) {
		return ticketRepo.save(ticket);
	}
	// deletes a ticket
	public void deleteTicket(Ticket ticket) {
		ticketRepo.delete(ticket);
	}
	// retrieves a ticket
	public Ticket findById(Long id) {
		return ticketRepo.findById(id).orElse(null);
	}
}
