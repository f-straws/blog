# Syntactic development candy

To type in the `npx` commands might feel a bit cumbersome. One way to save on typing 
is by relying on aliases. For the NodeJS app, they can be configured, e.g. within the `package.json` as attributes to the `scripts` dictionary,

```json
{
    ...
    
    "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1",
        "docs:dev": "vuepress dev docs",
        "docs:build": "vuepress build docs"
    }

    ...
}
```

As an alternative, one can rely on (abuse?) the build tool (GNU)Make and configure some [`.PHONY` 
targets in a `makefile`](https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html), e.g.,
```makefile
.PHONY: docs_dev docs_build

docs_dev: 
    npx vuepress dev docs

docs_build:
    npx vuepress build docs
```

For this purpose, to capture your script snippets in a `makefile`, can be considered a more generic approach,
independent of the app's language and framework, whereas the `package.json` approach is related to NodeJS. The trade off is that you rely on another tool: a more bloated setup since you have more than you maybe 
need for the project at hand.

Yet another alternative is relying on your [shell's profile (BASH)](https://tldp.org/LDP/abs/html/aliases.html),
however the scope of the aliases will than be "user wide" (or even system wide), instead of being scoped for the project. Unfortunately a tool like `direnv` cannot come to the rescue,
> [... aliases and functions are not exportable right now.](https://direnv.net/#faq)

As soon as this would be possible [`direnv` + shell aliases](https://github.com/direnv/direnv/issues/73) could be viewed, like Make, as a more generic approach, independent of the app's language and framework. However, with Make you introduce another DSL (domain specific language), although
in many cases looking similar to your shell's language, with `direnv` this is not the case: no new language (elements) required to learn.
