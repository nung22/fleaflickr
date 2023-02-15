package com.nicholasung.fleaflickr.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nicholasung.fleaflickr.models.Ticket;

@Repository
public interface TicketRepository extends CrudRepository<Ticket, Long> {
	List<Ticket> findAll();
//	Ticket findByIdIs(Long id);
//	List<Ticket> findAllByAssignee(User assignee);
//	List<Ticket> findAllByPoster(User poster);
//	List<Ticket> findAllByProject(Project project);
	List<Ticket> findByProject_Id(Long id);
//	List<Ticket> findAllByStatus(String status);
//	List<Ticket> findAllByIssueType(String issueType);
//	List<Ticket> findAllByPriority(String priority);
}
