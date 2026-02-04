<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="row justify-content-center">
    <div class="col-md-4 col-lg-6 col-xl-6">
    <div class="text-center p-4 bg-light rounded shadow-sm">
    <div class="container">
        <!-- Карусель Bootstrap 5 -->
        <div id="myCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <#list images as image>
                    <button type="button" data-bs-target="#myCarousel"
                            data-bs-slide-to="${image?index}"
                            <#if image?is_first>class="active"</#if>>
                    </button>
                </#list>
            </div>

            <div class="carousel-inner rounded" style="background-color: #777095;">
                <#list images as image>
                    <div class="carousel-item <#if image?is_first>active</#if>" style="height: 300px;">
                        <div class="d-flex justify-content-center align-items-center h-100">
                            <img src="/images/${image.id}"
                                 class="d-block h-100 w-auto"
                                 style="object-fit: contain;"
                                 alt="Product image"
                                 onerror="this.src='https://via.placeholder.com/500x400?text=No+Image'">
                        </div>
                    </div>
                </#list>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <!-- Інформація про продукт -->
        <div class="text-center mb-4">
            <h1>${product.title}</h1>
            <p class="lead">${product.description}</p>
            <div class="h3 text-success">${product.price} $</div>
            <p><i class="bi bi-telephone"></i> Phone: <b>${authorProduct.phoneNumber}</b></p>

            <!-- Автор -->
            <div class="mt-3">
                <a href="/user/${authorProduct.id}" class="text-decoration-none">
                    <img src="/static/images/user.png" alt="User" width="40" height="40" class="rounded-circle me-2">
                    ${authorProduct.name}
                </a>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
</@t.template>