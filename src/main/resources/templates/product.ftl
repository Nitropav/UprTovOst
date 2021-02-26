<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <h3 style="color: #1e90ff">Добаление нового продукта</h3>
            <input type="text" name="model" placeholder="Модель">
            <input type="number" name="price" placeholder="Цена">
            <input type="text" name="typ" placeholder="Тип">
            <input type="text" name="shell" placeholder="Размер">
            <input type="text" name="kernel" placeholder="Тип стержня">
            <button class="btn btn-outline-primary" type="submit">Добавить</button>
        </form>
    </div>

    <form method="post" action="/product/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff">Поиск продуктов по модели</h3>
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
                        <th scope="col">Модель</th>
                        <th scope="col">Цена</th>
                        <th scope="col">Тип</th>
                        <th scope="col">Размер</th>
                        <th scope="col">Тип стержня</th>
                        <th scope="col" width="100">Редактирование</th>
                        <th scope="col" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list products as product>
                        <tr>
                            <td>${product.model}</td>
                            <td>${product.price}</td>
                            <td>${product.typ}</td>
                            <td>${product.shell}</td>
                            <td>${product.kernel}</td>
                            <td>
                                <form method="get" action="/product/${product.id}">
                                    <button type="submit" class="btn btn-secondary">Изменить</button>
                                </form>
                            </td>
                            <td>
                                <form method="post" action="/product/deleteProduct">
                                    <input type="hidden" value="${product.id}" name="productId">
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