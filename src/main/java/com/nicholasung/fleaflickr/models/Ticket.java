package com.nicholasung.fleaflickr.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="tickets")
public class Ticket {
	// Member Variables
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Size(min = 1, max = 100, message="Title must be provided.")
    private String title;
    
    @NotEmpty(message="Issue type must be provided.")
    private String issueType;
    
    @NotEmpty(message="Priority must be provided.")
    private String priority;
    
    @NotEmpty(message="Status must be provided.")
    private String status;
    
    private String description;

    // createdAt & updatedAt
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    // Implement many to one relationship with users
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="assignee_user_id")
    private User assignee;
    // Implement many to one relationship with users
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="poster_user_id")
    private User poster;
    // Implement many to one relationship with users
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="project_id")
    private Project project;
    // Implement many to many relationship with user called comments
    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(
			name = "comments",
			joinColumns = @JoinColumn(name="ticket_id"),
			inverseJoinColumns = @JoinColumn(name = "user_id"))
    private List<User> usersWhoCommented;
    
    // Constructors
    public Ticket() {}  
	public Ticket(String title, String priority, String status,
			String description, String issueType) {
		this.title = title;
		this.issueType = issueType;
		this.priority = priority;
		this.status = status;
		this.description = description;
	}
	
	// Getters & Setters
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIssueType() {
		return issueType;
	}
	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public User getAssignee() {
		return assignee;
	}
	public void setAssignee(User assignee) {
		this.assignee = assignee;
	}
	public User getPoster() {
		return poster;
	}
	public void setPoster(User poster) {
		this.poster = poster;
	}
	public List<User> getUsersWhoCommented() {
		return usersWhoCommented;
	}
	public void setUsersWhoCommented(List<User> usersWhoCommented) {
		this.usersWhoCommented = usersWhoCommented;
	}

}
