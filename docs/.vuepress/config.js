module.exports = {
    title: "Blog",
    base: "/blog/",
    themeConfig: {
        sidebar: {
            '/': [
                {
                    text: "Home",
                    collapsible: true,
                    children: [
                        '/vuepress/README.md'
                    ]
                }
            ],
            '/vuepress/': [
                {
                    text: "VuePress",
                    collapsible: true,
                    children: [
                        '/vuepress/README.md',
                        '/vuepress/base_app.md',
                        '/vuepress/preview_result.md',
                        '/vuepress/base_configuration.md',
                        '/vuepress/publish_pipeline.md',
                        '/vuepress/syntactic_dev_candy.md',
                        '/vuepress/multipage_app.md',
                        '/vuepress/appendix.md'
                    ]
                }
            ]
        }
    }
}
