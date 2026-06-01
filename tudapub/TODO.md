
## Todos
### Thesis Template:
* [ ] some bug seems to insert an empty page at the end of the document when content (title page) appears before this second 'set page'
* [ ] numbering/labeling of sub-equations (that are aligned with the other sub-equations)
* [x] remove page numbers in footer before ~~and at table of contents~~
* [x] fix first-level heading page is wrong
  * in the outline, the page of the first-level heading is sometimes the previous page of the heading. Just appears in combination with `figure_numbering_per_chapter`.
* [ ] fix referencing figures respect figure numbering when using `figure_numbering_per_chapter`
* [ ] first-level headings should be referenced as 'Chapter' not as 'Sections'
* [ ] add pages for:
  * [x] abstract
  * [ ] list of figures, tables, ... other
  * [ ] list of abbreviations (glossary)
  * [x] references
* [ ] references list: use same citation style is 'numeric' in latex
* [ ] reduce vertical spacing between adjacent headings when there is no text in between (looks better, latex template also does this)
* [x] add arguments for optional pages:
  * after title page
  * before outline table of contents
  * after outline table of contents
* [ ] fix equation numbering per chapter (somehow increases in steps of 2)
* [x] provide some default page margins (small, medium, large)
* [ ] ~~make all font sizes relative to the main text font size (e.g. headings)~~
* [ ] switch to kebab case for template, function args