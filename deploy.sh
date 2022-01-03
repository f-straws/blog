#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run docs:build

# navigate into the build output directory
cd docs/.vuepress/dist

git init
git add --all
git commit --message 'deploy'

git push --force \
    git@github.com:f-straws/blog.git master:gh-pages

cd -
