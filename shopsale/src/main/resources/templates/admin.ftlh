<#import "blocks/template.ftlh" as t>
<@t.template user>
<h1>🛍️ ShopSale Products</h1>
<h4>Admin pannel</h4>
<table class="table table-hover table-dark">
    <tr>
        <th scope="col">User Role: </th>
        <th scope="col">PhoneNumber: </th>
        <th scope="col">Email: </th>
        <th scope="col">Activity: </th>
        <th scope="col">IsBlocked: </th>
        <th scope="col">User details</th>
        <th scope="col">Edit user</th>
    </tr>
    <#list users as user>
        <tr>
            <th><#list user.roles as role>${role}</#list></th>
            <th>${user.phoneNumber}</th>
            <th>${user.email}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th><form action="/admin/user/block/${user.id}" method="post">
                    <input type="submit" class="btn btn-light" value="Block user">
                </form>
            </th>
            <th><a href="/user/${user.id}">Detailed info</a></th>
            <th><a href="/admin/user/edit/${user.id}">Edit</a></th>
        </tr>
        <#else ><h3>No users to shown</h3>
    </#list>
</table>
</@t.template>