<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post" action="/client/show">
            <h3 style="color: #1e90ff">Редактирование информации о продукте</h3>
            <table  style="margin-top: 20px">
                <thead align="center">
                <tr>
                    <th scope="col">Модель</th>
                    <th scope="col">Цена</th>
                    <th scope="col">Тип</th>
                    <th scope="col">Размер</th>
                    <th scope="col">Тип стержня</th>
                </tr>
                <tr align="center">
                    <th><input class="form-control" type="text" name="model" value="${product.model}"></th>
                    <th><input class="form-control" type="number" name="price" value="${product.price}"></th>
                    <th><input class="form-control" type="text" name="typ" value="${product.typ}"></th>
                    <th><input class="form-control" type="text" name="shell" value="${product.shell}"></th>
                    <th><input class="form-control" type="text" name="kernel" value="${product.kernel}"></th>
                </tr>
                </thead>
            </table>
            <input type="hidden" value="${product.id}" name="id">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="btn btn-secondary">Изменить</button>
        </form>
    </div>
</@c.page>