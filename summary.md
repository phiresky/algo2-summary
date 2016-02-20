---
---

<style>dd ul{list-style-type:none}</style>

**Laufzeiten**

Kapitel|Name|Laufzeit|
-------|----|--------|
1.1 Ausweg aus einem Labyrinth|Pledge|||
1.2|Wanze(Bug)|||
2.6 Zielsuche|Konvexe Hülle|erw: $O(n\log n)$, max: $O(n^2)$|
6 Flussmaximierung|Ford-Fulkerson|max: $O(|E|*W)$ (k Wert eines max. Flusses)|
6 Flussmaximierung|Edmonds-Karp  |max: $O(|E|^2 * |V|)$|
6 Flussmaximierung|Präfluss-Push |max: $O(|V|^2 * |E|)$|
6 Flussmaximierung|An-Die-Spitze |max: $O(|V|^3)$|
9|Welzl|erw: $O(n)$|
10|Simplex|erw: $O(n^2 d)$, max: $\Omega(n^{d/2})$ |
10|Ellipsoid|polyn.; in praxis langsamer als Simplex|
10|Innere Punkte|polyn.; in praxis fast so gut wie Simplex|
10.5|Seidel|max: $O(d^3 d! + dnd!)$|

**Util**

* $\mathbf a \cdot \mathbf b = |\mathbf a||\mathbf b| \cos\sphericalangle(\mathbf a,\mathbf b)$

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

- While $\mathbf{r} \neq \mathbf{z}$
    - laufe in Richtung $\mathbf{z}$ bis $\mathbf{r}=\mathbf{z}$ oder $\exists i:r\in P_i$
    - If $\mathbf{r}\neq\mathbf{z}$
        - umlaufe $P_i$ und suche ein $\mathbf{q}\in \arg\min_{\mathbf{x}\in P_i} ||\mathbf{x} - \mathbf{z}||_2$
        - gehe zu $\mathbf{q}$

terminiert.

Universales Steuerwort: Führt für alle Startpunkte zum geg. Ziel. (ungültige Befehle werden ignoriert)


## Behälterproblem (bin packing)

Maximale Füllmenge $h$, verteile Zahlenmenge auf möglichst wenige Behälter.
NP-hart.

First fit
~   * $B_1,\dots,B_m \leftarrow \emptyset$
    * For $i=1,\dots,m$
        * Bestimme kleinstes j mit $b_i+\sum_{b\in B_j} b \leq h$
        * Füge $b_i$ zu $B_j$ hinzu

2-kompetitiv

Falls $k_A \leq a + c k_{min}$ für alle Eingaben, heißt A c-kompetitiv.

Türsuche
~   * Wähle Erkundungstiefen $f_i > 0$ für $i\in \mathbb{N}$
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


# Konvexe Hüllen

## Dualität

$\mathbf{x} := \pmatrix{1\\ \mathbf{\bar x}}, \bar{\mathbf x} \in \mathbb R^d$ bilden *affinen Raum* $A^d$.

$\mathbb u^t \mathbb x := \pmatrix{u_0&u_1&\dots&u_d} \pmatrix{1\\x_1\\\vdots x_d}\geq  0$

$\mathbb u$ bezeichnet Halbraum und $\mathbb x$ einen seiner Punkte

Nur betrachtet mit $\pmatrix{1&0&\dots&0}^t$ d.h. $u_0>0$, normiert $u_0=1$.

$\mathbf u^*$ ist Halbraum zu $\mathbf u$.

$\mathbf x \in \mathbf u^* \Leftrightarrow \mathbf u \in \mathbf x^*$ (Dualität)

## Konvexe Mengen

Verbindungsstrecke $\mathbf x := \mathbf a (1-t) + \mathbf b t,\quad t\in [0,1]$ wird genannt $\mathbf{ab}$.

$M\subset A$ ist *konvex* wenn sie zu je zwei ihrer Punkte auch die Verbingungsstrecke enthält.

Konvexe Hülle $[M]$ von $M$ ist Schnitt aller konvexen Obermengen.

Ist $M\subset A$ bilden alle Halbräume, die M enthalten, eine konvexe Menge im Dualraum.

Ist $M^*\subset A^*$ eine Halbraummenge, bilden alle Punkte, die in allen $m^*\in M^*$ enthalten sind, eine konvexe Menge im Primalraum $A$.

## Konvexe Polyeder $P$

ist Schnitt endlich vieler Halbräume.

Rand $\partial P$; Facetten darauf.

Jede Facectte liegt auf Rand eines Halbraums (FHR)

P ist konvexe Hülle seiner Eckenmenge

Ist $P$ ein konvexes Polyeder mit den Ecken $\mathbf p_1,\dots,\mathbf p_e$ und den FHRen $\mathbf u_1^*,\dots,\mathbf u_f^*$, hat die Menge $U^*:=\{\mathbf u^*|\mathbf u^* \supset P\} \subset A^*$ die Ecken $\mathbf w_1^*,\dots,\mathbf w_f^*$ und die FHRe $\mathbf p_1, \dots,\mathbf p_e$. Dual ausgedrückt heißt das, dass die Menge $U:=\{\mathbf u| \mathbf u^* \supset P\}\subset A$ die Ecken $\mathbf w_i$ und die FHRe $\mathbf p_i^*$ hat.

Polyeder P und $U\subset A$ heißen dual zueinander.

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

*Input:* $P:=(\mathbf p_1,\dots, \mathbf p_n) \subset A^3$

*Output:* $[P]$

1. Verschiebe P sodass Ursprung in P liegt
2. $U_4 \leftarrow \mathbf p_1^* \cap \dots \cap \mathbf p_4^*$
3. For $i=5,\dots,n$
    * (falls $U_4 \subset \mathbf p_i^*$, markiere $\mathbf p_i$ als gelöscht
    * sonst verknüpfe $\mathbf p_i$ bidirektional mit einem Knoten von $U_4 \notin \mathbf p_i^*$
4. For $i=5,\dots,n$
    * $U_i \leftarrow U_{i-1}\cap\mathbf p_i^*$
    * ...zeug
4. Dualisiere, verschiebe und gib $\bigcap_{\mathbf u \in U} \mathbf u^*-\mathbf v$ aus

# Distanzprobleme

## Voronoi-Gebiet

eines der Punkte $\mathbf p_i$ ist $V_i=\{\mathbf x \in \mathbb R^2|\forall j=1,\dots,n:||\mathbf x - \mathbf p_i||_2 \leq ||\mathbf x - \mathbf p_j||_2 \}$

$V_i$ ist konvex da Schnitt der Halbebenen.

Voroni-Kreis (Punkte des Schnitts von drei Voronoi-Gebieten) ist *leer*.

## Delaunay-Triangulierung

Delaunay-Triangulierung $D(P)$ einer Punktemenge P hat Kantenmenge $\{\mathbf p_i \mathbf p_j|V_i\cap V_j \text{ ist Kante des Voronoi-Diagramms } V(P)\}$.

Ist der zu $V(P)$ duale Graph.

Die Gebiete von $D(P)$ sind disjunkte Dreiecke und zerlegen die konvexe Hülle $[P]$

### Eigenschaften

#. Umkreise der Dreiecke sind leer
#. *Paraboloid-Eigenschaft:*

    Sei $Z(x,y) = x^2 + y^2$.

    Projiziert man den unteren Teil der konvexen Hülle $[\{\pmatrix{\mathbf p_i\\Z(\mathbf p_i)}|i=1,\dots,n\}]$ orthogonal auf die xy-Ebene, erhält man $D(P)$

    * D(P) kann mit *Konvexe Hülle* und mittlerem Aufwand $O(n\log n)$ berechnet Werden

    * Kanten einer Triangulierung von Q sind konvex (Tal) oder konkav (Berg), ersetze sukzessiv in konkave durch konvexe Kanten
#. Winkeleigenschaft: Der kleinste Winkel in jedem Viereck ist größer bei DT als bei jeder anderen Triangulierung
#. jeder Punkt $\mathbf p_i$ ist mit nächstem Nachabarn durch Kante in $D(P)$ verbunden → nächste Nachbarn aller $p_i$ können in $O(n)$ bestimmt werden
#. minimale Spannbäume von P liegen auf D(P) (findbar mit Kruskal (greedy))
#. Rundweg um minimalen Spannbaum ist 2-kompetitiv zu kürzestem Rundweg.

# bla

todo


# bla

todo

# Flussmaximierung

Flussnetzwerk $F:= (G=(V,E), q \in V, s\in V, k:V^2\to \mathbb R_{\geq0})$


Fluss $f:V^2\to\mathbb R$ mit

(1) $f\leq k$
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
~   * $d\leftarrow \min\{ü(x), k_f(x,y)\}$
    * $f(x,y) \mathrel+= d$
    * $ü(x) \mathrel-= d$
    * $ü(y) \mathrel+= d$

Pushbar(x,y)
~   * $x\in V\setminus \{q,s\}$
    * und $h(x)-h(y)=1$
    * und $ü(x)>0$
    * und $(x,y)\in E_f$

Lift(x)
~   * $h(x) \leftarrow 1+\min_{(x,y)\in E_f} h(y)$

Liftbar(x)
~   * $x\in V\setminus \{q,s\}$
    * $ü(x) > 0$
    * $h(x) \leq \min_{(x,y)\in E_f} h(x)$

Präfluss-Push:
~   * for all $x,y\in V$
    * $h(x) ← \text{if }x=q\text{ then } |V| \text{ else } 0$
    * $f(x,y) ← \text{if }x=q\text{ then } k(x,y) \text{ else } 0$
    * solange es eine erlaubte Push oder Lift-Operation gibt, führe beliebige aus

### An-Die-Spitze

Leere(x)
~   * while $ü(x)>0$
        * if $i_x \leq Grad(x)$
            * if pushbar$(x,n_x(i_x))$ : push$(x,n_x(i_x))$
            * sonst: $i_x\mathrel+=1$
        * else
            * Lift(x)
            * $i_x ← 1$

$L$ ist Liste aller $x\in V\setminus \{q,s\}$ mit x vor y falls pushbar(x,y)

$n_x(i) \quad (1\leq i \leq Grad(x))$  sind Nachbarn von $x$ (auch Gegenrichtung)

$i_x$ ist Zähler (alle $n_x(i)$ mit $i\le i_x$ nicht pushbar)

An die Spitze
~   * Initialisiere f und h wie bei *Präfluss-Push*
    * $\forall x\in V: i_x ← 1$
    * Generiere L
    * $x ← \text{Kopf}(L)$
    * while $x \neq \text{NIL}$
        * $h_{alt} ← h(x)$
        * Leere(x)
        * Falls $h_{alt} < h(x)$, setze x an Spitze von L
        * $x ←$ Nachfolger von x in L
