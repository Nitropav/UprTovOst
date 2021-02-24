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
</@c.page>