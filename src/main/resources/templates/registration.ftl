<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default" style="margin-top:45px">
                <div class="panel-heading">
                    <h3 class="panel-title">Заполните все поля</h3>
                </div>
                <div class="panel-body">
                    <form method="post" action="/registration">
                        <input name="${_csrf.parameterName}" value="${_csrf.token}" type="hidden">
                        <div class="form-group">
                            <label for="username">Логин</label>
                            <input type="text" class="form-control" id="username" placeholder="Логин"
                                   name="username">
                        </div>
                        <div class="form-group">
                            <label for="password">Пароль</label>
                            <input type="password" class="form-control" id="password" placeholder="Пароль"
                                   name="password">
                        </div>
                        <div class="form-group">
                            <label for="FNAME">Имя</label>
                            <input type="text" class="form-control" id="FNAME" placeholder="Имя"
                                   name="FNAME">
                        </div>
                        <div class="form-group">
                            <label for="LNAME">Фамилия</label>
                            <input type="text" class="form-control" id="LNAME" placeholder="Фамилия"
                                   name="LNAME">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" placeholder="example@gmail.com"
                                   name="email">
                        </div>
                        <button type="submit" class="btn btn-default" style="margin-left: 35%;margin-right: 20%">Регистрация</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>