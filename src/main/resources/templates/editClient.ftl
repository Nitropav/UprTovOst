<#import "parts/common.ftl" as c>

<@c.page "none">
    <div style="margin-left: 26%; margin-bottom: 110px">
        <form method="post" action="/client/show">
            <h3 style="color: #1e90ff; margin-left: 3%;">Редактирование информации о клиенте</h3>
            <table  style="margin-top: 20px">
                <thead align="center">
                <tr>
                    <th scope="col" bgcolor="#1e90ff">ФИО</th>
                    <th scope="col" bgcolor="#1e90ff">Телефон</th>
                    <th scope="col" bgcolor="#1e90ff">Электронная почта</th>
                </tr>
                <tr align="center">
                    <th><input class="text-form" type="text" name="fio" value="${client.fio}"></th>
                    <th><input class="text-form" type="text" name="phone" value="${client.phone}"></th>
                    <th><input class="text-form" type="email" name="email" value="${client.email}"></th>
                </tr>
                </thead>
            </table>
            <input type="hidden" value="${client.id}" name="id">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button style="margin-left: 20%" type="submit" class="gradient-button">Изменить</button>
        </form>
    </div>
</@c.page>