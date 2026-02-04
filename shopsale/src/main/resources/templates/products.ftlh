<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="container-fluid">
        <div class="row">
            <!-- Ліва колонка - форма пошуку -->
            <div class="col-md-4">
                <h1 style="text-align: center">Search</h1>
                <hr>
                <form method="get" action="/">
                    <div class="form-row">
                        <div class="form-group col-12">
                            <label for="searchCity">City</label>
                            <select id="searchCity" name="city" class="form-control mb-2 mt-2">
                                <option value="">no city choose</option>
                                <option value="City1">City 1</option>
                                <option value="City2">City 2</option>
                                <option value="City3">City 3</option>
                                <option value="City4">City 4</option>
                                <option value="City5">City 5</option>
                            </select>
                        </div>
                        <div class="form-group col-12">
                            <label for="searchWord">Search in messages</label>
                            <input type="text" name="searchWord"
                                   <#if searchWord??>value="${searchWord}"</#if>
                                   class="form-control mb-2 mt-2" id="searchWord">
                        </div>
                        <div class="form-group col-12">
                            <button style="width: 100%" type="submit" class="btn btn-dark">search</button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="col-md-3"></div>

            <!-- Права колонка - продукти -->
            <div class="col-md-5">
                <div class="card-columns">
                    <#list products as product>
                        <a href="/product/${product.id}" class="product-link">
                            <div class="card text-white bg-dark my-0 product">
                                <img src="/images/${product.previewImageId}" class="card-img-top">
                                <div class="card-body">
                                    <h5 class="card-title">${product.title}</h5>
                                    <p class="card-text">${product.price} $</p>
                                </div>
                                <div class="card-footer">
                                    ${product.city}
                                </div>
                            </div>
                        </a>
                    <#else>
                        <h1 style="text-align: center">Nothing found</h1>
                    </#list>
                </div>
            </div>
        </div>
    </div>
</@t.template>