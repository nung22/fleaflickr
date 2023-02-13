package com.nicholasung.fleaflickr.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicholasung.fleaflickr.models.Comment;
import com.nicholasung.fleaflickr.repositories.CommentRepository;

@Service
public class CommentService {
	
	@Autowired
	CommentRepository commentRepo;
	
	// returns all the comments
	public List<Comment> allComments(){
		return commentRepo.findAll();
	}
	// returns all the comments for a given ticket
	public List<Comment> allTicketComments(Long ticketId){
		return commentRepo.findByTicketIdIs(ticketId);
	}
	// creates a comment
	public Comment createComment(Comment comment) {
		return commentRepo.save(comment);
	}
	// updates a comment
	public void deleteComment(Comment comment) {
		commentRepo.delete(comment);
	}
    // retrieves a comment
    public Comment findById(Long id) {
    	return commentRepo.findById(id).orElse(null);
    }
    // deletes a comment
    public void deleteComment(Long id) {
    	commentRepo.deleteById(id);    		
    }
}
