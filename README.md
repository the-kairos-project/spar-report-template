# SPAR LaTeX Report Template

A professional LaTeX template for SPAR (Singular Projects for Ambitious Research) midterm and final reports, with built-in arXiv compatibility.

## Quick Start

### Prerequisites

This template requires:
- A TeX distribution (TeX Live 2023+ recommended)
- pdflatex compiler
- bibtex (for bibliography)

If using the included `devenv` setup:
```bash
# Enter the development shell
devenv shell
```

### Compiling Your Report

**Option 1: Using devenv scripts** (recommended)
```bash
# Build any report (automatically handles bibliography)
build spar-report.tex
build example.tex

# Watch mode (recompile on changes)
watch spar-report.tex
watch example.tex

# Clean auxiliary files
clean spar-report.tex
clean example.tex
```

**Option 2: Using make**
```bash
# Build main template (automatically handles bibliography)
make

# Build example report
make example

# Watch mode (recompile on changes)
make watch

# Watch mode for example
make example-watch

# Clean auxiliary files (both files)
make clean
```

**Option 3: Using latexmk directly**
```bash
# Full compilation (automatically handles bibliography, reruns, etc.)
latexmk -pdf spar-report.tex

# Watch mode
latexmk -pdf -pvc spar-report.tex

# Clean
latexmk -c spar-report.tex
```

## Using the Template

### 1. Set Report Mode

Edit line 14 in `spar-report.tex` to change the document class option:

```latex
\documentclass[midterm]{sparreport}  % Options: midterm | final | arxiv
```

- **midterm**: Title prefix "Midterm Report:", SPAR branding in footer
- **final**: Title prefix "Final Report:", SPAR branding in footer
- **arxiv**: No prefix, removes all SPAR-specific decoration for paper submission

All sections are always visible - the mode only changes the title prefix and branding.

### 2. Fill in Metadata

```latex
% Title (prefix added automatically based on mode)
\title{Your Report Title Here}

% Authors (displayed horizontally, wrapping to new lines as needed)
\author{
  \textbf{Student Name}\\
  \texttt{student@example.com}\\
  Your Institution  % Optional: add affiliation (recommended for arXiv mode)
  % Add more authors (including mentors) with \and:
  % \and
  % \textbf{Mentor Name}\\
  % \texttt{mentor@example.com}\\
  % Mentor Institution
}

% SPAR round (hidden in arxiv mode)
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

Edit `references.bib` with your bibliography entries:

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

## arXiv Submission Checklist

When submitting to arXiv, follow these steps:

### Before Submission

- [ ] Change document class to `\documentclass[arxiv]{sparreport}` to remove SPAR branding
- [ ] Recompile the document completely
- [ ] Verify all figures are PDF, PNG, or JPG format (no EPS with pdflatex)
- [ ] Check that all references are properly formatted
- [ ] Review the compiled PDF for any formatting issues

### Generating the .bbl File

**CRITICAL**: arXiv requires you to submit the generated `.bbl` file instead of your `.bib` file.

```bash
# Compile to generate the .bbl file
pdflatex spar-report.tex
bibtex spar-report
pdflatex spar-report.tex
pdflatex spar-report.tex

# Verify spar-report.bbl was created
ls spar-report.bbl
```

### What to Submit

Upload these files to arXiv:

1. **Required:**
   - `sparreport.cls` (the template class file)
   - `spar-report.tex` (your main LaTeX file)
   - `spar-report.bbl` (generated bibliography file)
   - All figure files from `figures/` directory

2. **Do NOT include:**
   - `references.bib` (use `.bbl` instead)
   - Auxiliary files (`.aux`, `.log`, `.out`, etc.)
   - PDF output (arXiv will generate this)

### arXiv Submission Settings

- **Processor**: Select `pdflatex` (NOT latex/dvips)
- **TeX Live version**: 2023 or 2024 recommended
- **File structure**: You can submit a flat structure or use `figures/` subdirectory

### Common arXiv Issues

1. **Missing .bbl file**: Always include the generated `.bbl`, not your `.bib`
2. **Package version conflicts**: The template uses `\usepackage{array}[=2016-10-06]` for compatibility
3. **Figure format**: Use PDF/PNG/JPG, not EPS (unless using latex processor)
4. **Hyperref warnings**: Load `hyperref` before `hyperxmp` if using metadata packages

## Template Features

### Professional Typography

The template includes publication-quality typography features:

- **Widow/orphan prevention**: Prevents single lines at the top/bottom of pages (`\widowpenalty=10000`, `\clubpenalty=10000`)
- **Flush bottom**: Aligns text consistently at the bottom of pages for a professional look
- **Improved word spacing**: Slightly more flexible spacing for better line breaks
- **Optimized float placement**: Better automatic positioning of figures and tables
- **Smart caption spacing**: Different spacing for tables (caption above) vs. figures (caption below)

### Mode-Specific Formatting

Different formatting is automatically applied based on your chosen mode:

**All modes:**
- Professional typography settings
- Improved abstract styling (centered, bold heading)
- Better float and caption spacing
- Keywords support

**arXiv mode only:**
- Compact page geometry (9in × 6.5in text area) to maximize content
- No paragraph indentation with spacing between paragraphs
- Tighter section spacing
- No SPAR branding or footer

**Midterm/Final modes:**
- Standard 1in margins for comfortable reading and annotations
- Traditional paragraph indentation
- Standard section spacing
- SPAR branding footer

### Conditional Sections

The template automatically shows/hides content based on report mode:
- "Next Steps" section (midterm only)
- SPAR branding footer (hidden in arxiv mode)
- Round information (hidden in arxiv mode)

### Keywords Support

Use the `\keywords{}` command to add keywords to your document:

```latex
\keywords{keyword 1 \and keyword 2 \and keyword 3}
```

Keywords are displayed in all modes and are particularly important for arXiv submissions.

### Smart Cross-References

Use `\cref{}` for automatic reference formatting:
- `\cref{fig:example}` → "Figure 1"
- `\cref{tab:results}` → "Table 2"
- `\cref{sec:intro}` → "Section 1"

### Professional Tables

Use the `booktabs` package for clean tables:

```latex
\begin{table}[htbp]
  \centering
  \caption{Example table.}
  \begin{tabular}{lcc}
    \toprule
    Method & Accuracy & Time \\
    \midrule
    Approach A & 85\% & 2.3s \\
    Approach B & 92\% & 4.1s \\
    \bottomrule
  \end{tabular}
\end{table}
```

## Customization

### Adding Sections

For arXiv papers, you may want to add sections like:
- Related Work
- Conclusion
- Acknowledgments

Simply add them after the Discussion section:

```latex
\section{Related Work}
Your content...

\section{Conclusion}
Your content...
```

### Changing Fonts or Layout

The template uses standard `article` class. You can modify:
- Font: Add `\usepackage{times}` or other font packages
- Spacing: Adjust `\geometry` settings
- Column layout: Change to `\documentclass[twocolumn]{article}` for arXiv

## Troubleshooting

### Bibliography not appearing
```bash
# Make sure to run the full compilation sequence
pdflatex spar-report.tex
bibtex spar-report
pdflatex spar-report.tex
pdflatex spar-report.tex
```

### Figures not found
- Check that figure paths are correct relative to the main `.tex` file
- Use forward slashes: `figures/example.pdf` (not backslashes)

### Package conflicts
- Make sure you're using TeX Live 2023 or later
- Check that `array` package version is pinned: `\usepackage{array}[=2016-10-06]`

## Support

For issues with:
- **Template**: Check this README and example files
- **LaTeX**: See [Overleaf documentation](https://www.overleaf.com/learn)
- **arXiv**: See [arXiv submission guide](https://arxiv.org/help/submit_tex)

## License

This template is provided as-is for use by SPAR researchers. Feel free to modify and extend it for your needs.
