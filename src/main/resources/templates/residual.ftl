<#import "parts/common.ftl" as c>

<@c.page "none">

    <form method="post" action="/residual/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff;  margin-left: 37%;">Поиск остатка по модели продукта</h3>
        <input style="margin-left: 48%" class="text-form" type="text" name="filter" placeholder="Модель"><br>
        <button style="margin-left: 50%" class="gradient-button" type="submit">Поиск</button>
    </form>

    <div class="wrapper">
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div style="padding-top: 57px">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Продукт</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Количество единиц на складе</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list residuals as residual>
                        <tr>
                            <td style="border: 1px solid black"><strong>${residual.name}</strong></td>
                            <td style="border: 1px solid black"><strong>${residual.count}</strong></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</@c.page>