<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <h3 style="color: #1e90ff">Добаление нового клиента</h3>
            <input type="text" name="fname" placeholder="Имя">
            <input type="text" name="lname" placeholder="Фамилия">
            <input type="text" name="phone" placeholder="Телефон">
            <input type="email" name="email" placeholder="example@gmail.com">
            <button class="btn btn-outline-primary" type="submit">Добавить</button>
        </form>
    </div>

    <form method="post" action="/client/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff">Поиск клиентов по номеру телефона</h3>
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
                        <th scope="col">Телефон</th>
                        <th scope="col">Электронная почта</th>
                        <th scope="col" width="100">Редактирование</th>
                        <th scope="col" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list clients as client>
                        <tr>
                            <td>${client.fname}</td>
                            <td>${client.lname}</td>
                            <td>${client.phone}</td>
                            <td>${client.email}</td>
                            <td>
                                <form method="get" action="/client/${client.id}">
                                    <button type="submit" class="btn btn-secondary">Изменить</button>
                                </form>
                            </td>
                            <td>
                                <form method="post" action="/client/deleteClient">
                                    <input type="hidden" value="${client.id}" name="clientId">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button class="btn btn-danger" type="submit">Удалить</button>
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