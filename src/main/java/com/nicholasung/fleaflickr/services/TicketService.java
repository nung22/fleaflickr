package com.nicholasung.fleaflickr.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicholasung.fleaflickr.models.Ticket;
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
    public List<Ticket> allTickets() {
        return ticketRepo.findAll();
    }

    // returns all the tickets for a given project
    public List<Ticket> allProjectTickets(Long id) {
        return ticketRepo.findByProject_Id(id);
    }

    // creates a ticket
    public Ticket createTicket(Ticket b) {
        return ticketRepo.save(b);
    }

    // retrieves a ticket
    public Ticket findTicket(Long id) {
        return ticketRepo.findById(id).orElse(null);
    }

    // updates a ticket
    public Ticket updateTicket(Ticket b) {
        return ticketRepo.save(b);
    }

    // deletes a ticket
    public void deleteTicket(Long id) {
        Optional<Ticket> optionalTicket = ticketRepo.findById(id);
        if (optionalTicket.isPresent()) {
            ticketRepo.deleteById(id);
        }
    }
}
