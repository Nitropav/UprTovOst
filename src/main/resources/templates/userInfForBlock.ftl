<#import "parts/common.ftl" as c>

<@c.page "none">
    <form method="post" action="/blockuser/filter">
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
                        <th scope="col" bgcolor="#ff7f50">Имя</th>
                        <th scope="col" bgcolor="#ff7f50">Фамилия</th>
                        <th scope="col" bgcolor="#ff7f50">Логин</th>
                        <th scope="col" bgcolor="#ff7f50">Пароль</th>
                        <th scope="col" bgcolor="#ff7f50">Электронная почта</th>
                        <th scope="col" bgcolor="#ff7f50">Активность</th>
                        <th scope="col" bgcolor="#ff7f50" width="150">Блокировка | Разблокировка</th>
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
                            <#if user.active == true>
                                <td>Активен</td>
                            <#else>
                                <td>Не активен</td>
                            </#if>
                            <td>
                                <form method="post" action="/blockuser/bl">
                                    <input type="hidden" value="${user.id}" name="userId">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button type="submit" class="btn btn-secondary">Блокировать | Разблокировать</button>
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