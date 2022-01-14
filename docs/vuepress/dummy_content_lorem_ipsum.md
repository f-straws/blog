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
