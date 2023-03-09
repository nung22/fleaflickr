<h1 align="center">
  FleaFlickr
</h1>

<p align="center">
    <a href="http://35.91.110.95/fleaflickr" alt="Live Demo">Live</a> |
    <a href="https://www.loom.com/share/25f66c1a8d5845eabe4bb5e322d4efb1" alt="Video Demo">Video Demo</a>
</p>

<a href="https://www.loom.com/share/25f66c1a8d5845eabe4bb5e322d4efb1" alt="Video Demo"><img src="./screenshots/HomePage.png?raw=true" alt="Home Page"></a>


### _An Issue Tracking System (ITS)_

---

## Table of Contents
- [Table of Contents](#table-of-contents)
- [Background](#background)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Functionality](#functionality)
- [Design](#design)

---

## Background

I have had experience using issue-tracking systems (ITS) such as Jira in the past and was simply curious if I could design one to track the progress in my own projects. This lightweight ITS is designed to let users create projects, allow them to join & leave other users' projects, and create & assign tickets to members on their own projects to keep tabs on any relevant bugs, new features, improvements, and tasks.

[Return to Table of Contents](#Table-of-Contents)

---

## Features

- Registration with validations

  <img src="./screenshots/Registration.png?raw=true" alt="Registration" width="300">

- Login with validations & password visibility toggle

  <img src="./screenshots/PasswordHidden.png?raw=true" alt="Password Hidden" width="300">
  <img src="./screenshots/PasswordVisible.png?raw=true" alt="Password Visible" width="300">

- User Profile Page

  <img src="./screenshots/UserInfo.png?raw=true" alt="User Profile" width="300">

- User Options & Logout

  <img src="./screenshots/UserOptions.png?raw=true" alt="User Options" width="300">
  <img src="./screenshots/Logout.png?raw=true" alt="Logout" width="300">

- Projects Available to Join

  <img src="./screenshots/NoAvailableProjects.png?raw=true" alt="No Available Projects" width="300">
  <img src="./screenshots/AvailableProjects.png?raw=true" alt="Available Projects" width="300">

- User Projects (Joined & Leading)

  <img src="./screenshots/NoUserProjects.png?raw=true" alt="No User Projects" width="300">
  <img src="./screenshots/UserProjectsLead.png?raw=true" alt="User Projects Leading" width="300">
  <img src="./screenshots/UserProjectsNotLead.png?raw=true" alt="User Projects Joined" width="300">

- Create, Read, Update or Delete a Project

  <img src="./screenshots/CreateProject.png?raw=true" alt="Create Project" width="300">
  <img src="./screenshots/ProjectDetails.png?raw=true" alt="View Project" width="300">
  <img src="./screenshots/EditProject.png?raw=true" alt="Update Project" width="300">
  <img src="./screenshots/DeleteProject.png?raw=true" alt="Delete Project" width="300">

- Create, Read, Update or Delete a Ticket

  <img src="./screenshots/CreateTicket.png?raw=true" alt="Create Ticket" width="300">
  <img src="./screenshots/TicketDetails.png?raw=true" alt="View Ticket" width="300">
  <img src="./screenshots/EditTicket.png?raw=true" alt="Update Ticket" width="300">
  <img src="./screenshots/DeleteTicket.png?raw=true" alt="Delete Ticket" width="300">



[Return to Table of Contents](#Table-of-Contents)

---

## Technologies Used

- Java
- Spring Boot
- Spring JPA
- HTML, CSS, Javascript, and Bootstrap
- MySQL Database
- HTML and Bootstrap validations as well as server-side validations and Bcrypt for secure login

[Return to Table of Contents](#Table-of-Contents)

---

## Functionality

Site visitors may browse all projects on the site and view their corresponding tickets without an account, but must create one if they wish to join projects, giving them access to CRUD functionality on their respective projects/tickets.

Upon logging in, the user is taken to a list of projects which they have joined or are leading. If they have are a part of no projects, a prompt to join or create a project appears. Projects available to be joined are displayed in the Project Hub, and if none are present, a prompt to create a project appears. Available projects in the Project Hub have the option to be joined, while actions in the User Projects either allow a user to leave a project they have joined or edit a project which they are the lead on.

By clicking on the user initials in the upper right corner of the site, the user is given the option to view their profile or logout. The user profile display the current user's first & last names, the date they created their account, and their email address. Pressing 'Logout' directs the user to a page where they can confirm their desire to log out.

Projects require a name, description, and future due date when created. Whoever creates the project is automatically assigned as its lead and can edit the project details as well as the information of any tickets created for that project. Clicking the name of a project on the User Projects page navigates the user to a table displaying all the tickets for the selected project.

Tickets require a summary, issue type, status, priority, and assignee. The description is optional. Project tickets are displayed in a table with the most recent one at the top. Keys are generated based on the first four digits of the project name and the ticket id. The project lead, ticket reporter, and ticket assignee are the only individuals who can edit a given ticket. On the ticket detail page, an additional category labeled 'Resolved' indicates whether a given issue has been completed or still requires work.

[Return to Table of Contents](#Table-of-Contents)

---

## Design

The navbar remains the same throughout the site, allowing easy navigation. If the site visitor is not logged in, the 'Log in' and 'Sign up' buttons remain on the right side of the bar, otherwise a badge with the current user's initials are displayed. The site badge and name can be clicked to navigate to the home page if not logged in and to the User Projects page if logged in. The navbar does not appear in the login, registration, and logout screens, as well as any of the create and update forms.

Upon creating or updating a ticket or project, the user is directed to the appropriate list displaying the new information added. All create and edit forms have frontend and backend validations. Whenever a user attempts to delete either a project or ticket, a pop-up appears in the center of the page to confirm their decision since it is irreversible.

If a site visitor attempts to visit a create or update form when they are not logged in, they will be redirected to the landing page.

A full screen fading CSS animation was added to provide a visually pleasing cover while waiting for page assets to load.

[Return to Table of Contents](#Table-of-Contents)
