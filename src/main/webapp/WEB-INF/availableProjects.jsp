    <div class="table-holder rounded">
      <table class="table table-borderless table-dark table-hover text-center table-projects mb-5">
        <thead>
          <tr class="fs-5">
            <th>Project</th>
            <th>Team Lead</th>
            <th>Due Date</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="oneProject" items="${projectsNotOnTeam}">
            <tr class="align-middle">
              <td>
                <a
                  class="text-decoration-none"
                  href="<c:url value='/projects/${oneProject.getId()}'/>"
                >
                  <c:out value="${oneProject.getTitle()}"
                /></a>
              </td>
              <td>
                <c:out value="${oneProject.getLeader().getFirstName()}" />
              </td>
              <td>
                <fmt:formatDate
                  value="${oneProject.getDueDate()}"
                  pattern="MMM d, yyyy"
                />
              </td>
              <td>
                <a
                  class="text-decoration-none text-success"
                  href="<c:url value='/join/${user.getId()}/${oneProject.getId()}'/>"
                >
                  Join Team</a
                >
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>