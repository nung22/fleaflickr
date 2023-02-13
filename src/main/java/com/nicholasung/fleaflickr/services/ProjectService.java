package com.nicholasung.fleaflickr.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicholasung.fleaflickr.models.Project;
import com.nicholasung.fleaflickr.repositories.ProjectRepository;

@Service
public class ProjectService {
	
	@Autowired
	ProjectRepository projectRepo;
	
	// returns all the projects
	public List<Project> allProjects(){
		return projectRepo.findAll();
	}
	// returns all the projects for a given ticket
	public List<Project> allUserProjects(Long ticketId){
		return projectRepo.findByUserIdIs(ticketId);
	}
	// creates a project
	public Project createProject(Project project) {
		return projectRepo.save(project);
	}
	// updates a project
	public void deleteProject(Project project) {
		projectRepo.delete(project);
	}
    // retrieves a project
    public Project findById(Long id) {
    	return projectRepo.findById(id).orElse(null);
    }
    // deletes a project
    public void deleteProject(Long id) {
    	projectRepo.deleteById(id);    		
    }
}
