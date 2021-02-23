<#import "parts/common.ftl" as c>

<@c.page "none">
<div>
    <form method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff">Добаление мастера</h3>
        <input type="text" name="fIO" placeholder="ФИО">
        <input type="date" name="date_of_birth" placeholder="Дата рождения">
        <input type="number" name="category" placeholder="Категория">
        <input type="number" name="profile" placeholder="Профиль">
        <input type="text" maxlength="4" name="year_start_working" placeholder="Год приема на работу">
        <button class="btn btn-outline-primary" type="submit">Добавить</button>
    </form>
</div>
</@c.page>