# Preview the result

To view the actual result/make use of the webapp in a webbrowser, one needs to,
1. build a distribution of the app, and
2. serve this distribution.

For development purposes, VuePress has a convenient "task" builtin, which can build and serve (on the localhost) a distribution the result with every change made to the VuePress app's sources,
```bash
npx vuepress dev docs
``` 

However, a bit more elaborate (and cumbersome for development purposes, 
though maybe of use for debugging purposes), one can perform the steps seperately, e.g.,
1. Building (a distribution of) the VuePress app,
    ```bash
    npx vuepress build docs
    ```

2. Serving the distribution, requires a webserver. [Setting up a simple webserver](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/set_up_a_local_testing_server) can be done by, e.g.,
    1. Installing a simple "working-out-of-the-box" webserver for development purposes to serve static web apps/pages,
        ```bash
        npm install --save-dev http-server
        ```

    2. Serving the VuePress app's distribution,
        ```bash
        npx http-server --port 8081 docs/.vuepress/dist/
        ```

On can then view the result by navigating to [http://localhost:8081](http://localhost:8081).

Note, the `vuepress` commands used are the bare bones ones, and the can be customized with 
[option flags](https://v2.vuepress.vuejs.org/reference/cli.html#dev) if one desires:
```bash
npx vuepress dev --help
npx vuepress build --help
```
