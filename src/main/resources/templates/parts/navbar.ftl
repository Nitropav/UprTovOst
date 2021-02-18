<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #ccfff7;">
    <a class="navbar-brand" href="/">Управление остатками</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <#if name == "unknown">
            <a href="/login"> Войти </a>
        <#else>
            <#if !isWorker && !isAdmin>
                <div class="nav-item mr-4">
                    <form method="get" action="/carlist">
                        <input type="hidden" name="id" value="${id}">
                        <button class="btn btn-primary" type="submit"> Мои машины</button>
                    </form>
                </div>
            </#if>
            <div class="mr-4">${name}</div>
            <@l.logout />
        </#if>

    </div>
</nav>