<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <h3 style="color: #1e90ff;     margin-left: 35%;">Добаление данных о производстве</h3>
            <input style="margin-left: 36%" class="text-form" type="date" name="datetime" placeholder="Дата">
                <select class="text-form" name="choiceProduct" class="selectpicker" data-style="btn-info">
                    <#list products as product>
                        <option value="${product.model}">${product.model}</option>
                    </#list>
                </select>
            <input class="text-form" type="number" name="countProduction" placeholder="Количество"><br>
            <button style="margin-left: 46%" class="gradient-button" type="submit">Добавить</button>
        </form>
    </div>

    <form method="post" action="/production/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff; margin-left: 33.5%">Поиск данных о производстве по дате</h3>
        <input style="margin-left: 45.5%" class="text-form" type="text" name="filter" placeholder="Дата"><br>
        <button style="margin-left: 47.5%" class="gradient-button" type="submit">Поиск</button>
    </form>

    <div class="wrapper">
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div style="padding-top: 57px">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Дата</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Модель</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Количество</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list productions as production>
                        <tr>
                            <td style="border: 1px solid black"><strong>${production.datetime}</strong></td>
                            <td style="border: 1px solid black"><strong>${production.name}</strong></td>
                            <td style="border: 1px solid black"><strong>${production.countProduction}</strong></td>
                            <td style="border: 1px solid black">
                                <form method="post" action="/production/deleteProduction">
                                    <input type="hidden" value="${production.id}" name="productionId">
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
    validProduction(${flagResult})
</script>