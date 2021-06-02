<#import "parts/common.ftl" as c>

<@c.page "none">
    <form method="post" action="/blockuser/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff; margin-left: 32%">Поиск пользователей по логину</h3>
        <input  class="text-form" style="margin-left: 41%" type="text" name="filter" placeholder="Логин"><br>
        <button class="gradient-button" style="margin-left: 43%" type="submit">Поиск</button>
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
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff" width="290">Блокировка | Разблокировка</th>
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
                                <form method="post" action="/blockuser/bl">
                                    <input type="hidden" value="${user.id}" name="userId">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button type="submit" class="gradient-button-grey">Блокировать | Разблокировать</button>
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