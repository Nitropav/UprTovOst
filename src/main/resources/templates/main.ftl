<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page "/static/mers.jpg">

    <div class="row">

        <div class="col-lg-3 new-col-lg-3">
            <div class="product-item">
                <div>
                    <img src="/static/diagnostic.jpg" class="img-resp">
                </div>
                <h4><a class="text-in_block"> Продукция </a></h4>
                <div class="add-to-card-btn">
                    <a href="/about#diagnostic" class="btn btn-danger text-font">
                        Подробнее
                    </a>
                </div>
            </div>
        </div>

        <div class="col-lg-3 new-col-lg-3">
            <div class="product-item">
                <div>
                    <img src="/static/repair.jpg" class="img-resp">
                </div>
                <h4><a class="text-in_block"> Остатки </a></h4>
                <div class="add-to-card-btn">
                    <a href="/about#repair" class="btn btn-danger text-font">
                        Подробнее
                    </a>
                </div>
            </div>
        </div>

        <div class="col-lg-3 new-col-lg-3">
            <div class="product-item">
                <div>
                    <img src="/static/look.jpg" class="img-resp">
                </div>
                <h4><a class="text-in_block"> Спрос </a></h4>
                <div class="add-to-card-btn">
                    <a href="/about#look" class="btn btn-danger text-font">
                        Подробнее
                    </a>
                </div>
            </div>
        </div>

        <div class="col-lg-3 new-col-lg-3">
            <div class="product-item">
                <div>
                    <img src="/static/clear.jpg"img-resp">
                </div>
                <h4><a class="text-in_block"> Заказы </a></h4>
                <div class="add-to-card-btn">
                    <a href="/about#wash" class="btn btn-danger text-font">
                        Подробнее
                    </a>
                </div>
            </div>
        </div>

    </div>


</@c.page>