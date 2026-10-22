# AIIMS Patna Thesis Template

This Quarto template provides the standard structure and metadata required to render an AIIMS Patna thesis as a PDF. Configure the thesis by editing `_quarto.yml` or by copying and adapting `_example.yml`.

## Complete configuration

``` yaml
project:
  type: book

book:
  chapters:
    - index.qmd
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
  session: "January 2023 â€“ January 2026"
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

These keys are built into Quarto and control the project, document structure, general metadata, output format, and references.

| Key | Purpose | Accepted value in this template |
|------------------------|------------------------|------------------------|
| `project.type` | Declares the Quarto project type. | Keep as `book`. |
| `book.chapters` | Lists the `.qmd` files in their rendering order. | Add, remove, or reorder chapter filenames as required. |
| `title` | Sets the full thesis title. | Text enclosed in quotation marks. |
| `author` | Sets the document author in Quarto metadata. | Candidate's full name. |
| `date` | Controls the document date. | `last-modified` updates from the source file modification date; a fixed date may also be supplied. |
| `format` | Selects the output format. | Keep `aiimsp-pdf: default` to use this extension. |
| `bibliography` | Identifies the BibTeX bibliography file. | Path to a `.bib` file, such as `references.bib`. |

The order under `book.chapters` is the order used in the final thesis. Every listed file must exist in the project.

## Template-specific keys

These are custom metadata keys read by the AIIMS Patna thesis format. They are not general Quarto options.

### Institutional details

| Key | Purpose | Example |
|------------------------|------------------------|------------------------|
| `institute` | Full name of the institution. | `All India Institute of Medical Sciences` |
| `institute-short-name` | Abbreviated institutional name used where space is limited. | `AIIMS Patna` |
| `city` | City displayed in institutional details. | `Patna` |
| `department` | Full departmental name. | `Department of Community And Family Medicine` |

### Candidate details

| Key | Purpose | Example |
|------------------------|------------------------|------------------------|
| `candidate.name` | Candidate's full name. | `Dr. Naveen Suthar` |
| `candidate.degree` | Degree for which the thesis is submitted. | `MD` |
| `candidate.subject` | Academic subject or specialty. | `Community And Family Medicine` |
| `candidate.session` | Formal training period. | `January 2023 â€“ January 2026` |
| `candidate.pronoun` | Pronoun used by generated declaration text. | `he`, `she`, or the value supported by the template text |
| `candidate.signature` | Candidate's signature image or PDF. | `naveen.pdf` |

### HOD, guide, and co-guide details

The `hod`, `guide`, `coguide1`, and `coguide2` blocks use the same internal structure:

| Nested key | Purpose | Example |
|------------------------|------------------------|------------------------|
| `name` | Full name of the person. | `Dr Guide Name` |
| `designation` | Official academic designation. | `Professor` |
| `signature` | Path to the signature image or PDF. | `blank-signature.png` |
| `date` | Date shown beside the signature. | `today` for the rendering date, or a fixed date required by the template |

Replace all placeholder names, designations, signatures, and dates before final rendering. Keep `blank-signature.png` only when an intentionally blank signature space is required.

If the thesis has one co-guide, retain `coguide1` and remove the complete `coguide2` block. If it has no co-guide, remove both co-guide blocks. Add further co-guide blocks only if the format explicitly supports keys such as `coguide3`.

## File paths

Paths are resolved relative to the project directory. Keep the referenced files with the project or provide their correct relative paths.

``` text
project-directory/
 _quarto.yml
 index.qmd
 intro.qmd
 summary.qmd
 references.qmd
 references.bib
 naveen.pdf
 blank-signature.png
```

Quote text values when they contain punctuation, dates written as text, or special characters. Use spaces for YAML indentation; do not use tabs.

## Render the thesis

From the project directory, run:

``` bash
quarto render
```

The `aiimsp-pdf` format must be installed and available to the project before rendering.
