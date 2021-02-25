<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post" action="/client/show">
            <h3 style="color: #1e90ff">Редактирование клиента</h3>
            <table  style="margin-top: 20px">
                <thead align="center">
                <tr>
                    <th scope="col">Имя</th>
                    <th scope="col">Фамилия</th>
                    <th scope="col">Телефон</th>
                    <th scope="col">Электронная почта</th>
                </tr>
                <tr align="center">
                    <th><input class="form-control" type="text" name="fname" value="${client.fname}"></th>
                    <th><input class="form-control" type="text" name="lname" value="${client.lname}"></th>
                    <th><input class="form-control" type="text" name="phone" value="${client.phone}"></th>
                    <th><input class="form-control" type="email" name="email" value="${client.email}"></th>
                </tr>
                </thead>
            </table>
            <input type="hidden" value="${client.id}" name="id">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="btn btn-secondary">Изменить</button>
        </form>
    </div>
</@c.page>