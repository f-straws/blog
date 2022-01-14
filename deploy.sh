#!/usr/bin/env sh
GITHUB_USERNAME="${1}"
GITHUB_REPO="${2}"
GITHUB_PAGES_BRANCH="${3:-preview}"
SOURCE_BRANCH="${4:-master}"

# abort on errors
set -e

# build
npx vuepress build --dest docs/.vuepress/dist/blog docs

# navigate into the build output directory
cd docs/.vuepress/dist/blog/

touch .nojekyll

git init
git add --all
git commit --message 'deploy'

git push --force \
    git@github.com:${GITHUB_USERNAME}/${GITHUB_REPO}.git ${SOURCE_BRANCH}:${GITHUB_PAGES_BRANCH}

cd -
