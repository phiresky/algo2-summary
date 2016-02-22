**Laufzeiten**

\begin{tabulary}{\columnwidth}{@{}L@{}|@{}C@{}|@{}L@{}}
Kapitel & Name & Laufzeit \\\hline
1.1 & Pledge & \\
1.2 & Wanze (Bug) & \\
2.6 Zielsuche & Konvexe Hülle & erw: $O(n\log n)$, max: $O(n^2)$ \\
6 Flüsse & Ford-Fulkerson & $O( |E| *W)$ (k Wert eines max. Flusses) \\
6 Flüsse & Edmonds-Karp   & $O( |E| ^2 * |V| )$ \\
6 Flüsse & Präfluss-Push  & $O( |V| ^2 * |E| )$ \\
6 Flüsse & An-Die-Spitze  & $O( |V| ^3)$ \\
7 & Paare & $O(|E| \cdot \min\{|L|,|R|\})$ \\
7 & Vergrößernder Weg & $O(|V|\cdot |E|)$ \\
8.3 & Min Schnitt & $O(|V|^2 \log |V|)$ richtig mit $P\in \Theta(1/\log |V|)$\\
9 & Welzl & mittl: $O(n)$ \\
10 & Simplex & erw: $O(n^2 d)$, max: $\Omega(n^{d/2})$  \\
10 & Ellipsoid & polyn.; in praxis langsamer als Simplex \\
10 & Innere Punkte & polyn.; in praxis fast so gut wie Simplex \\
10.5 & Seidel & $O(d^3 d! + dnd!)$ \\
\end{tabulary}
