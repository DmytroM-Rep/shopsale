<#--<!doctype html>-->
<#--<html lang="en">-->
<#--<head>-->
<#--    <meta charset="UTF-8">-->
<#--    <meta name="viewport"-->
<#--          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">-->
<#--    <meta http-equiv="X-UA-Compatible" content="ie=edge">-->
<#--    <title>shopsell</title>-->
<#--</head>-->
<#--<body>-->
<#--<h2>User ${user.name} detail information</h2><br>-->
<#--<b>Email: </b>${user.email}<br>-->
<#--<b>PhoneNumber: </b>${user.phoneNumber}<br>-->

<#--<h3>Items list</h3>-->
<#--<#list products as product>-->
<#--    <div>-->
<#--        <p><b>${product.title}</b> ${product.price} | <a href="/product/${product.id}">Details...</a></p>-->
<#--    </div>-->
<#--    <#else ><h3>No items found</h3>-->
<#--</#list>-->
<#--<#if errorMsg??>-->
<#--    <h2 style="color: red">${errorMsg}</h2>-->
<#--</#if>-->
<#--</body>-->
<#--</html>-->

<#import "blocks/template.ftlh" as t>
<@t.template userByPrincipal>
    <h1 style="text-align: center">User info</h1>
    <hr>
    <div style="text-align: center">
        <img src="/static/images/user.png"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        PhoneNumber: <b>${user.phoneNumber}</b>
    </div>
    <br>
    <hr>
    <h1 style="text-align: center">User items ${user.name}</h1>
    <br>
    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.price} ₽</p>
                    </div>
                    <div class="card-footer">
                        ${product.user.name}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>