package com.nicholasung.fleaflickr.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nicholasung.fleaflickr.models.Project;
import com.nicholasung.fleaflickr.models.User;

@Repository
public interface ProjectRepository extends CrudRepository<Project, Long> {
	List<Project> findAll();
	List<Project> findByUserIdIs(Long id);
	List<Project> findByAllByLeaderIs(User leader);
	List<Project> findByAllByUsers(User user);
	List<Project> findByAllByUsersNotContains(User user);
}
