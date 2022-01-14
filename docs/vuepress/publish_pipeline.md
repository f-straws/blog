# Publish pipeline

The official [VuePress Guide](https://vuepress.vuejs.org/guide/deploy.html) offers examples of how to deploy
your VuePress web app to several hosting services. Deploying to GitHub Pages is fairly minimal. 

Suppose you have a [GitHub account and a remote repository ready](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site) for your project/VuePress app called "hello-world". 
Then you can deploy your VuePress app by,
1. Configuring the correct base URL where you would like to serve your app from, which can be 
    done via the key `base` in the app's config file `docs/.vuepress/config.js`,
    ```json
    module.exports = {
        ...

        base: "/hello-world/",
        
        ...
    }
    ```

    In the above the app is configured to be served from `https://<github-username>.github.io/hello-world/` when
    served from GitHub Pages, i.e. the project's repository.
    However, by default this is `"/"` and if you change it, you might want to consider 
    to build the app via `npx vuepress build --dest docs/.vuepress/dist/hello-world docs` 
    (e.g. for consistency).


2. Building a distribution of your VuePress app locally, via
    ```bash
    npx vuepress build --dest docs/.vuepress/dist/hello-world docs
    ```

3. Deploying it by pushing the distribution to a specific branch on the remote repository, 
   have the following content in a shell script `deploy.sh` and run `bash deploy.sh <your-name> <your-repo>`,
    ```bash
    #!/usr/bin/env bash

    GITHUB_USERNAME="${1}"
    GITHUB_REPO="${2}"
    GITHUB_PAGES_BRANCH="${3:-preview}"
    SOURCE_BRANCH=main="${4:-dev}"

    # abort on errors (e.g. no need for `&&`)
    set -e 

    cd docs/.vuepress/dist/${GITHUB_REPO}
    touch .nojekyll
    
    git init
    git add --all
    git commit --message 'deploy'

    git push --force git@github.com:${GITHUB_USERNAME}/${GITHUB_REPO}.git ${SOURCE_BRANCH}:${GITHUB_PAGES_BRANCH}
    
    cd -

    ```

4. Serving it via GitHub Pages, by 
    1. logging in into your account, 
    2. navigating to the "hello-world" project's "Settings",
    3. clicking on "Pages" in the side bar on the left,
    4. configuring your "GitHub Pages" source, by selecting
        the `GITHUB_PAGES_BRANCH` branch from the dropdown,
    5. waiting for about 10min,
    6. navigating in the browser to: `https://<your-username>/github.io/hello-world/`

    Note, for free tiers, one can only have public GitHub Pages.

5. Viewing the GitHub Pages' build deploy pipeline,
   1. logging in into your account,
   2. navigating to the "hello-world" project's "Actions",
   3. clicking on a "workflow" run ("pages build and deployment"),
   
   Note, by default GitHub Pages' build stage in the workflow tries to build the 
   sources with Jekyll (also a static site generator). Since one already relies on 
   VuePress as a static site generator, and also because one has already build the sources 
   locally, one can add the empy file `.nojekyll`, to not trigger this unnecessary build step in the 
   build stage. 

   In addition, remark that one can "off shore" building the VuePress app, e.g. via,
   - [GitHub Actions](https://vuepress.vuejs.org/guide/deploy.html#github-pages-and-github-actions),  
   - [Azure Static Web Apps](https://docs.microsoft.com/en-us/azure/static-web-apps/publish-vuepress)   

## Unpublishing

Unpublishing a GitHub Pages website can be done quite easy by switching the 
branch, under the "Pages" settings to `None`. This works, except for when one 
has a `gh-pages` branch in use. In addition one also has to delete the 
`gh-pages` branch, e.g.,
```bash
git push --delete origin gh-pages
```

