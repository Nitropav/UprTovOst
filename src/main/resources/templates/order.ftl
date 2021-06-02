<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post" action="/order/create">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <h3 style="color: #1e90ff;     margin-left: 35%;">Добавление нового заказа</h3>
            <input style="margin-left: 15%" class="text-form" type="text" name="address" placeholder="Адрес">
            <input class="text-form" type="number" name="countProduct" placeholder="Кол-во продукции">
            <input class="text-form" type="text" name="delivery" placeholder="Тип доставки">
            <select class="text-form" name="choiceClient" class="selectpicker" data-style="btn-info">
                <#list clients as client>
                    <option value="${client.fio}">${client.fio}</option>
                </#list>
            </select>
            <select class="text-form" name="choiceProduct" class="selectpicker" data-style="btn-info">
                <#list products as product>
                    <option value="${product.model}">${product.model}</option>
                </#list>
            </select><br>
            <button style="margin-left: 43%" class="gradient-button" type="submit">Добавить</button>

        </form>
    </div>

    <form method="post" action="/order/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff;  margin-left: 36%;">Поиск заказа по адресу</h3>
        <input style="margin-left: 42%" class="text-form" type="text" name="filter" placeholder="Адрес"><br>
        <button style="margin-left: 45%" class="gradient-button" type="submit">Поиск</button>
    </form>

    <div class="wrapper">
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div style="padding-top: 57px">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Адрес</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Кол-во продукта</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Цена</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Тип доставки</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Фио клиента</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Продукт</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Статус</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff" width="100">Изменение статуса</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list orders as order>
                        <tr>
                            <td style="border: 1px solid black"><strong>${order.address}</strong></td>
                            <td style="border: 1px solid black"><strong>${order.countProduct}</strong></td>
                            <td style="border: 1px solid black"><strong>${order.cost}</strong></td>
                            <td style="border: 1px solid black"><strong>${order.delivery}</strong></td>
                            <td style="border: 1px solid black"><strong>${order.fio}</strong></td>
                            <td style="border: 1px solid black"><strong>${order.name}</strong></td>
                            <td style="border: 1px solid black"><strong>${order.status}</strong></td>
                            <td style="border: 1px solid black">
                                <form method="post" action="/order/done">
                                    <input type="hidden" value="${order.idOrder}" name="ordersId">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button type="submit" class="gradient-button-grey">Выполнено | Выполняется</button>
                                </form>
                            </td>
                            <td style="border: 1px solid black">
                                <form method="post" action="/order/deleteOrder">
                                    <input type="hidden" value="${order.idOrder}" name="orderId">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button class="gradient-button-red" type="submit">Удалить</button>
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