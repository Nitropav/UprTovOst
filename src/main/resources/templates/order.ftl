<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post" action="/order/create">
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
                        <th scope="col" bgcolor="#ff7f50">Адрес</th>
                        <th scope="col" bgcolor="#ff7f50">Кол-во продукта</th>
                        <th scope="col" bgcolor="#ff7f50">Цена</th>
                        <th scope="col" bgcolor="#ff7f50">Тип доставки</th>
                        <th scope="col" bgcolor="#ff7f50">Фио клиента</th>
                        <th scope="col" bgcolor="#ff7f50">Продукт</th>
                        <th scope="col" bgcolor="#ff7f50">Статус</th>
                        <th scope="col" bgcolor="#ff7f50" width="100">Изменение статуса</th>
                        <th scope="col" bgcolor="#ff7f50" width="100">Удаление</th>
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
                                <form method="post" action="/order/done">
                                    <input type="hidden" value="${order.idOrder}" name="ordersId">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button type="submit" class="btn btn-secondary">Выполнено | Выполняется</button>
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
<script>
    showMessage(${flagResult})
</script>