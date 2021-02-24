<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <h3 style="color: #1e90ff">Добаление пользователя</h3>
            <input type="text" name="username" placeholder="Логин">
            <input type="text" name="LNAME" placeholder="Фамилия">
            <input type="text" name="FNAME" placeholder="Имя">
            <input type="password" name="password" placeholder="Пароль">
            <input type="email" name="email" placeholder="example@gmail.com">
            <input type="checkbox" name="active" placeholder="Активность">
            <input type="text" name="roles" placeholder="Роль">
            <button class="btn btn-outline-primary" type="submit">Добавить</button>
        </form>
    </div>

    <form method="post" action="/createuser/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff">Поиск пользователей по логину</h3>
        <input type="text" name="filter">
        <button class="btn btn-outline-primary" type="submit">Поиск</button>
    </form>

    <div class="wrapper">
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div style="padding-top: 57px">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">Имя</th>
                        <th scope="col">Фамилия</th>
                        <th scope="col">Логин</th>
                        <th scope="col">Пароль</th>
                        <th scope="col">Электронная почта</th>
                        <th scope="col">Активность</th>
                        <th scope="col" width="100">Редактирование</th>
                        <th scope="col" width="100">Удаление</th>
                        <th scope="col" width="100">Блокировка</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list users as user>
                        <tr>
                            <td>${user.FNAME}</td>
                            <td>${user.LNAME}</td>
                            <td>${user.username}</td>
                            <td>${user.password}</td>
                            <td>${user.email}</td>
                            <td>${user.active?c}</td>
                            <td>
                                <form method="get" action="/createuser/${user.id}">
                                    <button type="submit" class="btn btn-secondary">Изменить</button>
                                </form>
                            </td>
                            <td>
                                <form method="post" action="/createuser/deleteUser">
                                    <input type="hidden" value="${user.id}" name="userId">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button class="btn btn-danger" type="submit">Удалить</button>
                                </form>
                            </td>
                            <td>
                                <form method="get" action="/createuser/${user.id}">
                                    <button type="submit" class="btn btn-secondary">Блокировать</button>
                                </form>
                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</@c.page>