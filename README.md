# SPAR LaTeX Report Template

A professional LaTeX template for [SPAR](https://sparai.org) (Supervised Program for Alignment Research) participants. This template supports the full research workflow: from midterm and final reports during the program to converting your work into an arXiv preprint afterward.

## Quick Start

### Prerequisites

Using this template requires:
- A TeX distribution (TeX Live 2023+ recommended)
- pdflatex compiler
- bibtex (for bibliography)

We recommend using [Overleaf](https://www.overleaf.com) for an easy online LaTeX environment, or installing [TeX Live](https://www.tug.org/texlive/) for using it locally.

If using the included `devenv` setup (requires [Nix](https://nixos.org/download/) and [devenv](https://devenv.sh/)):
```bash
# Enter the development shell
devenv shell
```

This will set up all necessary LaTeX tools and packages.

### Compiling Your Report (for local use)

**Option 1: Using devenv scripts** (recommended)
```bash
# Build any report (automatically handles bibliography)
build report.tex
build example.tex

# Watch mode (recompile on changes)
watch report.tex
watch example.tex

# Clean auxiliary files
clean report.tex
clean example.tex
```

**Option 2: Using latexmk directly**
```bash
# Full compilation (automatically handles bibliography, reruns, etc.)
latexmk -pdf report.tex
latexmk -pdf example.tex

# Watch mode (recompile on changes)
latexmk -pdf -pvc report.tex

# Clean auxiliary files
latexmk -c report.tex
```

## Using the Template

### 1. Set Report Mode

The template has three modes that correspond to different stages of your research journey:

```latex
\documentclass[midterm]{sparreport}  % Options: midterm | final | arxiv
```

**Choose the appropriate mode:**

- **`midterm`** - For your mid-program report
  - Adds "Midterm Report:" prefix to title
  - Includes SPAR branding and round information
  - Designed for internal review by mentors and program coordinators
  - Standard 1-inch margins for easy reading and annotations

- **`final`** - For your end-of-program report
  - Adds "Final Report:" prefix to title
  - Includes SPAR branding and round information
  - Designed for internal review and program completion
  - Same comfortable formatting as midterm mode

- **`arxiv`** - For publishing your work as a preprint
  - Removes title prefix and all SPAR-specific branding
  - Optimized layout for arXiv (compact geometry, tighter spacing)
  - Hides round information and program-specific elements
  - Use this when converting your final report into a paper for public release

**Note:** All sections (Introduction, Methodology, Results, Discussion) are visible in all modes. The mode only affects formatting, branding, and layout optimization.

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
pdflatex report.tex
bibtex report
pdflatex report.tex
pdflatex report.tex

# Verify report.bbl was created
ls report.bbl
```

### What to Submit

Upload these files to arXiv:

1. **Required:**
   - `sparreport.cls` (the template class file)
   - `report.tex` (your main LaTeX file)
   - `report.bbl` (generated bibliography file)
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

The template automatically adapts its formatting based on your chosen mode to match the intended audience and use case:

**Program Reports (midterm/final modes):**
- Comfortable 1-inch margins for easy reading and mentor annotations
- Traditional paragraph indentation for a formal report style
- Standard section spacing for readability
- SPAR branding footer with round information
- Optimized for internal review and feedback

**arXiv Preprints (arxiv mode):**
- Compact page geometry (9in × 6.5in text area) following arXiv conventions
- No paragraph indentation with space between paragraphs for better screen reading
- Tighter section spacing to maximize content density
- All SPAR-specific branding removed for public release
- Optimized for academic paper archives and wider distribution

**All modes include:**
- Professional typography (widow/orphan prevention, optimized spacing)
- Improved abstract styling with centered, bold heading
- Smart caption spacing (different for tables vs. figures)
- Keywords support for discoverability

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
pdflatex report.tex
bibtex report
pdflatex report.tex
pdflatex report.tex

# Or just use latexmk (handles everything automatically)
latexmk -pdf report.tex
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
