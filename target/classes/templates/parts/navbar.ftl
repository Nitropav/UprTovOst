<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #ccfff7;">
    <a class="navbar-brand" href="/">УО</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/createuser">Создать пользователя</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/blockuser">Блокировка пользователей</a>
                </li>
            </#if>
            <#if name != "unknown" && !isAdmin>
                <div class="mr-3">
                    <form method="get" action="/client">
                        <input type="hidden" name="id_user" value="${id}">
                        <button class="btn btn-info" type="submit"> Работа с клиентами</button>
                    </form>
                </div>
                <div class="mr-3">
                    <form method="get" action="/product">
                        <input type="hidden" name="id_user" value="${id}">
                        <button class="btn btn-info" type="submit"> Работа с продуктом</button>
                    </form>
                </div>
                <div class="mr-3">
                    <form method="get" action="/production">
                        <input type="hidden" name="id_user" value="${id}">
                        <button class="btn btn-info" type="submit"> Работа с производством</button>
                    </form>
                </div>
                <div class="mr-3">
                    <form method="get" action="/">
                        <input type="hidden" name="id_user" value="${id}">
                        <button class="btn btn-info" type="submit"> Сохранение отчета</button>
                    </form>
                </div>
                <div class="mr-3">
                    <form method="get" action="/">
                        <input type="hidden" name="id_user" value="${id}">
                        <button class="btn btn-info" type="submit"> Прогнозирование спроса</button>
                    </form>
                </div>
                <div class="mr-3">
                    <form method="get" action="/order">
                        <input type="hidden" name="id_user" value="${id}">
                        <button class="btn btn-info" type="submit"> Формирование заказа</button>
                    </form>
                </div>
                <div class="mr-3">
                    <form method="get" action="/">
                        <input type="hidden" name="id_user" value="${id}">
                        <button class="btn btn-info" type="submit"> Управление остатком</button>
                    </form>
                </div>
            </#if>
        </ul>
        <#if name == "unknown">
            <a href="/login"> Войти </a>
        <#else>
            <div class="mr-4">${name}</div>
            <@l.logout />
        </#if>

    </div>
</nav>