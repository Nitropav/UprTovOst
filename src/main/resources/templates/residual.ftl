<#import "parts/common.ftl" as c>

<@c.page "none">

    <form method="post" action="/residual/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff">Поиск остатка по модели продукта</h3>
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
                        <th scope="col" bgcolor="#ff7f50">Продукт</th>
                        <th scope="col" bgcolor="#ff7f50">Количество единиц на складе</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list residuals as residual>
                        <tr>
                            <td>${residual.name}</td>
                            <td>${residual.count}</td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</@c.page>