@import cs3220stu44.attempt2.model.Ticket
@import java.util.List
@param List<Ticket> tickets
@param java.time.format.DateTimeFormatter dateFormat
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style> #footer{color: grey; }</style>
    <title>List Tickets</title>
</head>

<body class="container-fluid">
<%--header items--%>
<nav class="navbar navbar-expand-lg bg-body-tertiary mb-1">
    <div class="container-fluid">
        <div>
            <img src="customer-support.png" alt="Site Logo" height="30">
            <a class="navbar-brand ms-2 fw-semibold d-inline">My Tickets</a>
        </div>

        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="#navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a href="/tickets" class="nav-link" aria-current="page">Tickets</a>
                </li>
                <li class="nav-item">
                    <a href="#"class="nav-link">Users</a>
                </li>
                <li class="nav-item">
                    <a href="/logout" class="nav-link">Logout</a>
                </li>
            </ul>
        </div>

    </div>
</nav>

<a href="/tickets/create" class="btn btn-primary my-1">Create Ticket</a>

<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Ticket #</th>
        <th scope="col" class="d-none d-md-table-cell">Category</th>
        <th scope="col">Subject</th>
        <th scope="col" class="d-none d-md-table-cell">Requester</th>
        <th scope="col" class="d-none d-md-table-cell">Date Submitted</th>
        <th scope="col" class="d-none d-md-table-cell">Assigned To</th>
        <th scope="col">Status</th>
    </tr>
    </thead>
    <tbody>

    @for (Ticket ticket : tickets)
        <tr>
            <td>${ticket.getTixNum()}</td>
            <td class="d-none d-md-table-cell">${ticket.getCategory()}</td>

            <td><a href="/tickets/${ticket.getTixNum()}">${ticket.getSubject()}</a></td>

            <td class="d-none d-md-table-cell">${ticket.getRequester().getName()}</td>

            <td class="d-none d-md-table-cell">${dateFormat.format(ticket.getSubmitDate())}</td>
            <td class="d-none d-md-table-cell">
                @if (ticket.getAssignee() != null)
                    ${ticket.getAssignee().getName()}
                @else
                    None
                @endif
            </td>
            <td>
                @if (ticket.getStatus() != null)
                    <span class="text-success">${ticket.getStatus()}</span>
                @else
                    <span class="text-muted">Unknown</span>
                @endif

            </td>
        </tr>
    @endfor
    </tbody>
</table>

<%--footer--%>
<div id="footer" class="text-center mt-4">
    <footer>Copyright &copy MyTickets 2025 <br> Customer Service icon is created by <a href="https://www.flaticon.com/authors/freepik">Freepik</a>
        from <a href="https://www.flaticon.com/">Flaticon</a></footer>
</div>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
</body>
</html>

<%--@import cs3220stu44.attempt2.model.Ticket--%>
<%--@import cs3220stu44.attempt2.model.Comment--%>
<%--@import cs3220stu44.attempt2.model.User--%>
<%--@import java.util.List--%>
<%--@param java.time.format.DateTimeFormatter dateFormat--%>
<%--@param Ticket ticket--%>
<%--@param List<Comment> comments--%>
<%--    @param List<User> availableTechnicians--%>
<%--        <!doctype html>--%>
<%--        <html lang="en">--%>
<%--        <head>--%>
<%--            <meta charset="UTF-8">--%>
<%--            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">--%>
<%--            <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
<%--            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">--%>
<%--            <style>--%>
<%--                body {--%>
<%--                    background-color: #343a40;--%>
<%--                    color: #f8f9fa;--%>
<%--                }--%>
<%--                .navbar, .breadcrumb, .card, .table-dark {--%>
<%--                    background-color: #212529;--%>
<%--                }--%>
<%--                .navbar-brand, .nav-link, .breadcrumb-item a {--%>
<%--                    color: #f8f9fa;--%>
<%--                }--%>
<%--                .navbar-brand:hover, .nav-link:hover, .breadcrumb-item a:hover {--%>
<%--                    color: #adb5bd;--%>
<%--                }--%>
<%--                .table-light {--%>
<%--                    background-color: #495057;--%>
<%--                }--%>
<%--                .list-group-item {--%>
<%--                    background-color: #495057;--%>
<%--                    color: #f8f9fa;--%>
<%--                }--%>
<%--                .btn-primary {--%>
<%--                    background-color: #007bff;--%>
<%--                    border-color: #007bff;--%>
<%--                }--%>
<%--                .btn-primary:hover {--%>
<%--                    background-color: #0056b3;--%>
<%--                    border-color: #0056b3;--%>
<%--                }--%>
<%--                #footer {--%>
<%--                    color: #adb5bd;--%>
<%--                }--%>
<%--            </style>--%>
<%--            <title>Ticket ${ticket.getTixNum()}</title>--%>
<%--        </head>--%>
<%--        <body>--%>
<%--        --%><%--header items--%>
<%--        <nav class="navbar navbar-expand-lg mb-1">--%>
<%--            <div class="container-fluid">--%>
<%--                <div>--%>
<%--                    <img src="/customer-support.png" alt="Site Logo" height="30">--%>
<%--                    <a class="navbar-brand ms-2 fw-semibold d-inline">My Tickets</a>--%>
<%--                </div>--%>

<%--                <button--%>
<%--                        class="navbar-toggler"--%>
<%--                        type="button"--%>
<%--                        data-bs-toggle="collapse"--%>
<%--                        data-bs-target="#navbarSupportedContent"--%>
<%--                        aria-controls="#navbarSupportedContent"--%>
<%--                        aria-expanded="false"--%>
<%--                        aria-label="Toggle navigation"--%>
<%--                >--%>
<%--                    <span class="navbar-toggler-icon"></span>--%>
<%--                </button>--%>
<%--                <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
<%--                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">--%>
<%--                        <li class="nav-item">--%>
<%--                            <a href="/tickets" class="nav-link" aria-current="page">Tickets</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a href="#" class="nav-link">Users</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a href="/logout" class="nav-link">Logout</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </nav>--%>

<%--        <nav aria-label="breadcrumb">--%>
<%--            <ol class="breadcrumb">--%>
<%--                <li class="breadcrumb-item">--%>
<%--                    <a href="/tickets" class="btn btn-primary ms-3">Tickets</a>--%>
<%--                </li>--%>
<%--            </ol>--%>
<%--        </nav>--%>

<%--        <div class="container">--%>
<%--            <table class="table table-dark">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th scope="col">Ticket #${ticket.getTixNum()}</th>--%>
<%--                    <th scope="col">${ticket.getSubject()}</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <tr class="table-light">--%>
<%--                    <td>Category:</td>--%>
<%--                    <td>${ticket.getCategory()}</td>--%>
<%--                </tr>--%>
<%--                <tr class="table-light">--%>
<%--                    <td>Status:</td>--%>
<%--                    <td>${ticket.getStatus()}</td>--%>
<%--                </tr>--%>
<%--                <tr class="table-light">--%>
<%--                    <td>Details:</td>--%>
<%--                    <td>${ticket.getDetails()}</td>--%>
<%--                </tr>--%>
<%--                <tr class="table-light">--%>
<%--                    <td>Requester:</td>--%>
<%--                    <td>${ticket.getRequester().getName()}</td>--%>
<%--                </tr>--%>
<%--                <tr class="table-light">--%>
<%--                    <td>Date Submitted:</td>--%>
<%--                    <td>${dateFormat.format(ticket.getSubmitDate())}</td>--%>
<%--                </tr>--%>
<%--                </tbody>--%>
<%--            </table>--%>
<%--        </div>--%>

<%--        --%><%--add comment--%>
<%--        <div class="container-sm list-group">--%>
<%--            @if(comments == null || comments.isEmpty())--%>
<%--                <div class="list-group-item text-muted">--%>
<%--                    No Comments Yet--%>
<%--                </div>--%>
<%--            @else--%>
<%--                @for(Comment comment : comments)--%>
<%--                    <div class="list-group-item">--%>
<%--                        <div class="d-flex w-100 justify-content-between">--%>
<%--                            <h6 class="mb-1">${comment.getAuthor().getName()}</h6>--%>
<%--                            <small class="text-muted">${dateFormat.format(comment.getDate())}</small>--%>
<%--                        </div>--%>
<%--                        <p class="mb-1">${comment.getComment()}</p>--%>
<%--                    </div>--%>
<%--                @endfor--%>
<%--            @endif--%>
<%--        </div>--%>

<%--        <br>--%>

<%--        <!-- Only show the comment section if the ticket is not closed -->--%>
<%--        @if(ticket.getStatus() != 'Closed')--%>
<%--            <div class="container-sm card mb-4">--%>
<%--                <div class="card-body">--%>
<%--                    <form method="post" action="/tickets/${ticket.getTixNum()}/comments">--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="commentText" class="form-label text-white">--%>
<%--                                Add Comment--%>
<%--                            </label>--%>
<%--                            <textarea class="form-control" id="commentText"--%>
<%--                                      name="comments"--%>
<%--                                      rows="3"--%>
<%--                                      required--%>
<%--                            ></textarea>--%>
<%--                        </div>--%>
<%--                        <button type="submit" class="btn btn-primary">Submit Comment</button>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        @endif--%>

<%--        <!-- Only show technician actions if the user is a technician and the ticket is not closed -->--%>
<%--        @if(sessionUser.isTechnician() && ticket.getStatus() != 'Closed')--%>
<%--            <div class="container-sm">--%>
<%--                <form method="post" action="/tickets/${ticket.getTixNum()}/assign">--%>
<%--                    <div class="mb-3">--%>
<%--                        <label for="technicianSelect" class="form-label text-white">Assign Technician</label>--%>
<%--                        <select name="assigneeId" id="technicianSelect" class="form-control">--%>
<%--                            <!-- Assuming availableTechnicians is a list of technicians -->--%>
<%--                            @for(User technician : availableTechnicians)--%>
<%--                                <option value="${technician.getId()}">${technician.getName()}</option>--%>
<%--                            @endfor--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <button type="submit" class="btn btn-primary">Assign Technician</button>--%>
<%--                </form>--%>

<%--                <form method="get" action="/tickets/${ticket.getTixNum()}/close">--%>
<%--                    <button type="submit" class="btn btn-danger mt-2">Close Ticket</button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        @endif--%>

<%--        --%><%--footer--%>
<%--        <div id="footer" class="text-center mt-4">--%>
<%--            <footer>Copyright &copy MyTickets 2025 <br> Customer Service icon is created by <a href="https://www.flaticon.com/authors/freepik">Freepik</a>--%>
<%--                from <a href="https://www.flaticon.com/">Flaticon</a></footer>--%>
<%--        </div>--%>

<%--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>--%>
<%--        </body>--%>
<%--        </html>--%>
