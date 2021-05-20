<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <h3 style="color: #1e90ff">Работа с заказами</h3>
            <input type="text" name="address" placeholder="Адрес">
            <input type="number" name="countProduct" placeholder="Кол-во продукции">
            <input type="text" name="delivery" placeholder="Тип доставки">
            <select name="choiceClient" class="selectpicker" data-style="btn-info">
                <#list clients as client>
                    <option value="${client.fio}">${client.fio}</option>
                </#list>
            </select>
            <select name="choiceProduct" class="selectpicker" data-style="btn-info">
                <#list products as product>
                    <option value="${product.model}">${product.model}</option>
                </#list>
            </select>
            <button class="btn btn-outline-primary" type="submit">Добавить</button>
        </form>
    </div>

    <form method="post" action="/order/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff">Поиск заказа по адресу</h3>
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
                        <th scope="col">Адрес</th>
                        <th scope="col">Кол-во продукта</th>
                        <th scope="col">Цена</th>
                        <th scope="col">Тип доставки</th>
                        <th scope="col">Фио клиента</th>
                        <th scope="col">Продукт</th>
                        <th scope="col">Статус</th>
                        <th scope="col" width="100">Редактирование</th>
                        <th scope="col" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list orders as order>
                        <tr>
                            <td>${order.address}</td>
                            <td>${order.countProduct}</td>
                            <td>${order.cost}</td>
                            <td>${order.delivery}</td>
                            <td>${order.fio}</td>
                            <td>${order.name}</td>
                            <td>${order.status}</td>
                            <td>
                                <form method="get" action="/order/${order.idOrder}">
                                    <button type="submit" class="btn btn-secondary">Изменить</button>
                                </form>
                            </td>
                            <td>
                                <form method="post" action="/order/deleteOrder">
                                    <input type="hidden" value="${order.idOrder}" name="orderId">
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