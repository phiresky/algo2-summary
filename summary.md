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
- $\-s, \-z \in ℝ^2 \setminus \bigcup_{i=1}^n P_i$
- R Roboter mit Position $\-r$

*Output:*

- While $\-r ≠ \-z$
    - laufe in Richtung $\-z$ bis $\-r=\-z$ oder $\exists i:r\in P_i$
    - If $\-r≠\-z$
        - umlaufe $P_i$ und suche ein $\-q\in \arg\min_{\-x\in P_i} ||\-x - \-z||_2$
        - gehe zu $\-q$

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

Roboter R sucht Weg in polygonalem Gebiet P mit n Ecken von $\-s$ nach $\-z$.

Weglängen: gefunden: $l$, kürzest: $d$

Strategie existiert mit $\frac{l}{d} \in O(n)$


Baum der kürzesten Wege (BkW) (Blätter sind Polygonecken)

---

# Konvexe Hüllen

## Dualität

$\-x := \begin{pmatrix}1\\ \-{\bar x}\end{pmatrix}, \bar{\-x} \in \mathbb R^d$ bilden *affinen Raum* $A^d$.

$\mathbb u^t \mathbb x := \begin{pmatrix}u_0&u_1&\dots&u_d\end{pmatrix} \cdot\begin{pmatrix}1\\x_1\\\vdots x_d\end{pmatrix}≥  0$

$\mathbb u$ bezeichnet Halbraum und $\mathbb x$ einen seiner Punkte

Nur betrachtet mit $\begin{pmatrix}1&0&\dots&0\end{pmatrix}^t$ d.h. $u_0>0$, normiert $u_0=1$.

$\-u^*$ ist Halbraum zu $\-u$.

$\-x \in \-u^* \Leftrightarrow \-u \in \-x^*$ (Dualität)

## Konvexe Mengen

Verbindungsstrecke $\-x := \-a (1-t) + \-b t,\quad t\in [0,1]$ wird genannt $\-{ab}$.

$M⊂ A$ ist *konvex* wenn sie zu je zwei ihrer Punkte auch die Verbingungsstrecke enthält.

Konvexe Hülle $[M]$ von $M$ ist Schnitt aller konvexen Obermengen.

Ist $M⊂ A$ bilden alle Halbräume, die M enthalten, eine konvexe Menge im Dualraum.

Ist $M^*⊂ A^*$ eine Halbraummenge, bilden alle Punkte, die in allen $m^*\in M^*$ enthalten sind, eine konvexe Menge im Primalraum $A$.

## Konvexe Polyeder $P$

ist Schnitt endlich vieler Halbräume.

Rand $\partial P$; Facetten darauf.

Jede Facectte liegt auf Rand eines Halbraums (FHR)

P ist konvexe Hülle seiner Eckenmenge

Ist $P$ ein konvexes Polyeder mit den Ecken $\-p_1,\dots,\-p_e$ und den FHRen $\-u_1^*,\dots,\-u_f^*$, hat die Menge $U^*:=\{\-u^*|\-u^* \supset P\} ⊂ A^*$ die Ecken $\-w_1^*,\dots,\-w_f^*$ und die FHRe $\-p_1, \dots,\-p_e$. Dual ausgedrückt heißt das, dass die Menge $U:=\{\-u| \-u^* \supset P\}⊂ A$ die Ecken $\-w_i$ und die FHRe $\-p_i^*$ hat.

Polyeder P und $U⊂ A$ heißen dual zueinander.

## Euler: Knoten, Kanten, Facetten

v Knoten, e Kanten, f Seiten

Eulers Formel: $v-e+f=2$

## Datenstruktur für Netze

Für jede Ecke $\-p$:

* Koordinaten von $\-p$
* Liste von Zeigerpaaren:
    * die ersten Zeiger im Gegenuhrzeigersinn auf alle Nachbarn von $\-p$
    * Sind $\-{p,q,r}$ im GUS geordnete Nachbarn einer Facette und weist der 1. Zeiger eines Paares auf $\-q$, zeigt der 2. Zeiger indirekt auf $\-r$. Er weist auf das Zeigerpaar von q

## Konvexe Hülle

*Input:* $P:=(\-p_1,\dots, \-p_n) ⊂ A^3$

*Output:* $[P]$

1. Verschiebe P sodass Ursprung in P liegt
2. $U_4 \leftarrow \-p_1^* ∩ \dots ∩ \-p_4^*$
3. For $i=5,\dots,n$
    * (falls $U_4 ⊂ \-p_i^*$, markiere $\-p_i$ als gelöscht
    * sonst verknüpfe $\-p_i$ bidirektional mit einem Knoten von $U_4 \notin \-p_i^*$
4. For $i=5,\dots,n$
    * $U_i \leftarrow U_{i-1}∩\-p_i^*$
    * ...zeug
4. Dualisiere, verschiebe und gib $\bigcap_{\-u \in U} \-u^*-\-v$ aus

---

# Distanzprobleme

## Voronoi-Gebiet

eines der Punkte $\-p_i$ ist $V_i=\{\-x \in \mathbb R^2|\forall j=1,\dots,n:||\-x - \-p_i||_2 ≤ ||\-x - \-p_j||_2 \}$

$V_i$ ist konvex da Schnitt der Halbebenen.

Voroni-Kreis (Punkte des Schnitts von drei Voronoi-Gebieten) ist *leer*.

## Delaunay-Triangulierung

Delaunay-Triangulierung $D(P)$ einer Punktemenge P hat Kantenmenge $\{\-p_i \-p_j|V_i∩ V_j$ ist Kante des Voronoi-Diagramms $V(P)\}$.

Ist der zu $V(P)$ duale Graph.

Die Gebiete von $D(P)$ sind disjunkte Dreiecke und zerlegen die konvexe Hülle $[P]$

### Eigenschaften

#. Umkreise der Dreiecke sind leer
#. *Paraboloid-Eigenschaft:*

    Sei $Z(x,y) = x^2 + y^2$.

    Projiziert man den unteren Teil der konvexen Hülle $[\{\begin{pmatrix}\-p_i\\Z(\-p_i)\end{pmatrix}|i=1,\dots,n\}]$ orthogonal auf die xy-Ebene, erhält man $D(P)$

    * D(P) kann mit *Konvexe Hülle* und mittlerem Aufwand $O(n\log n)$ berechnet Werden

    * Kanten einer Triangulierung von Q sind konvex (Tal) oder konkav (Berg), ersetze sukzessiv in konkave durch konvexe Kanten
#. Winkeleigenschaft: Der kleinste Winkel in jedem Viereck ist größer bei DT als bei jeder anderen Triangulierung
#. jeder Punkt $\-p_i$ ist mit nächstem Nachabarn durch Kante in $D(P)$ verbunden → nächste Nachbarn aller $p_i$ können in $O(n)$ bestimmt werden
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

**III Graphen-Algorithmen**

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
    * else wähle $\-p\in P$ zufällig
        * C ← Welzl$(P\setminus \{\-p\}, R)$
        * if $\-p \notin C$
            * $C←\text{Welzl}(P\setminus \{\-p\}, R∪ \{\-p\})$
    * Gib C aus

---

# Lineare Programmierung

## Lineare Programme

LP ist

$$z(\-x) := \-{zx} = \text{max!}$$
$$A\-x ≥ \-a,$$

wobei $\-z,\-x \in ℝ^d, A\in ℝ^{n×d}, \-a \in ℝ^n$, und $\-{zx}:=\-z^t\-x$

d ist die Dimension des linearen Programms.

Die Ungleichungen $A\-x ≥ \-a$ repräsentieren den Schnitt S von n Halbräumen, der *Simplex* genannt wird.

Die Punkte $\-x \in S$ heißen *zulässig*.

Die Ecken von S liegen je auf d Hyperebenen (d Gleichungen des Gleichungssystems).

* Simplexalgorithmus: Iterativ Ecken entlang gehen, bis z maximal.


## Flussmaximierung als LP

maximiere Summe der ausgehenden Flüsse aus der Quelle.

Gleichungen zur Flusserhaltung (je eingehende Kanten - ausgehende Kanten = 0 ($≥$ und $≤$))

Gleichungen zur Kapazitätsbeschränkung (Fluss $≥$ 0 und (Kapazität - Fluss) $≥$ 0)

## Kürzester Weg als LP

Suche Weg $1\leadsto 2$

$$\sum_{(i,j)\in E} x_{ij}\gamma_{ij} = \text{min!}$$
$$x_{ij} ≥ 0, (i,j)\in E$$
$$\sum_j x_{ij} - \sum_j x_{ji} = \begin{cases}1&i=1\\-1&i=2\\0&sonst\end{cases}$$

(Ausgehende Kanten = Eingehende Kanten außer für $i≠1,2$)

negative Kreise $⇒$ keine endliche Lösung. Erzwingbar durch $x_{ij} ≤ 1, (i,j)\in E$ (?)

## *ggf. todo*

## Simplexalgorithmus

$\-y(\-x) = A\-x$
$$\left[\begin{matrix}y_1\\\vdots\\y_m\end{matrix}\right] = \left[\begin{matrix}a_{11}&\dots&a_{1n}\\\vdots&&\vdots\\a_{m1}&\dots&a_{mn}\end{matrix}\right]\left[\begin{matrix}x_1\\\vdots\\x_n\end{matrix}\right]$$

wobei $n=d+1$ und $x_n=1$

Hyperebenen $H_i:y_i(\-x)=0$

Gegeben: $A=[a_{ij}]_{i,j=1,1}^{m,n}$

$$
\begin{array}{c|ccccc}
&&x_j&&x_s&\\ \hline
&&\vdots&&\vdots&\\
y_i&\dots&a_{ij}&\dots&a_{is}&\dots\\
&&\vdots&&\vdots&\\
y_r&\dots&a_{rj}&\dots&a_{rs}&\dots\\
&&\vdots&&\vdots&\\
\end{array}$$

Gesucht: $B=[b_{ij}]_{i,j=1,1}^{m,n}$ r=Pivotzeile, s=Pivotspalte

Austausch
~   *
    * $b_{rs} ← \frac{1}{a_{rs}}$   
    * $b_{rj} ← - \frac{a_{rj}}{a_{rs}}$ (Pivotzeile, $j≠s$)
    * $b_{is} ← \frac{a_{is}}{a_{rs}}$ (Pivotspalte, $i≠r$)
    * $b_{ij} ← a_{ij} - \frac{a_{is}{a_{rj}}}{a_{rs}}$ ($i≠r,j≠s$)


## Normalform

Jedes lin. Programm kann auf die Form

$$\-z\-x = \text{max!}$$
$$A\-x ≥ 0$$

mit $\-x=[x_1\dots x_d\,1]^t$ kann auf die Form

$$[\-c^t c]\-y = \text{max!}$$
$$\-y ≥ 0$$
$$[B\-b]\-y ≥ 0$$

mit $\-y := [y_1\dots y_d\,1]^t$ gebracht werden.

Notation:
$$
\begin{array}{cccl}
                                & x_{0\dots d}          & 1                        &                \\ \cline{2-3}
\multicolumn{1}{r|}{y_{d+1}=}   &                       & \multicolumn{1}{l|}{}    &                \\
\multicolumn{1}{r|}{\vdots}     & B                     & \multicolumn{1}{l|}{\-b} & ≥0             \\
\multicolumn{1}{r|}{y_m=}       &                       & \multicolumn{1}{l|}{}    &                \\ \cline{2-3}
\multicolumn{1}{r|}{z=}         & \-c^t & \multicolumn{1}{l|}{c}   & =\text{max!} \\ \cline{2-3}
\end{array}
$$

$\-b≥0$, sonst Simplex leer.

## Simplexalgorithmus



Simplex
~   * Input: $\bar A$ Normalformmatrix eines lin. Progr. $\bar A := \left[\begin{matrix}A&\-a\\\-c^t&c\end{matrix}\right]$
    * Solange ein $c_s > 0$
        * Falls alle $a_{is} ≥0$
            * gib $c←∞$ aus
            * Ende
        * sonst
            * bestimme r so, dass
            * $$\frac{a_r}{a_{rs}} = \max_{a_{is} < 0} \frac{a_i}{a_{is}}$$
            * $\bar A ← \text{Austausch}(\bar A, r, s)$
    * Gib $\bar A$ aus

Die Lösung ist dann, dass alle $y_i$ die oben an der Tabelle stehen = 0 sind.

---

**Util**

* $\-a \cdot \-b = |\-a||\-b| \cos\sphericalangle(\-a,\-b)$

<style>dd ul{list-style-type:none}</style>

$\def\-#1{\mathbf{#1}}$
