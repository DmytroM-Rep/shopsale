<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 class="text-center">My items</h1>
    <hr>
    <div class="row justify-content-center">
    <div class="col-md-4 col-lg-6 col-xl-6">
    <div class="text-center p-4 bg-light rounded shadow-sm">
    <!-- Кнопка для розгортання (data-bs-toggle для Bootstrap 5) -->
    <a class="btn btn-dark mt-3 mb-3 d-block text-center"
       data-bs-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="false" aria-controls="collapseExample">
        Add new item
    </a>

    <!-- Форма (додано show для тесту) -->
    <div class="collapse mb-3" id="collapseExample">
        <div class="card card-body">
            <form action="/product/create" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="productName" class="form-label">Item Name</label>
                    <input type="text" required class="form-control" id="productName" name="title">
                </div>

                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <div class="input-group">
                        <input type="number" required class="form-control" id="price" name="price">
                        <span class="input-group-text">$</span>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="searchCity" class="form-label">City</label>
                    <select id="searchCity" required name="city" class="form-select">
                        <option value="">Choose a city</option>
                        <option value="City 1">City 1</option>
                        <option value="City 2">City 2</option>
                        <option value="City 3">City 3</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea required class="form-control" id="description" name="description" rows="3"></textarea>
                </div>

                <div class="mb-3">
                    <label for="file1" class="form-label">Main image</label>
                    <input required type="file" class="form-control" id="file1" name="file1">
                </div>

                <div class="mb-3">
                    <label for="file2" class="form-label">Image 2</label>
                    <input type="file" class="form-control" id="file2" name="file2">
                </div>

                <div class="mb-3">
                    <label for="file3" class="form-label">Image 3</label>
                    <input type="file" class="form-control" id="file3" name="file3">
                </div>

                <button type="submit" class="btn btn-dark w-100">Add</button>
            </form>
        </div>
    </div>

    <div class="row row-cols-1 row-cols-md-1 g-4">
        <#list products as product>
            <div class="col">
                <a href="/product/${product.id}" class="text-decoration-none">
                    <div class="card h-100">
                        <div class="card-top position-relative">
                            <form action="/product/delete/${product.id}" method="post" class="position-absolute top-0 end-0 m-2">
                                <button type="submit" class="btn btn-danger btn-sm">
                                    Delete
                                </button>
                            </form>
                            <img src="/images/${product.previewImageId}"
                                 class="card-img-top"
                                 alt="${product.title}"
                                 style="height: 200px; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${product.title}</h5>
                            <p class="card-text text-success fw-bold">${product.price} $</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">${product.city}</small>
                        </div>
                    </div>
                </a>
            </div>
        <#else>
                <div class="col-12">
                    <div class="d-flex justify-content-center align-items-center" style="min-height: 300px;">
                        <h3 class="text-muted">Nothing found</h3>
                    </div>
                </div>
        </#list>
    </div>
    </div>
    </div>
    </div>
</@t.template>