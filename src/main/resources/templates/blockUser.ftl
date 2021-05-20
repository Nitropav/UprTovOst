<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post" action="/blockuser">
            <h3 style="color: #1e90ff">Блокировка пользователя</h3>
            <table  style="margin-top: 20px">
                <thead align="center">
                <tr>
                    <th scope="col">Активен</th>
                </tr>
                <tr align="center">
                    <th><input class="form-control" type="text" name="active" value="${user.active?c}"></th>
                </tr>
                </thead>
            </table>
            <input type="hidden" value="${user.id}" name="id">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="btn btn-secondary">Сохранить</button>
        </form>
    </div>
</@c.page>