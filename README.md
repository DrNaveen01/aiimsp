# AIIMS Patna Thesis Template

`aiimsp` is a Quarto custom format and starter template for preparing an AIIMS Patna thesis. The repository supports two separate workflows:

- create a complete thesis project with `quarto use template`; or
- add only the `aiimsp` format to an existing Quarto project with `quarto add`.

The extension now declares both PDF and DOCX output formats. DOCX uses the bundled `_extensions/aiimsp/reference.docx` style reference; PDF retains the custom XeLaTeX layout. Exact compliance of DOCX pagination and front matter should be checked in a rendered document. The repository also provides the basis for a complete thesis folder containing editable front matter, chapters, bibliography, signatures, and institutional metadata.

## Installation options

| Requirement | Command | What Quarto installs |
| --- | --- | --- |
| Start a new thesis with the complete project skeleton | `quarto use template DrNaveen01/aiimsp` | The full starter project, including `_quarto.yml`, editable `.qmd` files, example assets, and the nested extension |
| Apply the AIIMS Patna format to an existing project | `quarto add DrNaveen01/aiimsp` | Only the extension under `_extensions/aiimsp/` |

## Create a complete thesis project

Use the starter template for a new thesis:

```bash
quarto use template DrNaveen01/aiimsp
```

Quarto creates a new project from the repository skeleton. Project-level files such as `certificate.qmd` and `hindi.qmd` are copied once and become editable files in the new project. Rendering the thesis does not restore their placeholder content.

After creating the project:

1. Open the new project directory or its `.Rproj` file.
2. Review `_quarto.yml` and replace all example metadata.
3. Edit the supplied front-matter `.qmd` files.
4. Add the thesis chapter files under `book.chapters` in the required order.
5. Add the bibliography and signature files.
6. Render the project with `quarto render`.

Use `quarto use template` once for each new thesis. Changes made inside the generated thesis project do not change this template repository.

## Add only the extension

To use the format in an existing Quarto project, run this command from the project directory:

```bash
quarto add DrNaveen01/aiimsp
```

This installs the extension at:

```text
_extensions/
└── aiimsp/
```

Then select the format in the existing project configuration:

```yaml
format:
  aiimsp-pdf: default
  aiimsp-docx: default
```

Use `aiimsp-pdf` only for PDF, `aiimsp-docx` only for Word, or both as shown above. The Word format uses the existing `reference.docx` inside the extension; there is no need to copy it into the project root.

`quarto add` does not add project-level files such as `_quarto.yml`, `certificate.qmd`, `hindi.qmd`, chapter files, bibliographies, or signatures. Create and configure those files separately when using the extension-only workflow.

## Repository structure

The intended combined repository structure is:

```text
aiimsp/
├── README.md
├── LICENSE
├── _quarto.yml
├── index.qmd
├── certificate.qmd
├── hindi.qmd
├── references.qmd
├── references.bib
├── blank-signature.png
└── _extensions/
    └── aiimsp/
        ├── _extension.yml
        ├── reference.docx
        ├── vancouver-superscript.csl
        ├── partials/
        └── LaTeX layout resources
```

Files at the repository root are part of the editable starter project. Files under `_extensions/aiimsp/` implement the format and should not contain thesis-specific text that users must edit.

In particular, keep `certificate.qmd` and `hindi.qmd` outside the extension. If editable project files are declared as extension `format-resources`, they may be copied during rendering and can overwrite project-specific content.

## Configure `_quarto.yml`

The following example contains the standard Quarto keys and the custom metadata used by `aiimsp-pdf`:

```yaml
project:
  type: book

book:
  chapters:
    - index.qmd
    - certificate.qmd
    - hindi.qmd
    - intro.qmd
    - summary.qmd
    - references.qmd

title: "Estimation Of Prevalence And Factors Associated With Developmental Delay In Under Five Children Residing In Selected Urban Slums Of Patna: A Community Based Cross Sectional Study"

author: "Dr. Naveen Suthar"
date: last-modified

institute: "All India Institute of Medical Sciences"
institute-short-name: "AIIMS Patna"
city: "Patna"

candidate:
  name: "Dr. Naveen Suthar"
  degree: "MD"
  subject: "Community And Family Medicine"
  session: "January 2023 – January 2026"
  pronoun: "he"
  signature: "naveen.pdf"

hod:
  name: "Dr HOD Name"
  designation: "Professor and Head of Department"
  signature: "blank-signature.png"
  date: today

guide:
  name: "Dr Guide Name"
  designation: "Professor"
  signature: "blank-signature.png"
  date: today

coguide1:
  name: "Dr Co-Guide 1 Name"
  designation: "Professor"
  signature: "blank-signature.png"
  date: today

coguide2:
  name: "Dr Co-Guide 2 Name"
  designation: "Professor"
  signature: "blank-signature.png"
  date: today

department: "Department of Community And Family Medicine"

format:
  aiimsp-pdf: default

bibliography: references.bib
```

## Standard Quarto keys

These keys are provided by Quarto and are not specific to this extension.

| Key | Purpose | Use in this template |
| --- | --- | --- |
| `project.type` | Declares the project type. | Keep `book` for a multi-chapter thesis. |
| `book.chapters` | Defines the files and their rendering order. | Add, remove, and reorder `.qmd` files as required. Every listed file must exist. |
| `title` | Defines the full thesis title. | Enter the approved title. |
| `author` | Defines the document author in Quarto metadata. | Usually the candidate's full name. |
| `date` | Defines the document date. | Use `last-modified` or provide a fixed date. |
| `format` | Selects the output format. | Use `aiimsp-pdf: default` for the current format. |
| `bibliography` | Identifies the bibliography database. | Provide the relative path to a `.bib` file. |

## Custom `aiimsp-pdf` keys

These metadata keys are read by the AIIMS Patna format. They are not general Quarto options.

### Institution

| Key | Purpose | Example |
| --- | --- | --- |
| `institute` | Full institutional name. | `All India Institute of Medical Sciences` |
| `institute-short-name` | Short institutional name. | `AIIMS Patna` |
| `city` | Institutional city. | `Patna` |
| `department` | Full departmental name. | `Department of Community And Family Medicine` |

### Candidate

| Key | Purpose | Example |
| --- | --- | --- |
| `candidate.name` | Candidate's full name. | `Dr. Naveen Suthar` |
| `candidate.degree` | Degree for which the thesis is submitted. | `MD` |
| `candidate.subject` | Academic specialty or subject. | `Community And Family Medicine` |
| `candidate.session` | Formal training period. | `January 2023 – January 2026` |
| `candidate.pronoun` | Pronoun used in generated text. | `he` or `she`, subject to the wording supported by the template |
| `candidate.signature` | Relative path to the candidate's signature. | `naveen.pdf` |

### HOD, guide, and co-guides

The `hod`, `guide`, `coguide1`, and `coguide2` blocks use the same nested keys.

| Nested key | Purpose | Example |
| --- | --- | --- |
| `name` | Full name of the person. | `Dr Guide Name` |
| `designation` | Official academic designation. | `Professor` |
| `signature` | Relative path to a signature image or PDF. | `blank-signature.png` |
| `date` | Date shown with the signature. | `today` or a fixed date |

Remove unused co-guide blocks completely. If there is one co-guide, retain `coguide1` and remove `coguide2`. Do not add `coguide3` unless support for that key has been implemented in the format.

## Editable front matter and chapters

Front-matter files containing project-specific content must remain ordinary `.qmd` files at the project level. This applies particularly to:

- `certificate.qmd`;
- `hindi.qmd`;
- declarations, acknowledgements, and dedications;
- chapter text; and
- project-specific appendices.

List each required file under `book.chapters` in its final position. The sequence in `_quarto.yml` determines the sequence in the rendered thesis.

## File paths and assets

All paths are resolved relative to the project directory unless otherwise specified. A minimal working project may contain:

```text
thesis-project/
├── _quarto.yml
├── index.qmd
├── certificate.qmd
├── hindi.qmd
├── intro.qmd
├── summary.qmd
├── references.qmd
├── references.bib
├── naveen.pdf
├── blank-signature.png
└── _extensions/
    └── aiimsp/
```

Use spaces for YAML indentation. Do not use tabs. Quote values containing punctuation, special characters, or text-form dates.

## Shared-source layout and numbering

The source now uses Quarto page breaks, images and layout divs for front matter; raw `\\tableofcontents` was removed to prevent a duplicate TOC. Headings with `{.unnumbered}` remain explicitly unnumbered. The co-guide declaration uses a `layout-ncol=2` div instead of a Markdown table. The DOCX cover logo is authored as Word-visible Quarto content, while PDF retains its existing LaTeX title page.

**Word reference document:** The checked-in `reference.docx` still requires replacement with the revised Word style reference containing the olive-green page border. The GitHub file editing connection does not accept binary Word uploads. Until that file is replaced, the green border will not appear in DOCX. Full PDF/DOCX render parity has not been verified.

## Word (DOCX) format

The `aiimsp-docx` format uses the committed `_extensions/aiimsp/reference.docx` as Pandoc's Word reference document. Edit its Word styles (Normal, Heading 1–3, captions, tables, headers and footers) to change Word formatting without changing thesis source files. DOCX does **not** execute the PDF-specific `partials/title.tex`, LaTeX packages or PDF title/certificate construction; author Word-compatible cover, certificates, declarations and section separators as ordinary `.qmd` content if required. PDF-only signature files such as `.pdf` may need Word-compatible images.

For a Word-only render:

```bash
quarto render --to aiimsp-docx
```

For a PDF-only render:

```bash
quarto render --to aiimsp-pdf
```

Both formats can be enabled in `_quarto.yml` (as shown above) and rendered with `quarto render`. Bibliography follows the bundled Vancouver superscript CSL. Verify the final Word document against the institutional thesis guidelines, particularly front-matter Roman numerals, chapter-one Arabic pagination, centered footer numbers, page breaks and one-table-per-page requirements; these are not automatically guaranteed by `reference.docx`.

## Render

From the project directory, run:

```bash
quarto render
```

To render a specific source file during development:

```bash
quarto render index.qmd
```

The compiled output is normally written to the project output directory configured by Quarto, commonly `_book/` for a book project.

## Update the extension

For a project that installed the extension using `quarto add`, obtain the current repository version with:

```bash
quarto update DrNaveen01/aiimsp
```

Template-created projects contain a local copy of the extension. Before updating, commit or back up local changes made under `_extensions/aiimsp/`.

## Roadmap and TODO

- [ ] Complete and validate the PDF format for the full AIIMS Patna thesis structure.
- [ ] Add a complete project skeleton containing all required front-matter files and chapter placeholders.
- [ ] Organize all necessary thesis chapters into a standard folder structure.
- [ ] Add editable templates for certificates, declarations, acknowledgements, Hindi front matter, appendices, and other institutional pages.
- [x] Declare a DOCX output format using the bundled Word reference document.
- [ ] Validate rendered DOCX against all institutional pagination and front-matter requirements.
- [ ] Add and validate an HTML output format.
- [ ] Keep shared metadata and chapter content reusable across PDF, DOCX, and HTML outputs.
- [ ] Add example projects and rendered reference outputs for regression testing.
- [ ] Document extension versioning and the update workflow.

## Documentation

- [Quarto extensions](https://quarto.org/docs/extensions/)
- [Quarto custom formats](https://quarto.org/docs/extensions/formats.html)
- [Quarto starter templates](https://quarto.org/docs/extensions/starter-templates.html)
- [Distributing Quarto extensions](https://quarto.org/docs/extensions/distributing.html)

## Status

This repository is under active development. PDF remains the mature target format. DOCX is now configured through a Word reference document but its institution-specific front matter and pagination need rendered-output validation. HTML and the complete thesis chapter skeleton remain in development.
