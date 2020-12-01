# LaTeX Klasse: Protokoll
![Version 0.0.3 Badge][version-badge]

[Changelog](CHANGELOG.md)

[Dokumentation](Dokumentation_Klasse_Protokoll.pdf)

---

Dieses Template stellt die LaTeX Klasse 'Protokoll' zur Verfügung.
Diese stellt eine große Zahl an nützlichen [Paketen](#Pakete) für ein Protokoll im naturwissenschaftlichen Rahmen zur Verfügung. Zusätzlich werden diese Pakete direkt richtig konfiguriert.

Darüber hinaus stellt das Paket eine große Zahl an nützlichen Befehlen zur Verfügung.

Über die Pakete im Ordner *Styles* werden vordefinierte [Stile](#Stile) angeboten.

---

Die Kompilierung erfolgt über *pdflatex*. Die Folge für eine komplette Kompilierung sieht wie folgt aus. Man beachte den Zusatz `--shell-escape` der durch die tikzlibary *external* benötigt wird.: <br>
`pdflatex -synctex=1 -interaction=nonstopmode --shell-escape %.tex` <br>
`pdflatex -synctex=1 -interaction=nonstopmode --shell-escape %.tex` <br>
`makeindex %.idx` <br>
`makeglossaries %` <br>
`bibtex %`<br>
`pdflatex -synctex=1 -interaction=nonstopmode --shell-escape %.tex` <br>

`makeindex` wird für das Packet *imakeidx* benötigt. <br>
`makeglossaries` wird für das Packet *glossaries* benötigt. <br>
Für `makeglossaries` muss <a href="https://www.activestate.com/activeperl/downloads">ActivePerl</a> installiert sein. Nach der Installation muss perltex einmal ausgeführt werden: `perltex`

---

#### Installation

Um dieses Paket zu nutzen, muss es einfach runtergeladen werden. Im Verzeichnis kann dann eine LaTeX Datei angelegt werden, welche die Klasse und optional die Stile importiert.

`\documentclass[]{Protokoll}`

`\usepackage{Styles/HHU_Default}`

#### 

---
#### Pakete

Paket | Seit&nbsp;Version&nbsp;&nbsp;&nbsp;&nbsp; | Nutzen
--- | --- | ---
nag | `Alpha: 0.0.1` | Old habits die hard. Warnt vor veralteten Befehlen.
etoolbox | `Alpha: 0.0.1` | Bietet Alternative Wege für LaTeX Kernel Befehle an.
xkeyval | `Alpha: 0.0.1` | Bietet ein Key/Value System für Paket/Klassen Optionen an.
KOMA-Script | `Alpha: 0.0.1` | Umfangreiches Paket, stellt die Grundklasse zur Verfügung.
inputenc | `Alpha: 0.0.1` | Ermöglicht verschiedene Codierungen für den Quellcode. (Hier *UTF-8*)
fontenc | `Alpha: 0.0.1` | Ermöglicht verschiedene Codierung im erstellten PDF.
lmodern | `Alpha: 0.0.1` | Stellt die Schriftart *Latin Modern* zur Verfügung. Erhöht die Schriftauflösung.
import | `Alpha: 0.0.1` | Ermöglicht eine verbesserte Importierung von externen Datein.
micotype | `Alpha: 0.0.1` | Verbessert mikrotypografische Einstellungen.
blindtext | `Alpha: 0.0.1` | Ermöglicht Platzhaltertexte.
everypage | `Alpha: 0.0.1` | Stellt einen Hook für jeden Seitenbeginn zur Verfügung.
abstract | `Alpha: 0.0.1` | Stellt eine *abstract* Umgebung zur Verfügung.
environ | `Alpha: 0.0.1` | Erleichtert und verbessert Erstellung von Umgebungen.
chngcntr | `Alpha: 0.0.1` | Lässt Counter bei Hooks zurücksetzen (z.B. jede Section).
babel | `Alpha: 0.0.1` | Übersetzt Vieles. (Hier: *Deutsch*)
geometry | `Alpha: 0.0.1` | Ermöglicht Papier und Dokumenteneinstellung.
pdflscape | `Alpha: 0.0.1` | Ermöglicht Querformat.
caption | `Alpha: 0.0.1` | Captions können präzise angepasst werden.
scrlayer-scrpage | `Alpha: 0.0.1` | Erweiterungspacket von KOMA-Script, ermöglicht Anpassung von Headern und Footern.
tocbasic | `Alpha: 0.0.1` | Ermöglicht Anpassungen des TOC.
tabto | `Alpha: 0.0.1` | Stellt einen Ersatz für Tab zur Verfügung.
enumitem | `Alpha: 0.0.1` | Ermöglicht die präzise Erstellung von Aufzählungen.
multicol | `Alpha: 0.0.1` | Ermöglicht mehrspaltige Dokumente. Schließt auf der letzten Seite der Umgebung alle Spalten auf der gleichen Höhe ab.
graphicx | `Alpha: 0.0.1` | Einbindung von Grafiken.
wrapfig | `Alpha: 0.0.1` | Ermöglicht Floats von Text umfließen zu lassen.
pgfplots | `Alpha: 0.0.1` | Ermöglicht Darstellung von Plots aus externen/internen Dateien.
TikZ | `Alpha: 0.0.1` | *Teil von pfgplots* Ermöglicht das Programmieren von Vektorgrafiken.
float | `Alpha: 0.0.1` | Verbessert Floats. Ermöglicht präzise Positionierung.
svg | `Alpha: 0.0.1` | Ermöglicht die Einbindung von SVGs.
tcolorbox | `Alpha: 0.0.1` | Ermöglicht Farbboxen
subcaption | `Alpha: 0.0.1` | Ermöglicht Floats in Floats mit eigenen Captions
amsfonts | `Alpha: 0.0.1` | Schriften für Mathematikumgebung
amsmath | `Alpha: 0.0.1` | Schriften für Mathematikumgebung
amssymb | `Alpha: 0.0.1` | Schriften für Mathematikumgebung
sansmathfonts | `Alpha: 0.0.1` | Schriften für Mathematikumgebung
cancel | `Alpha: 0.0.1` | Ermöglicht (durch)streichen
cases | `Alpha: 0.0.1` | Ermöglicht Mathematische Fälle
nicefrac | `Alpha: 0.0.1` | Ermöglicht Querbrüche
autobreak | `Alpha: 0.0.1` | Formeln im Align werden umgebrochen
gauss | `Alpha: 0.0.1` | Ermöglicht Gaussche Eliminierung
siunitx | `Alpha: 0.0.1` | Darstellung von Einheiten und Potenzen
mhchem | `Alpha: 0.0.1` | Chemiepacket, großer Umfang (\\ce)
chemmacros | `Alpha: 0.0.1` | Chemiepacket, großer Umfang (\\ch)
chemformula | `Alpha: 0.0.1` | *Teil von chemmacros* Chemiepacket (\\ch)
ghsystem | `Alpha: 0.0.1` | *Teil von chemmacros* Chemiepacket
chemfig | `Alpha: 0.0.1` | Zeichnen von chemischen Strukturen
textgreek | `Alpha: 0.0.1` | Ermöglicht grichische Zeichen auch ohne Matheumgebung
listings | `Alpha: 0.0.1` | Ermöglicht schöne Darstellung von Programmiercodes
physics | `Alpha: 0.0.1` | Viele kleine nützliche Mathematische Ausdrücke
natbib | `Alpha: 0.0.1` | Erzeugt Literaturverzeichnis aus bib Datei
babelbib | `Alpha: 0.0.1` | Stellt Packete für Deutsches Literaturverzeichnis zur Verfügung
url | `Alpha: 0.0.1` | Ermöglicht Links
hyperref | `Alpha: 0.0.1` | Erlaubt Referenzierung und Anpassung dieser innerhalb des Dokumentes. Metadaten des Dokuments können angepasst werden.
cleveref | `Alpha: 0.0.1` | Verbessert Referenzierung
hypcap | `Alpha: 1.00` | Korrigiert Anker zu Floats
imakeidx | `Alpha: 0.0.1` | Ermöglicht Index
tablefootnote | `Alpha: 0.0.1` | Ermöglicht footnotes aus Table Floats
acronym | `Alpha: 0.0.1` <br> ~~`Alpha: 0.0.4`~~| Stellt Abkürzungen und deren Verzeichnis zur Verfügung <br> Seit `Alpha: 0.0.4` deprecated
lastpage | `Alpha: 0.0.1` | Hook zur letzen Seite
tabularx | `Alpha: 0.0.1` | Tabellen deren Breite definierbar ist
tabu | `Alpha: 0.0.1` | Vielseitiges Tabellenpaket
tabulary | `Alpha: 0.0.1` | Tabellen deren Höhe definierbar ist
array | `Alpha: 0.0.1` | Anpassungen von Tabellenzellen und Textpositionierung in diesen
booktabs | `Alpha: 0.0.1` | Tabellenrahmengestalltung
longtable | `Alpha: 0.0.1` | Tabellen die über mehrere Seiten gehen können
multirow | `Alpha: 0.0.1` | Übergreifende Zellen
pgfplotstable | `Alpha: 0.0.1` | Erzeugt Tabellen aus externen Dateien
xcolor | `Alpha: 0.0.1` | Ermöglicht farbige Texte und Boxen
changes | `Alpha: 0.0.1` | Ermöglicht Kommentare
qrcode | `Alpha: 0.0.1` | Stellt QRCodes zur Verfügung
helvet | `Alpha: 0.0.1` `HHU_Default` | Lädt die Schriftart Helvet
setspace | `Alpha: 0.0.1` `HHU_Default` | Ermöglicht die Beeinflussung vom Zeilenabstand
xltabular | `Alpha: 0.0.3` | Ermöglicht Tabellen deren Breite definierbar ist und die über mehrere Seiten gehen können
PhysicalConstants | `Alpha: 0.0.3` | **Eigenes Packet** Enthält Naturkonstanten
glossaries | `Alpha: 0.0.4` | Stellt Abkürzungen und deren Verzeichnis zur Verfügung 
todonotes | `Alpha: 0.0.4` | Erlaubt Notizen im erstellten Dokument
PhysicalConstants | `Alpha: 0.0.4` | **Eigenes Packet** Erlaubt die schnelle Darstellung von Schwingungsarten

---
#### Stile

Stil | <nobr>Seit Version</nobr> | Nutzen
--- | --- | ---
HHU_Default | `Alpha: 0.0.1` | Protokoll für die Heinrich-Heine-Universität


[version-badge]: https://img.shields.io/badge/version-Alpha_0.0.3-blue.svg
