<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="d-flex align-items-center justify-content-center" style="
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: calc(100vh - 80px);
            padding: 20px;
         ">
    <div class="position-absolute top-50 start-50 translate-middle w-100 px-3">
        <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-4 mx-auto">
            <div class="card border-0 shadow-lg rounded-3">
                <div class="card-body p-4">
                    <h1 class="text-center mb-3 fs-4 fw-bold">Authorization</h1>

                    <form action="/login" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label fw-semibold">Email:</label>
                            <input type="email" class="form-control form-control-sm <#if RequestParameters.error??>is-invalid</#if>"
                                   id="email" name="username" required placeholder="your@email.com">
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label fw-semibold">Password:</label>
                            <input type="password" class="form-control form-control-sm <#if RequestParameters.error??>is-invalid</#if>"
                                   id="password" name="password" required placeholder="Enter your password">
                        </div>

                        <button type="submit" class="btn btn-dark w-100 py-2">Enter</button>
                    </form>

                    <div class="text-center mt-3 pt-2 border-top">
                        <a href="/registration" class="text-decoration-none text-dark small">
                            Don't have an account? <span class="fw-semibold">Register here</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@t.template>