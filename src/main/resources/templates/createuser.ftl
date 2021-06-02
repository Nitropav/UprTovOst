<#import "parts/common.ftl" as c>

<@c.page "none">
    <div class="add-div">
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <h3 style="color: #1e90ff; margin-left: 30%; margin-bottom: 20px">Добаление нового пользователя</h3>
            <input class="text-form" type="text" name="username" placeholder="Логин">
            <input class="text-form" type="text" name="LNAME" placeholder="Фамилия">
            <input class="text-form" type="text" name="FNAME" placeholder="Имя">
            <input class="text-form" type="password" name="password" placeholder="Пароль">
            <input class="text-form" type="email" name="email" placeholder="example@gmail.com">
            <input class="text-form" type="text" name="roles" placeholder="Роль">
            <button class="gradient-button" type="submit" style="margin-left: 40%">Добавить</button>
        </form>
    </div>

    <form method="post" action="/createuser/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff; margin-top: 30px; margin-left: 30%">Поиск пользователей по логину</h3>
        <input class="text-form" type="text" name="filter" placeholder="Логин" style="margin-left: 40%"><br>
        <button class="gradient-button" type="submit" style="margin-left: 41.5%">Поиск</button>
    </form>

    <div class="wrapper">
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div style="padding-top: 57px">
                <table style="border-collapse: collapse" class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Имя</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Фамилия</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Логин</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Пароль</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Электронная почта</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Активность</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff" width="100">Редактирование</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list users as user>
                        <tr>
                            <td style="border: 1px solid black"><strong>${user.FNAME}</strong></td>
                            <td style="border: 1px solid black"><strong>${user.LNAME}</strong></td>
                            <td style="border: 1px solid black"><strong>${user.username}</strong></td>
                            <td style="border: 1px solid black"><strong>${user.password}</strong></td>
                            <td style="border: 1px solid black"><strong>${user.email}</strong></td>
                            <#if user.active == true>
                                <td style="border: 1px solid black"><strong>Активен</strong></td>
                            <#else>
                                <td style="border: 1px solid black"><strong>Не активен</strong></td>
                            </#if>
                            <td style="border: 1px solid black">
                                <form method="get" action="/createuser/${user.id}">
                                    <button type="submit" class="gradient-button-grey">Изменить</button>
                                </form>
                            </td>
                            <td style="border: 1px solid black">
                                <form method="post" action="/createuser/deleteUser">
                                    <input type="hidden" value="${user.id}" name="userId">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button class="gradient-button-red" type="submit">Удалить</button>
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
<script>
    validUser(${flagResult})
</script>