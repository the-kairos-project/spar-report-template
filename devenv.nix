{ pkgs, ... }:

{
  # LaTeX environment with packages commonly needed for arxiv preprints
  packages = [
    # Combined TeX Live with medium scheme + common extras
    (pkgs.texlive.combine {
      inherit (pkgs.texlive) 
        scheme-medium
        
        # Additional packages not in scheme-medium
        latexmk        # Build automation
        algorithm2e    # Algorithm typesetting
        algorithmicx algpseudocodex
        minted         # Code highlighting (if using)
        cleveref       # Better cross-references
        ;
    })
    
    # Helpful tools for development
    pkgs.texlab      # LSP for LaTeX
    pkgs.rubber      # Alternative build tool
  ];

  # Convenient build scripts (synced with Makefile, using latexmk)
  scripts.build.exec = ''
    # Full build with latexmk (automatically handles bibliography)
    latexmk -pdf -interaction=nonstopmode "$@"
  '';

  scripts.watch.exec = ''
    # Watch mode - recompile on changes
    latexmk -pdf -pvc -interaction=nonstopmode "$@"
  '';

  scripts.clean.exec = ''
    # Clean auxiliary files
    latexmk -c "$@"
  '';

  enterShell = ''
    echo "LaTeX environment ready! 📄"
    echo ""
    echo "Available commands:"
    echo "  • build <file>  → Build with latexmk (handles bibliography automatically)"
    echo "  • watch <file>  → Watch mode (recompile on changes)"
    echo "  • clean <file>  → Clean auxiliary files"
    echo ""
    echo "Examples:"
    echo "  build spar-report.tex"
    echo "  build example.tex"
    echo ""
    echo "Or use: make, make example, make watch, make example-watch, make clean"
    echo ""
    echo "TeX Live version: $(pdflatex --version | head -n1)"
  '';
}
