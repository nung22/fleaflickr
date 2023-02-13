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

import com.nicholasung.fleaflickr.models.User;
import com.nicholasung.fleaflickr.services.UserService;

@RestController
public class UserAPI {
	
	@Autowired
    private UserService userServ;
    
    @GetMapping("/api/users")
    public List<User> index() {
        return userServ.allUsers();
    }
    
    @PostMapping(value="/api/users")
    public User create(
    		@RequestParam(value="firstName") String firstName, 
    		@RequestParam(value="lastName") String lastName, 
    		@RequestParam(value="email") String email,
    		@RequestParam(value="password") String password) {
        User user = new User(firstName, lastName, email, password);
        return userServ.createUser(user);
    }
    
    @GetMapping("/api/users/{id}")
    public User show(@PathVariable("id") Long id) {
        User user = userServ.findById(id);
        return user;
    }
    
    @PutMapping(value="/api/users/{id}")
    public User update(
    		@PathVariable("id") Long id, 
    		@RequestParam(value="firstName") String firstName, 
    		@RequestParam(value="lastName") String lastName, 
    		@RequestParam(value="email") String email,
    		@RequestParam(value="password") String password) {
        User user = userServ.updateUser(id, firstName, lastName, email, password);
        return user;
    }
    
    @DeleteMapping(value="/api/users/{id}")
    public void destroy(@PathVariable("id") Long id) {
        userServ.deleteUser(userServ.findById(id));
    }
}
