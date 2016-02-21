set -e
pandoc -f markdown summary.md runtimes.md -o summary.tex -s --template template.tex
lualatex summary.tex --interaction=nonstopmode
lualatex summary.tex --interaction=nonstopmode
