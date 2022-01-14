# Base configuration

One can configure [quite some aspects](https://vuepress.vuejs.org/config/) of a VuePress app, to tailor it to ones desires. The custom/explicit configuration is expected to reside by default in a file `docs/.vuepress/config.js`, e.g. with the following base contents,
```javascript
module.exports = {
    title: "Hello World!",
    description: "A 'Hello World' VuePress app"
    base: "/",
    themeConfig: {
        sidebar: 'auto'
    }
}
```
The configuration is essentially a JavaScript module, holding a configuration object.

The values for `base` and `sidebar` are the defaults, therefore these keys can be omitted.

## The `base` URL

By default the value for `base` is `"/"`, stating that you can view the app, e.g. locally via `npx vuepress dev docs` at `http://localhost:<port>/`. 
However if you would like to serve your app from a folder, e.g. `hello-world`, than you should configure `base` to have the value `"/hello-world/"`. Consequently the app can be accessed via `http://localhost:<port>/hello-world/`. 

Note, serving the app locally via `http-server`, instead of the builtin magic of `vuepress dev`, one should build the app with `npx vuepress build --dest docs/.vuepress/dist/hello-world/ docs`. 
After that, one can serve it via `npx http-server --port <port> ./docs/.vuepress/dist`, and access it at 
`http://localhost:<port>/hello-world/`. 

