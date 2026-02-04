<!DOCTYPE html>
<html>
<head>
    <title>Test Image</title>
</head>
<body>
<h2>Test Image Loading</h2>

<h3>Option 1: Absolute path</h3>
<img src="/images/user.png" alt="Test 1" width="100">
<p>Path: /images/user.png</p>

<h3>Option 2: Spring path</h3>
<img src="${springMacroRequestContext.getContextPath()}/images/user.png"
     alt="Test 2" width="100">
<p>Path: Spring context</p>

<h3>Option 3: Test with external image</h3>
<img src="https://via.placeholder.com/100" alt="Placeholder" width="100">
<p>External image (should work)</p>

<h3>Debug Info:</h3>
<p>Current path: ${springMacroRequestContext.getContextPath()!''}</p>
<p><a href="/images/user.png">Direct link to image</a></p>
</body>
</html>