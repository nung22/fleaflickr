package com.nicholasung.fleaflickr.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nicholasung.fleaflickr.models.Ticket;
import com.nicholasung.fleaflickr.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	List<User> findAll();
	Optional<User> findByEmail(String email);
	User findByIdIs(Long id);
	List<User> findAllByTicketsCheered(Ticket ticket);
	List<User> findByTicketsCheeredNotContains(Ticket ticket);
	List<User> findAllByUsersFollowed(User user);
	List<User> findByUsersFollowedNotContains(User user);
	List<User> findAllByFollowers(User user);
	List<User> findByFollowersNotContains(User user);
}