---
#header-includes: \usepackage{unicode-math}
mathfont: Latin Modern Math
---

<style>dd ul{list-style-type:none}</style>

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
7 & Paare & $O(|E| \cdot min\{|L|,|R|\})$ \\
7 & Vergrößernder Weg & $O(|V|\cdot |E|)$ \\
8.3 & Min Schnitt & $O(|V|^2 \log |V|)$ richtig mit $P\in \Theta(1/\log |V|)$\\
9 & Welzl & mittl: $O(n)$ \\
10 & Simplex & erw: $O(n^2 d)$, max: $\Omega(n^{d/2})$  \\
10 & Ellipsoid & polyn.; in praxis langsamer als Simplex \\
10 & Innere Punkte & polyn.; in praxis fast so gut wie Simplex \\
10.5 & Seidel & $O(d^3 d! + dnd!)$ \\
\end{tabulary}

**Util**

* $\mathbf a \cdot \mathbf b = |\mathbf a||\mathbf b| \cos\sphericalangle(\mathbf a,\mathbf b)$

---

**I Geometrische Algorithmen**

# Bewegungsplanung bei unvollständiger Information

## Ausweg aus einem Labyrinth

### Pledge-Strategie

*Input:* polygonales Labyrinth L, Roboter R, Drehwinkel $\varphi \in \mathbb{R}$

*Output:* Ausweg aus Labyrinth falls möglich, ansonsten Endlosschleife

- While $R\in L$
    - gehe vorwärts, bis $R\notin L$ oder Wandkontakt
    - gehe links der Wand, bis $R\notin L$ oder $\varphi = 0$

## Zum Ziel in unbekannter Umgebung

### Wanze (Bug)

*Input:*

- $P_1,\dots,P_n$ disj. einf. zsh. endl. poly. Gebiete aus $ℝ^2$
- $\mathbf{s}, \mathbf{z} \in ℝ^2 \setminus \bigcup_{i=1}^n P_i$
- R Roboter mit Position $\mathbf{r}$

*Output:*

- While $\mathbf{r} ≠ \mathbf{z}$
    - laufe in Richtung $\mathbf{z}$ bis $\mathbf{r}=\mathbf{z}$ oder $\exists i:r\in P_i$
    - If $\mathbf{r}≠\mathbf{z}$
        - umlaufe $P_i$ und suche ein $\mathbf{q}\in \arg\min_{\mathbf{x}\in P_i} ||\mathbf{x} - \mathbf{z}||_2$
        - gehe zu $\mathbf{q}$

terminiert.

Universales Steuerwort: Führt für alle Startpunkte zum geg. Ziel. (ungültige Befehle werden ignoriert)


## Behälterproblem (bin packing)

Maximale Füllmenge $h$, verteile Zahlenmenge auf möglichst wenige Behälter.
NP-hart.

First fit
~   *
    * $B_1,\dots,B_m \leftarrow \emptyset$
    * For $i=1,\dots,m$
        * Bestimme kleinstes j mit $b_i+\sum_{b\in B_j} b ≤ h$
        * Füge $b_i$ zu $B_j$ hinzu

2-kompetitiv

Falls $k_A ≤ a + c k_{min}$ für alle Eingaben, heißt A c-kompetitiv.

Türsuche
~   *
    * Wähle Erkundungstiefen $f_i > 0$ für $i\in \mathbb{N}$
    * For $i:=1$ to $\infty$ (stoppe, wenn Tür gefunden)
        * gehe $f_i$ Meter die Wand entlang und zurück
        * wechsle Laufrichtung

Legt $L=2\sum_{i=0}^n f_i + d$ zurück (oder $^{n+1}$)

$L\in\Theta(n^2) = \Theta(d^2)$

Bestmöglich: 9-kompetetitiv (z.B. für $f_i = 2^i$)

## Sternsuche

Gleich Türsuche, nur mit mehr als zwei Wänden (Halbgeraden).

Bestmöglich: Für $f_i = (\frac{m}{m-1})^i$ ist Sternsuche c-kompetitiv mit $c:=2m(\frac{m}{m-1})^{m-1} + 1 < 2me + 1$

## Suche in Polygonen

Roboter R sucht Weg in polygonalem Gebiet P mit n Ecken von $\mathbf{s}$ nach $\mathbf{z}$.

Weglängen: gefunden: $l$, kürzest: $d$

Strategie existiert mit $\frac{l}{d} \in O(n)$


Baum der kürzesten Wege (BkW) (Blätter sind Polygonecken)

---

# Konvexe Hüllen

## Dualität

$\mathbf{x} := \begin{pmatrix}1\\ \mathbf{\bar x}\end{pmatrix}, \bar{\mathbf x} \in \mathbb R^d$ bilden *affinen Raum* $A^d$.

$\mathbb u^t \mathbb x := \begin{pmatrix}u_0&u_1&\dots&u_d\end{pmatrix} \cdot\begin{pmatrix}1\\x_1\\\vdots x_d\end{pmatrix}≥  0$

$\mathbb u$ bezeichnet Halbraum und $\mathbb x$ einen seiner Punkte

Nur betrachtet mit $\begin{pmatrix}1&0&\dots&0\end{pmatrix}^t$ d.h. $u_0>0$, normiert $u_0=1$.

$\mathbf u^*$ ist Halbraum zu $\mathbf u$.

$\mathbf x \in \mathbf u^* \Leftrightarrow \mathbf u \in \mathbf x^*$ (Dualität)

## Konvexe Mengen

Verbindungsstrecke $\mathbf x := \mathbf a (1-t) + \mathbf b t,\quad t\in [0,1]$ wird genannt $\mathbf{ab}$.

$M⊂ A$ ist *konvex* wenn sie zu je zwei ihrer Punkte auch die Verbingungsstrecke enthält.

Konvexe Hülle $[M]$ von $M$ ist Schnitt aller konvexen Obermengen.

Ist $M⊂ A$ bilden alle Halbräume, die M enthalten, eine konvexe Menge im Dualraum.

Ist $M^*⊂ A^*$ eine Halbraummenge, bilden alle Punkte, die in allen $m^*\in M^*$ enthalten sind, eine konvexe Menge im Primalraum $A$.

## Konvexe Polyeder $P$

ist Schnitt endlich vieler Halbräume.

Rand $\partial P$; Facetten darauf.

Jede Facectte liegt auf Rand eines Halbraums (FHR)

P ist konvexe Hülle seiner Eckenmenge

Ist $P$ ein konvexes Polyeder mit den Ecken $\mathbf p_1,\dots,\mathbf p_e$ und den FHRen $\mathbf u_1^*,\dots,\mathbf u_f^*$, hat die Menge $U^*:=\{\mathbf u^*|\mathbf u^* \supset P\} ⊂ A^*$ die Ecken $\mathbf w_1^*,\dots,\mathbf w_f^*$ und die FHRe $\mathbf p_1, \dots,\mathbf p_e$. Dual ausgedrückt heißt das, dass die Menge $U:=\{\mathbf u| \mathbf u^* \supset P\}⊂ A$ die Ecken $\mathbf w_i$ und die FHRe $\mathbf p_i^*$ hat.

Polyeder P und $U⊂ A$ heißen dual zueinander.

## Euler: Knoten, Kanten, Facetten

v Knoten, e Kanten, f Seiten

Eulers Formel: $v-e+f=2$

## Datenstruktur für Netze

Für jede Ecke $\mathbf p$:

* Koordinaten von $\mathbf p$
* Liste von Zeigerpaaren:
    * die ersten Zeiger im Gegenuhrzeigersinn auf alle Nachbarn von $\mathbf p$
    * Sind $\mathbf{p,q,r}$ im GUS geordnete Nachbarn einer Facette und weist der 1. Zeiger eines Paares auf $\mathbf q$, zeigt der 2. Zeiger indirekt auf $\mathbf r$. Er weist auf das Zeigerpaar von q

## Konvexe Hülle

*Input:* $P:=(\mathbf p_1,\dots, \mathbf p_n) ⊂ A^3$

*Output:* $[P]$

1. Verschiebe P sodass Ursprung in P liegt
2. $U_4 \leftarrow \mathbf p_1^* ∩ \dots ∩ \mathbf p_4^*$
3. For $i=5,\dots,n$
    * (falls $U_4 ⊂ \mathbf p_i^*$, markiere $\mathbf p_i$ als gelöscht
    * sonst verknüpfe $\mathbf p_i$ bidirektional mit einem Knoten von $U_4 \notin \mathbf p_i^*$
4. For $i=5,\dots,n$
    * $U_i \leftarrow U_{i-1}∩\mathbf p_i^*$
    * ...zeug
4. Dualisiere, verschiebe und gib $\bigcap_{\mathbf u \in U} \mathbf u^*-\mathbf v$ aus

---

# Distanzprobleme

## Voronoi-Gebiet

eines der Punkte $\mathbf p_i$ ist $V_i=\{\mathbf x \in \mathbb R^2|\forall j=1,\dots,n:||\mathbf x - \mathbf p_i||_2 ≤ ||\mathbf x - \mathbf p_j||_2 \}$

$V_i$ ist konvex da Schnitt der Halbebenen.

Voroni-Kreis (Punkte des Schnitts von drei Voronoi-Gebieten) ist *leer*.

## Delaunay-Triangulierung

Delaunay-Triangulierung $D(P)$ einer Punktemenge P hat Kantenmenge $\{\mathbf p_i \mathbf p_j|V_i∩ V_j \text{ ist Kante des Voronoi-Diagramms } V(P)\}$.

Ist der zu $V(P)$ duale Graph.

Die Gebiete von $D(P)$ sind disjunkte Dreiecke und zerlegen die konvexe Hülle $[P]$

### Eigenschaften

#. Umkreise der Dreiecke sind leer
#. *Paraboloid-Eigenschaft:*

    Sei $Z(x,y) = x^2 + y^2$.

    Projiziert man den unteren Teil der konvexen Hülle $[\{\begin{pmatrix}\mathbf p_i\\Z(\mathbf p_i)\end{pmatrix}|i=1,\dots,n\}]$ orthogonal auf die xy-Ebene, erhält man $D(P)$

    * D(P) kann mit *Konvexe Hülle* und mittlerem Aufwand $O(n\log n)$ berechnet Werden

    * Kanten einer Triangulierung von Q sind konvex (Tal) oder konkav (Berg), ersetze sukzessiv in konkave durch konvexe Kanten
#. Winkeleigenschaft: Der kleinste Winkel in jedem Viereck ist größer bei DT als bei jeder anderen Triangulierung
#. jeder Punkt $\mathbf p_i$ ist mit nächstem Nachabarn durch Kante in $D(P)$ verbunden → nächste Nachbarn aller $p_i$ können in $O(n)$ bestimmt werden
#. minimale Spannbäume von P liegen auf D(P) (findbar mit Kruskal (greedy))
#. Rundweg um minimalen Spannbaum ist 2-kompetitiv zu kürzestem Rundweg.

---

**II Unterteilungsalgorithmen**

# Stationäre Unterteilung für Kurven

todo

---

# bla

Das Symbol $\gamma(x,y) := \sum \gamma_{ij} x^i y^j$

---

** III Graphen-Algorithmen **

# Flussmaximierung

Flussnetzwerk $F:= (G=(V,E), q \in V, s\in V, k:V^2\to \mathbb R_{≥0})$

Graph zusammenhängend (für jeden Knoten ex. Weg von q zu s), $|E|≥|V|-1$

Fluss $f:V^2\to\mathbb R$ mit

(1) $f≤ k$
(2) $\forall x,y\in V: f(x,y)=-f(y,x)$
(3) $\forall x\in V\setminus\{q,s\}:\sum f(x,V):=\sum_{y\in V}f(x,y)=0$

Residualgraph $G_f := (V, E_f:=\{e\in V^2 | f(e)<k(e)\})$

Residualnetz $F_f := (G_f, q, s, k_f:=k-f)$

## Methoden

### Ford-Fulkerson (naiv)

solange es einen Weg $q\leadsto s$ in $G_f$ gibt, erhöhe f maximal über diesen Weg.

### Edmonds-Karp

=FF, erhöhen immer längs eines kürzesten Pfades in $G_f$

### Präfluss-Pusch


Push(x,y)
~   *
    * $d\leftarrow \min\{\text ü(x), k_f(x,y)\}$
    * $f(x,y) \mathrel+= d$
    * ü$(x) \mathrel-= d$
    * ü$(y) \mathrel+= d$

Pushbar(x,y)
~   *
    * $x\in V\setminus \{q,s\}$
    * und $h(x)-h(y)=1$
    * und ü$(x)>0$
    * und $(x,y)\in E_f$

Lift(x)
~   * $h(x) \leftarrow 1+\min_{(x,y)\in E_f} h(y)$

Liftbar(x)
~   *
    * $x\in V\setminus \{q,s\}$
    * ü$(x) > 0$
    * $h(x) ≤ \min_{(x,y)\in E_f} h(x)$

Präfluss-Push:
~   *
    * for all $x,y\in V$
    * $h(x) ← \text{if }x=q\text{ then } |V| \text{ else } 0$
    * $f(x,y) ← \text{if }x=q\text{ then } k(x,y) \text{ else } 0$
    * solange es eine erlaubte Push oder Lift-Operation gibt, führe beliebige aus

### An-Die-Spitze

Leere(x)
~   *
    * while ü$(x)>0$
        * if $i_x ≤ Grad(x)$
            * if pushbar$(x,n_x(i_x))$ : push$(x,n_x(i_x))$
            * sonst: $i_x\mathrel+=1$
        * else
            * Lift(x)
            * $i_x ← 1$

$L$ ist Liste aller $x\in V\setminus \{q,s\}$ mit x vor y falls pushbar(x,y)

$n_x(i) \quad (1≤ i ≤ Grad(x))$  sind Nachbarn von $x$ (auch Gegenrichtung)

$i_x$ ist Zähler (alle $n_x(i)$ mit $i\le i_x$ nicht pushbar)

An die Spitze
~   * Initialisiere f und h wie bei *Präfluss-Push*
    * $\forall x\in V: i_x ← 1$
    * Generiere L
    * $x ← \text{Kopf}(L)$
    * while $x ≠ \text{NIL}$
        * $h_{alt} ← h(x)$
        * Leere(x)
        * Falls $h_{alt} < h(x)$, setze x an Spitze von L
        * $x ←$ Nachfolger von x in L

---

# Zuordnungsprobleme

## Paaren in bipartiten Graphen

Paare
~   * Input: Bipartiter Graph $(L\dot∪ R, E)$
    * $V ← L∪ R∪ \{q,s\}$
    * $\hat E ← (q,L) ∪ \{(x,y) ⊂ L \times R \mid \langle x,y \rangle \in E\} ∪ (R,s)$
    * for all $(x,y)\in V^2$
        * $k(x,y) ← 1$ if $(x,y)\in \hat E$ else $0$
    * f ← FordFulkerson$((V,\hat E), q, s, k)$
    * $P ← \{\langle x,y\rangle \in E \mid f(x,y)=1\}$

## Paaren in allgemeinen Graphen

Alternierender Weg ist *maximal*, wenn er nicht Teil eines längeren alternierenden Weges ist.

→ Maximale Paarung kann durch sukzessive Vergrößerung gefunden werden

## Berechnung vergrößender Wege

Vergrößernder Weg
~   * Input: G und P, Output: Vergrößernder Weg für P
    * $h(x) ← 0$ wenn x frei, -1 wenn x gebunden
    * Solange kein vergrößernder Pfad gefunden und gibt unutersuchte Kante $\langle x,y\rangle$ mit $h(x) \in 2ℕ_0$
    * if $h(y) = -1$
    * **unwichtig**

## Maximal gewichtete Paarungen

Berechnung möglich in $O(|V|^3)$ bzw. $O(|V|\cdot|E|\log|V|)$

# Minimale Schnitte

Sei

* $\bar G := (V, \bar E), \bar E := \{(x,y)|\langle y,x\rangle = \langle x,y\rangle \in E\}$
* $k:V^2→ℝ_{≥ 0}, k(x,y):= \text{if }(\langle x, y\rangle \in E)\text{ then }\gamma(\langle x,y\rangle)\text{ else }0$
* $x,z\in V$ beliebig

Berechne maximalen Fluss

→ $A:=\{y\mid \exists \text{ Pfad } x\leadsto y \text{ in } \bar G_f\}$ und $B:=V\setminus A$ bilden minimalen xz-Schnitt ($x\in A, z\in B$)

Gewicht des Schnitts = Wert des Flusses

kleinster xz-Schnitt in G lässt sich mit Flussmaximierung in $O(|V|^4)$ berechnen

(es existieren Algorithmen in $O(|V|^2 \log |V| + |V||E|)$)

## Zufällige Kontraktion

*ggf. todo*

*Monte-Carlo-Algorithmus* = stochastischer Algorithmus, kann falsche Ergebnisse Liefern

*Las-Vegas-Algorithmus* = stoch. Algo., immer richtig

## Rekursive Kontraktion

---

**IV Optimierungsalgorithmen**

# Kleinste Kugeln

Für jede Punktmenge $P$ ist die kleinste Kugel $K(P)\supset P$ eindeutig.

## Algorithmus von Welzl

$K(P,R)$ ist Kugel die P enthält und R auf der Oberfläche hat

Welzl
~   * Input: $P,R⊂ ℝ^d$, $K(P,R)$ exist., P,R endlich
    * if $P=\emptyset$ or $|R|=d+1$
        * $C ← K(R)$
    * else wähle $\mathbf p\in P$ zufällig
        * C ← Welzl$(P\setminus \{\mathbf p\}, R)$
        * if $\mathbf p \notin C$
            * $C←\text{Welzl}(P\setminus \{\mathbf p\}, R∪ \{\mathbf p\})$
    * Gib C aus

---

# Lineare Programmierung

LP ist

$$z(\mathbf x) := \mathbf{zx} = \text{max!}$$
$$A\mathbf x ≥ \mathbf a$$
