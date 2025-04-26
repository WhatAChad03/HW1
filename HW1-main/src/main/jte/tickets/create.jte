@import cs3220stu44.attempt2.model.User
@import java.util.List
@param User currentUser
@param List<User> availableTechnicians

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        #footer{
            color: grey;
        }
        #btnCancel, #btnCreate{
            display: inline-block;
            vertical-align: top;
        }
    </style>
    <title>Create Ticket</title>
</head>
<body class="container-fluid">
<%--header items--%>
<nav class="navbar navbar-expand-lg bg-body-tertiary mb-1">
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
                    <a href="#"class="nav-link">Users</a>
                </li>
                <li class="nav-item">
                    <a href="/logout" class="nav-link">Logout</a>
                </li>
            </ul>
        </div>

    </div>
</nav>

<%--breadcrumb--%>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/tickets">Tickets</a></li>
        <li class="breadcrumb-item active" aria-current="page">Create Ticket</li>
    </ol>
</nav>

<%--create form--%>
<form class="row g-3" action="/tickets/create" method="post">
    <div class="col-lg-4">
        <div class="mb-3">
            <label for="assignee" class="form-label">Assign To</label>
            <select class="form-select" id="assignee" name="assigneeId">
                @if(availableTechnicians != null && !availableTechnicians.isEmpty())
                    @for(User tech : availableTechnicians)
                        <option value="${tech.getId()}">${tech.getName()}</option>
                    @endfor
                @else
                    <option>No technicians available</option>
                @endif
            </select>
        </div>

<%--        <div class="col-md-11">--%>
<%--            <label for="inputEmail" class="form-label">Email</label>--%>
<%--            <input type="email" class="form-control" id="inputEmail"--%>
<%--                   name="requesterEmail"--%>
<%--                   value="${currentUser.getEmail()}"--%>
<%--                   readonly>--%>
<%--        </div>--%>

    </div>

    <div class="col-lg-8">
        <div class="col-md-15">
            <label for="inputState" class="form-label">Category</label>
            <select id="inputState" class="form-select" name="category" required>
                <option value = "" selected disabled>Choose...</option>
                <option value = "Software">Software</option>
                <option value = "Hardware">Hardware</option>
                <option value = "Facilities">Facilities</option>
            </select>
        </div>

        <div class="col-md-15">
            <label for="inputSubject" class="form-label">Subject</label>
            <input type="text" class="form-control" id="inputSubject" name="subject" required>
        </div>

        <div class="col-md-15 mb-4">
            <label for="inputDetails" class="form-label">Details</label>
            <textarea class="form-control" id="inputDetails" rows="5" name="details" required></textarea>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <button id="btnCancel" type="button" class="btn btn-secondary">Cancel</button>
                <button id="btnCreate" type="submit" class="btn btn-primary">Create</button>
            </div>
        </div>
    </div>
</form>

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
