@import cs3220stu44.attempt2.SessionStorage
@import cs3220stu44.attempt2.model.User

@param boolean loggedIn
@param User user
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Home</title>

</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
@if(loggedIn)
    <h1 class="h3 mb-3 fw-normal">welcome ${user.getName()}</h1>
    <p><a href="/logout"> log out</a> </p>

@else
    <h1 class="h3 mb-3 fw-normal"> log in please</h1>
    <p><a href="/login"> log in</a> </p>
@endif

</body>
</html>