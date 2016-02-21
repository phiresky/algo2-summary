pandoc summary.md -o summary.tex -s --template template.tex&&lualatex summary.tex --interaction=batchmode
