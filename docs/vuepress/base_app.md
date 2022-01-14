# Base VuePress app
Following the ["Getting Started"](https://vuepress.vuejs.org/guide/getting-started.html) on [vuepress.vuejs.org](https://vuepress.vuejs.org/),
a rather minimal `Hello World!` web app can be created by, 
1. Setting up a NodeJS project, e.g. as an NPM package,
    ```bash
    mkdir hello_world
    cd hello_world
    npm init --yes
    ```

2. Setting up the project as a git repository,
    1. Initializing the project folder as a git repository,
        ```bash
        git init
        ```

    2. Adding an initial `.gitignore` to avoid commiting content 
       not needing to be versioned (one can also autogenerate one, e.g. via [gitignore.io](https://www.toptal.com/developers/gitignore)), 
       ```
       # .gitignore
       # dirs
       node_modules/
       docs/.vuepress/dist/
       ```
 
    3. Setting up a master/main and a dev branch
       ```bash
       #git branch -m main
       git add --all
       git commit --message "initial commit"    # to create the master/main branch

       git checkout -b dev
       ```

3. Installing depending packages, at least the VuePress framework itself,
    ```bash
    npm install --save-dev vuepress@next
    ```
    Note, with `@next` npm installs currently VuePress version 2.x, without you get version 1.x.

4. Creating a basic VuePress app,

    1. Creating a sub folder to hold the actual VuePress app,
        ```bash
        mkdir docs
        ```
    
    2. Creating markdown content/sources,
        ```markdown
        <!-- docs/README.md -->
        # Hello World!
        ```
## Dummy Content via Lorem Ipsum

Sometimes one may not know or have finished the content yet,
though one might need "some" content, e.g. since one would like 
to design the "looks" of (part of) the VuePress app. For that one 
can use place holder text like the "[Lorem ipsum](https://en.wikipedia.org/wiki/Lorem_ipsum)".

To obtain snippets of the "Lorem ipsum" text, one can use a generator whether it 
is an [online one](https://www.lipsum.com/) or a local one. A local one for the 
NodeJS ecosystem is `lorem-ipsum`,
```bash
npm install --save-dev lorem-ipsum
``` 

Given `lorem-ipsum` and the VuePress app's welcome page `docs/README.md`. 
With the latter containing the header `# Hello World!`, generate a paragraph
of place holder text below the header via,
```bash
echo >> docs/README.md
lorem-ipsum 1 paragraph >> docs/README.md
```
