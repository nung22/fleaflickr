package com.nicholasung.fleaflickr.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nicholasung.fleaflickr.models.Ticket;
import com.nicholasung.fleaflickr.models.User;
import com.nicholasung.fleaflickr.services.TicketService;

@RestController
public class TicketAPI {
	
	@Autowired
    private TicketService ticketServ;
    
    @GetMapping("/api/tickets")
    public List<Ticket> index() {
        return ticketServ.allTickets();
    }
    
    @PostMapping(value="/api/tickets")
    public Ticket create(
    		@RequestParam(value="title") String title, 
    		@RequestParam(value="priority") String priority, 
    		@RequestParam(value="status") String status, 
    		@RequestParam(value="assignee") User assignee, 
    		@RequestParam(value="issueType") String issueType,
    		@RequestParam(value="description") String description) {
        Ticket ticket = new Ticket(title, priority, status,
    			assignee, description, issueType);
        return ticketServ.createTicket(ticket);
    }
    
    @GetMapping("/api/tickets/{id}")
    public Ticket show(@PathVariable("id") Long id) {
        Ticket ticket = ticketServ.findById(id);
        return ticket;
    }
    
    @PutMapping(value="/api/tickets/{id}")
    public Ticket update(
    		@PathVariable("id") Long id, 
    		@RequestParam(value="title") String title, 
    		@RequestParam(value="priority") String priority, 
    		@RequestParam(value="status") String status, 
    		@RequestParam(value="assignee") User assignee, 
    		@RequestParam(value="issueType") String issueType,
    		@RequestParam(value="description") String description) {
        Ticket ticket = ticketServ.updateTicket(id, title, priority, status,
    			assignee, description, issueType);
        return ticket;
    }
    
    @DeleteMapping(value="/api/tickets/{id}")
    public void destroy(@PathVariable("id") Long id) {
        ticketServ.deleteTicket(ticketServ.findById(id));
    }
}
