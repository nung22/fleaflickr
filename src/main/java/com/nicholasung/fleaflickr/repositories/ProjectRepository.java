package com.nicholasung.fleaflickr.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nicholasung.fleaflickr.models.Project;
import com.nicholasung.fleaflickr.models.User;

@Repository
public interface ProjectRepository extends CrudRepository<Project, Long> {
	List<Project> findAll();
	List<Project> findByLeaderIs(User leader);
	List<Project> findAllByUsers(User user);
	List<Project> findByUsersNotContains(User user);
}
