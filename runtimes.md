**Laufzeiten**

\begin{tabulary}{\columnwidth}{@{}L@{}|@{}C@{}|@{}L@{}}
Kap. & Name & Laufzeit \\\hline
2.6 & Konvexe Hülle & erw: $O(n\log n)$, max: $O(n^2)$ \\
6 & Ford-Fulkerson & $O( |E| *W)$ (k Wert eines max. Flusses) \\
6 & Edmonds-Karp   & $O( |E| ^2 * |V| )$ \\
6 & Präfluss-Push  & $O( |V| ^2 * |E| )$ \\
6 & An-Die-Spitze  & $O( |V| ^3)$ \\
7 & Paare & $O(|E| \cdot \min\{|L|,|R|\})$ \\
7 & Vergrößernder Weg & $O(|V|\cdot |E|)$ \\
8.2 & Schnitt & $O(|V|^2)$ gef. mit $P=1-1/e^2$ \\
8.3 & Min Schnitt & $O(|V|^2 \log |V|)$ richtig mit $P\in \Theta(1/\log |V|)$\\
9 & Welzl & mittl: $O(n)$ \\
10 & Simplex & erw: $O(n^2 d)$, max: $\Omega(n^{d/2})$  \\
10 & Ellipsoid & polyn.; in praxis langsamer als Simplex \\
10 & Innere Punkte & polyn.; in praxis fast so gut wie Simplex \\
10.5 & Seidel & $O(d^3 d! + dnd!)$ \\
\end{tabulary}
