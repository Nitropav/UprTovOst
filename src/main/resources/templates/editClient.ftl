<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post" action="/client/show">
            <h3 style="color: #1e90ff">Редактирование информации о клиенте клиента</h3>
            <table  style="margin-top: 20px">
                <thead align="center">
                <tr>
                    <th scope="col" bgcolor="#ff7f50">ФИО</th>
                    <th scope="col" bgcolor="#ff7f50">Телефон</th>
                    <th scope="col" bgcolor="#ff7f50">Электронная почта</th>
                </tr>
                <tr align="center">
                    <th><input class="form-control" type="text" name="fio" value="${client.fio}"></th>
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