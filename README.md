# SPAR LaTeX Report Template

A LaTeX template for [SPAR](https://sparai.org) (Supervised Program for Alignment Research) participants. This template supports the full research workflow: from midterm and final reports during the program to potentially converting your work into an arXiv preprint afterwards.

## Quick Start

### Getting Started with Overleaf (Recommended)

Most SPAR participants use [Overleaf](https://www.overleaf.com), a free online LaTeX editor that requires no installation.

**To use this template on Overleaf:**

1. Download this repository as a ZIP file
2. Go to [Overleaf](https://www.overleaf.com) and create a free account (or log in)
3. Click "New Project" → "Upload Project"
4. Upload the ZIP file
5. Overleaf will automatically compile your document

**That's it!** Overleaf handles all the compilation, bibliography generation, and package management automatically. Just edit `report.tex` and your changes will be reflected in the PDF preview.

### Local Compilation (Optional)

If you prefer to work locally, see the [Local Setup](#local-setup) section at the end of this document.

## Using the Template

### 1. Set Report Mode

The template has three modes that correspond to different stages of the program:

```latex
\documentclass[midterm]{sparreport}  % Options: midterm | final | arxiv
```

**Choose the appropriate mode:**

- **`midterm`** - For your mid-program report, submitted for review by mentors and coordinators
- **`final`** - For your end-of-program report, marking the completion of your SPAR project
- **`arxiv`** - For converting your final report into a preprint for public release on arXiv

### 2. Fill in Metadata

```latex
% Title (prefix added automatically based on mode)
\title{Your Report Title Here}

% Authors
% For SPAR reports: List yourself and your mentor(s)
% For arXiv: List all co-authors
% Authors are displayed horizontally, wrapping to new lines as needed
\author{
  \textbf{Your Name}\\
  \texttt{your.email@example.com}\\
  Your Institution  % Optional but recommended for arXiv mode
  \and
  \textbf{Mentor Name}\\
  \texttt{mentor@example.org}\\
  Mentor Institution
  % Add more authors with \and as needed
}

% SPAR round (automatically hidden in arxiv mode)
\sparround{Fall 2025}
```

### 3. Write Your Content

The template includes word count guidelines for each section:
- Abstract: 100-200 words
- Introduction: 100-350 words
- Methodology: 200-500 words
- Results: 200-400 words
- Discussion: 200-500 words
- Next Steps: 150-400 words (midterm only)

### 4. Add Keywords (Optional but Recommended)

After your abstract, add keywords to help readers find your work:

```latex
\keywords{alignment research \and machine learning \and AI safety}
```

Keywords are especially important for arXiv submissions and are displayed in all modes.

### 5. Add References

**Managing your bibliography:**

We recommend using reference management tools to organize your citations:

- **[Zotero](https://www.zotero.org/)** - For reports with many references (10+). Free, open-source reference manager with browser extensions for easy citation capture. Exports to BibTeX format.
- **[ZoteroBib](https://zbib.org/)** - For reports with few references (under 10). Quick online tool that generates BibTeX entries from URLs, DOIs, or ISBNs.

Both export to BibTeX format, which you can paste directly into `references.bib`.

**Manual BibTeX entries:**

If you prefer to write entries manually, edit `references.bib`:

```bibtex
@article{example,
  author  = {Last, First},
  title   = {Paper Title},
  journal = {Journal Name},
  year    = {2024}
}
```

Cite in text with `\cite{example}`.

### 6. Add Figures

Place figures in the `figures/` directory and include them:

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.7\textwidth]{figures/your-figure.pdf}
  \caption{Your caption here.}
  \label{fig:yourlabel}
\end{figure}
```

Reference with `\cref{fig:yourlabel}` or `\ref{fig:yourlabel}`.

## Converting to arXiv Preprint

If you plan to publish your work as a preprint on arXiv, here's what you need to know:

### Template-Specific Steps

1. **Switch to arxiv mode:**
   ```latex
   \documentclass[arxiv]{sparreport}
   ```
   This removes SPAR branding and optimizes formatting for arXiv.

2. **Generate the .bbl file:**

   arXiv requires the compiled bibliography file (`.bbl`) instead of your `.bib` file.

   **On Overleaf:**
   - Compile your document at least once
   - Click "Logs and output files" (next to Recompile button)
   - Scroll to "Other logs & files"
   - Download `report.bbl`

   **For local compilation:**
   ```bash
   latexmk -pdf report.tex
   # The report.bbl file will be created in your directory
   ```

3. **Files to submit:**
   - `sparreport.cls` (template class file)
   - `report.tex` (your main file)
   - `report.bbl` (generated bibliography)
   - All figure files from `figures/` directory
   - **Do NOT include:** `references.bib`, auxiliary files (`.aux`, `.log`, etc.), or your PDF

### Official arXiv Documentation

For complete submission instructions, please refer to the official arXiv documentation:

- **[Submission Guidelines](https://info.arxiv.org/help/submit/index.html)** - Overview of the submission process
- **[TeX Submissions](https://info.arxiv.org/help/submit_tex.html)** - Detailed instructions for LaTeX/TeX submissions
- **[LaTeX Best Practices](https://info.arxiv.org/help/submit_latex_best_practices.html)** - Best practices for successful HTML paper generation

**Template compatibility notes:**
- This template is compatible with arXiv's pdflatex processor
- Uses TeX Live 2023+ (arXiv requirement)
- Pins `array` package to version 2016-10-06 for compatibility

## Troubleshooting

### On Overleaf

**Bibliography not appearing:**
- Overleaf automatically handles bibliography compilation
- Make sure you have `references.bib` in your project
- Try clicking the "Recompile" button if references don't show up

**Compilation errors:**
- Check the "Logs and output files" panel for detailed error messages
- Make sure you're using TeX Live 2023 or later (check in Menu → Settings)
- Verify all figure files are in the `figures/` directory

**Figures not displaying:**
- Ensure figure paths use forward slashes: `figures/example.pdf`
- Check that all figures are PDF, PNG, or JPG format
- Verify figures are actually uploaded to your Overleaf project

### For Local Compilation

See the [Local Setup](#local-setup) section for installation and compilation instructions.

## Local Setup

This section is for the small percentage of users who prefer to work locally instead of using Overleaf.

### Prerequisites

- A TeX distribution (TeX Live 2023+ recommended)
- pdflatex compiler
- bibtex (for bibliography)
- latexmk (for automated compilation)

### Installation Options

**Option 1: Using devenv** (recommended for Nix users)

If you have [Nix](https://nixos.org/download/) and [devenv](https://devenv.sh/) installed:

```bash
# Enter the development shell
devenv shell

# This provides convenient build scripts:
build report.tex         # Build with automatic bibliography handling
watch report.tex         # Watch mode (recompile on changes)
clean report.tex         # Clean auxiliary files
```

**Option 2: Using latexmk directly**

Install TeX Live, then use latexmk:

```bash
# Full compilation (handles bibliography, reruns automatically)
latexmk -pdf report.tex

# Watch mode (recompile on changes)
latexmk -pdf -pvc report.tex

# Clean auxiliary files
latexmk -c report.tex
```

**Option 3: Manual compilation**

```bash
# Full compilation sequence for bibliography
pdflatex report.tex
bibtex report
pdflatex report.tex
pdflatex report.tex
```

### Local Troubleshooting

**Bibliography not appearing:**
```bash
# Make sure to run the full compilation sequence
latexmk -pdf report.tex
# Or manually:
pdflatex report.tex && bibtex report && pdflatex report.tex && pdflatex report.tex
```

**Package version conflicts:**
- Make sure you're using TeX Live 2023 or later
- The template pins `array` package to version 2016-10-06 for arXiv compatibility

## Support

For issues with:
- **Template**: Check this README and example files
- **LaTeX**: See [Overleaf documentation](https://www.overleaf.com/learn)
- **arXiv**: See [arXiv TeX Submissions](https://info.arxiv.org/help/submit_tex.html) and [Submission Guidelines](https://info.arxiv.org/help/submit/index.html)

## License

This template is provided as-is for use by SPAR researchers. Feel free to modify and extend it for your needs.
