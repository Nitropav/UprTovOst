<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <h3 style="color: #1e90ff;     margin-left: 35%;">Добаление нового продукта</h3>
            <input style="margin-left: 15%" class="text-form" type="text" name="model" placeholder="Модель">
            <input class="text-form"  type="number" name="price" placeholder="Цена">
            <input class="text-form"  type="text" name="typ" placeholder="Тип">
            <input class="text-form"  type="text" name="shell" placeholder="Размер">
            <input class="text-form"  type="text" name="kernel" placeholder="Тип стержня"><br>
            <button style="margin-left: 43%" class="gradient-button" type="submit">Добавить</button>
        </form>
    </div>

    <form method="post" action="/product/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff; margin-left: 35%">Поиск продуктов по модели</h3>
        <input style="margin-left: 42%" class="text-form"  type="text" name="filter" placeholder="Модель"><br>
        <button  style="margin-left: 44.5%" class="gradient-button" type="submit">Поиск</button>
    </form>

    <div class="wrapper">
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div style="padding-top: 57px">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Модель</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Цена</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Тип</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Размер</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Тип стержня</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff" width="100">Редактирование</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list products as product>
                        <tr>
                            <td style="border: 1px solid black"><strong>${product.model}</strong></td>
                            <td style="border: 1px solid black"><strong>${product.price}</strong></td>
                            <td style="border: 1px solid black"><strong>${product.typ}</strong></td>
                            <td style="border: 1px solid black"><strong>${product.shell}</strong></td>
                            <td style="border: 1px solid black"><strong>${product.kernel}</strong></td>
                            <td style="border: 1px solid black">
                                <form method="get" action="/product/${product.id}">
                                    <button type="submit" class="gradient-button-grey">Изменить</button>
                                </form>
                            </td>
                            <td style="border: 1px solid black">
                                <form method="post" action="/product/deleteProduct">
                                    <input type="hidden" value="${product.id}" name="productId">
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