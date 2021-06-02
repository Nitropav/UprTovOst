<#import "parts/common.ftl" as c>

<@c.page "none">
    <div>
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <h3 style="color: #1e90ff; margin-left: 37%">Добаление нового клиента</h3>
            <input style="margin-left: 29%" class="text-form" type="text" name="fio" placeholder="ФИО">
            <input class="text-form" type="text" name="phone" placeholder="Телефон">
            <input class="text-form" type="email" name="email" placeholder="example@gmail.com"><br>
            <button style="margin-left: 44%" class="gradient-button" type="submit">Добавить</button>
        </form>
    </div>

    <form method="post" action="/client/filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <h3 style="color: #1e90ff; margin-left: 32%;">Поиск клиентов по номеру телефона</h3>
        <input style="margin-left: 43%" class="text-form" type="text" name="filter" placeholder="Телефон"><br>
        <button style="margin-left: 45%" class="gradient-button" type="submit">Поиск</button>
    </form>

    <div class="wrapper">
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div style="padding-top: 57px">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">ФИО</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Телефон</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff">Электронная почта</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff" width="100">Редактирование</th>
                        <th style="border: 1px solid black; text-align: center; font-size: 15px" scope="col" bgcolor="#1e90ff" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list clients as client>
                        <tr>
                            <td style="border: 1px solid black"><strong>${client.fio}</strong></td>
                            <td style="border: 1px solid black"><strong>${client.phone}</strong></td>
                            <td style="border: 1px solid black"><strong>${client.email}</strong></td>
                            <td style="border: 1px solid black">
                                <form method="get" action="/client/${client.id}">
                                    <button type="submit" class="gradient-button-grey">Изменить</button>
                                </form>
                            </td>
                            <td style="border: 1px solid black">
                                <form method="post" action="/client/deleteClient">
                                    <input type="hidden" value="${client.id}" name="clientId">
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
    validClient(${flagResult})
</script>