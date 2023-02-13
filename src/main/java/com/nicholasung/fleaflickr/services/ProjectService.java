package com.nicholasung.fleaflickr.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicholasung.fleaflickr.models.Project;
import com.nicholasung.fleaflickr.models.User;
import com.nicholasung.fleaflickr.repositories.ProjectRepository;
import com.nicholasung.fleaflickr.repositories.UserRepository;

@Service
public class ProjectService {
	
	@Autowired
	ProjectRepository projectRepo;
	@Autowired
	UserRepository userRepo;
	@Autowired
	UserService userServ;
	
	// adds a given user to a given project
	public void addUserToProject(Long projectId, Long userId) {
		// retrieve an instance of a project
		Project thisProject = findProject(projectId);
		// retrieve an instance of a user
		User thisUser = userServ.findById(userId);
		// add the user to this project's list of users
		thisProject.getUsers().add(thisUser);
		// save thisProject, since changes were made to its user list
		projectRepo.save(thisProject);
	   	thisUser.setProjects(this.allProjectsOnTeam(thisUser));
	}
	// removes a given user from a given project
	public void removeUserFromProject(Long projectId, Long userId) {
		// retrieve an instance of a project
		Project thisProject = findProject(projectId);
		// retrieve an instance of a user
		User thisUser = userServ.findById(userId);
		// remove the user from this project's list of users
		thisProject.getUsers().remove(thisUser);
		// save thisProject, since changes were made to its user list
		projectRepo.save(thisProject);
	}
    // returns all the projects
    public List<Project> allProjects() {
        return projectRepo.findAll();
    }
    // returns all the projects where a given user is not on the team
    public List<Project> allProjectsNotOnTeam(User user) {
    	return projectRepo.findByUsersNotContains(user);
    }
    // returns all the projects where a given user is on the team
    public List<Project> allProjectsOnTeam(User user) {
        return projectRepo.findAllByUsers(user);
    }
    // returns if a user is on a given project
    public boolean isOnProject(User user, Long projectId) {
 	   if(this.allProjectsOnTeam(user).contains(this.findProject(projectId))) {
 		   return true;
	   }
 	   return false;
    }
    // creates a project
    public Project createProject(Project b) {
        return projectRepo.save(b);
    }
    // retrieves a project
    public Project findProject(Long id) {
    	return projectRepo.findById(id).orElse(null);
    }
    // updates a project
    public Project updateProject(Project b) {
        return projectRepo.save(b);
    }
    // deletes a project
    public void deleteProject(Long id) {
    	Optional<Project> optionalProject = projectRepo.findById(id);
    	if(optionalProject.isPresent()) {
    		projectRepo.deleteById(id);    		
    	}
    }
}
