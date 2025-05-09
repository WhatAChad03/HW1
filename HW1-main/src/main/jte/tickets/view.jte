@import cs3220stu44.attempt2.model.Ticket
@import cs3220stu44.attempt2.model.Comment
@import java.util.List
@param java.time.format.DateTimeFormatter dateFormat
@param Ticket ticket
@param List<Comment> comments
@param boolean showCloseButton
@param cs3220stu44.attempt2.model.User sessionUser

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #343a40;
            color: #f8f9fa;
        }
        .navbar, .breadcrumb, .card, .table-dark {
            background-color: #212529;
        }
        .navbar-brand, .nav-link, .breadcrumb-item a {
            color: #f8f9fa;
        }
        .navbar-brand:hover, .nav-link:hover, .breadcrumb-item a:hover {
            color: #adb5bd;
        }
        .table-light {
            background-color: #495057;
        }
        .list-group-item {
            background-color: #495057;
            color: #f8f9fa;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        #footer {
            color: #adb5bd;
        }
    </style>
    <title>Ticket ${ticket.getTixNum()}</title>
</head>
<body>
<%--header items--%>
<nav class="navbar navbar-expand-lg mb-1">
    <div class="container-fluid">
        <div>
            <img src="/customer-support.png" alt="Site Logo" height="30">
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
                    <a href="#" class="nav-link">Users</a>
                </li>
                <li class="nav-item">
                    <a href="/logout" class="nav-link">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="/tickets" class="btn btn-primary ms-3">Tickets</a>
        </li>
    </ol>
</nav>

<div class="container">
    <table class="table table-dark">
        <thead>
        <tr>
            <th scope="col">Ticket #${ticket.getTixNum()}</th>
            <th scope="col">${ticket.getSubject()}</th>
        </tr>
        </thead>
        <tbody>
        <tr class="table-light">
            <td>Category:</td>
            <td>${ticket.getCategory()}</td>
        </tr>
        <tr class="table-light">
            <td>Status:</td>
            <td>${ticket.getStatus()}</td>
        </tr>
        <tr class="table-light">
            <td>Details:</td>
            <td>${ticket.getDetails()}</td>
        </tr>
        <tr class="table-light">
            <td>Requester:</td>
            <td>${ticket.getRequester().getName()}</td>
        </tr>
        <tr class="table-light">
            <td>Date Submitted:</td>
            <td>${dateFormat.format(ticket.getSubmitDate())}</td>
        </tr>
        <tr class="table-light">
            <td>Assigned To:</td>
            <td>${ticket.getAssignee() != null ? ticket.getAssignee().getName() : "None"}</td>
        </tr>
        </tbody>
    </table>
</div>

<%--add comment--%>
<div class="container-sm list-group">
    @if(comments == null || comments.isEmpty())
        <div class="list-group-item text-muted">
            No Comments Yet
        </div>
    @else
        @for(Comment comment : comments)
            <div class="list-group-item">
                <div class="d-flex w-100 justify-content-between">
                    <h6 class="mb-1">${comment.getAuthor().getName()}</h6>
                    <small class="text-muted">${dateFormat.format(comment.getDate())}</small>
                </div>
                <p class="mb-1">${comment.getComment()}</p>
            </div>
        @endfor
    @endif
</div>

<br>

<div class="container-sm card mb-4">
    <div class="card-body">
        @if ("Closed".equalsIgnoreCase(ticket.getStatus()))
            <div class="alert alert-secondary" role="alert">
                <p>This ticket is closed. No further comments can be added.</p>

            </div>
        @else
            <form method="post" action="/tickets/${ticket.getTixNum()}/comments">
                <div class="mb-3">
                    <label for="commentText" class="form-label">Add Comment</label>
                    <textarea class="form-control" id="commentText" name="comments" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit Comment</button>
            </form>
        @endif

        @if (showCloseButton) {
            <form action="/tickets/${ticket.getTixNum()}/close" method="get">
                <button type="submit" class="btn btn-danger">Close Ticket</button>
            </form>
            } @endif


    </div>
</div>

<%--footer--%>
<div id="footer" class="text-center mt-4">
    <footer>Copyright &copy MyTickets 2025 <br> Customer Service icon is created by <a href="https://www.flaticon.com/authors/freepik">Freepik</a>
        from <a href="https://www.flaticon.com/">Flaticon</a></footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>