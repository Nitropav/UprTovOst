<#import "parts/common.ftl" as c>

<@c.page "none">
    <div style="margin-left: 15%; margin-bottom: 110px">
        <form method="post" action="/product/show">
            <h3 style="color: #1e90ff; margin-left: 20%">Редактирование информации о продукте</h3>
            <table  style="margin-top: 20px">
                <thead align="center">
                <tr>
                    <th scope="col" bgcolor="#1e90ff">Модель</th>
                    <th scope="col" bgcolor="#1e90ff">Цена</th>
                    <th scope="col" bgcolor="#1e90ff">Тип</th>
                    <th scope="col" bgcolor="#1e90ff">Размер</th>
                    <th scope="col" bgcolor="#1e90ff">Тип стержня</th>
                </tr>
                <tr align="center">
                    <th><input class="text-form" type="text" name="model" value="${product.model}"></th>
                    <th><input class="text-form" type="number" name="price" value="${product.price}"></th>
                    <th><input class="text-form" type="text" name="typ" value="${product.typ}"></th>
                    <th><input class="text-form" type="text" name="shell" value="${product.shell}"></th>
                    <th><input class="text-form" type="text" name="kernel" value="${product.kernel}"></th>
                </tr>
                </thead>
            </table>
            <input type="hidden" value="${product.id}" name="id">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button style="margin-left: 35%" type="submit" class="gradient-button">Изменить</button>
        </form>
    </div>
</@c.page>