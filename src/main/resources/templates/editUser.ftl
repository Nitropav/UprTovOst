<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post" action="/createuser/show">
            <div style="margin-left: 15%; margin-bottom: 110px">
            <h3 style="color: #1e90ff; margin-left: 26%">Редактирование пользователя</h3>
            <table  style="margin-top: 20px">
                <thead align="center">
                <tr>
                    <th scope="col" bgcolor="#1e90ff">Имя</th>
                    <th scope="col" bgcolor="#1e90ff">Фамилия</th>
                    <th scope="col" bgcolor="#1e90ff">Логин</th>
                    <th scope="col" bgcolor="#1e90ff">Пароль</th>
                    <th scope="col" bgcolor="#1e90ff">Электронная почта</th>
                </tr>
                <tr align="center">
                    <th><input class="text-form" type="text" name="FNAME" value="${user.FNAME}"></th>
                    <th><input class="text-form" type="text" name="LNAME" value="${user.LNAME}"></th>
                    <th><input class="text-form" type="text" name="username" value="${user.username}"></th>
                    <th><input class="text-form" type="text" name="password" value="${user.password}"></th>
                    <th><input class="text-form" type="email" name="email" value="${user.email}"></th>
                </tr>
                </thead>
            </table>
            <input type="hidden" value="${user.id}" name="id">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="gradient-button-grey" style="margin-left: 37%">Изменить</button>
            </div>
        </form>
    </div>
</@c.page>