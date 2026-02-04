<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="container">
        <h1 class="text-center mb-4">User profile</h1>
        <hr class="mb-4">

        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5 col-xl-4">
                <div class="text-center p-4 bg-light rounded shadow-sm">
                    <img src="/static/images/user.png"
                         class="img-fluid rounded-circle border border-3 border-dark mb-4"
                         style="width: 140px; height: 140px; object-fit: cover;"
                         alt="Profile picture">

                    <h2 class="mb-3">${user.name}</h2>

                    <div class="mb-3 text-start">
                        <div class="mb-2">
                            <span class="text-secondary">Email:</span><br>
                            <strong>${user.email}</strong>
                        </div>
                        <div>
                            <span class="text-secondary">Phone Number:</span><br>
                            <strong>${user.phoneNumber!'-'}</strong>
                        </div>
                    </div>

                    <div class="d-grid gap-3">
                        <#if user.isAdmin()>
                            <a class="btn btn-dark" href="/admin">
                                <i class="bi bi-gear-fill"></i> Admin panel
                            </a>
                        </#if>

                        <a class="btn btn-outline-dark" href="/user/products">
                            <i class="bi bi-box-seam"></i> My items
                        </a>

                        <form action="/logout" method="post" class="d-grid">
                            <button type="submit" class="btn btn-danger">
                                <i class="bi bi-box-arrow-right"></i> Log out
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@t.template>