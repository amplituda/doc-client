VCL Documentation Client
========================

This is an HTML viewer for the doc generated by [vcl/doc-gen](https://github.com/vcl/doc-gen). The examples are included using
Shadow DOM. (This also means that it will only run in Browsers that support shadow DOM)

**[Demo (Full VCL Doc)](https://vcl.github.io)**


## Usage

You probably want to use [vcl/doc-gen](https://github.com/vcl/doc-gen). But if
you somehow generate the `documentation.json` yourself you can create a
stand-alone HTML file with this module.

**Example**

```JavaScript
// var doc = {...};
var vclDocClient = require('vcl-doc-client');

vclDocClient.getBuild(doc, function(html) {
  console.log(html);
});

```

You can set `doc.customHead` if you want to inject custom css or js.
