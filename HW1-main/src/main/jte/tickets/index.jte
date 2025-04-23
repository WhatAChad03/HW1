@import cs3220stu44.attempt2.model.Ticket
@import java.util.List

@param List<Ticket> tickets
@param java.text.SimpleDateFormat dateFormat
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
            <td class="d-none d-md-table-cell">${ticket.getAssignee() != null ? ticket.getAssignee().getName() : "None"}</td>
            <td>
                @if (ticket.getStatus().equals("Open"))
                    <span class="text-success">Open</span>
                @elseif (ticket.getStatus().equals("Closed"))
                    <span class="text-danger">Closed</span>
                @else
                    <span class="text-success">${ticket.getStatus()}</span>
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