<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <h3 style="color: #1e90ff">Добаление данных о производстве</h3>
            <input type="date" name="datetime" placeholder="Дата">
                <select name="choiceProduct" class="selectpicker" data-style="btn-info">
                    <#list products as product>
                        <option value="${product.model}">${product.model}</option>
                    </#list>
                </select>
            <input type="number" name="countProduction" placeholder="Количество">
            <button class="btn btn-outline-primary" type="submit">Добавить</button>
        </form>
    </div>

    <form method="post" action="/production/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff">Поиск данных о производстве по дате</h3>
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
                        <th scope="col" bgcolor="#ff7f50">Дата</th>
                        <th scope="col" bgcolor="#ff7f50">Модель</th>
                        <th scope="col" bgcolor="#ff7f50">Количество</th>
                        <th scope="col" bgcolor="#ff7f50" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list productions as production>
                        <tr>
                            <td>${production.datetime}</td>
                            <td>${production.name}</td>
                            <td>${production.countProduction}</td>
                            <td>
                                <form method="post" action="/production/deleteProduction">
                                    <input type="hidden" value="${production.id}" name="productionId">
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