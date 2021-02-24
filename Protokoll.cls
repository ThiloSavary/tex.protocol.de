% MIT License
%
% Copyright (c) 2020 ThiloSavary
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.


\RequirePackage[l2tabu, orthodox]{nag}								% Warnt vor deprecated
\RequirePackage{etoolbox}                                           
\RequirePackage{xkeyval}

% ----------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Protokoll}[2019/10/12]

\LoadClass[
    10pt,                                                           % Schriftgröße 10pt
    listof=totoc,                                                   % Gleitumgebungen in TOC
    bibliography=totoc,                                             % Literatur in TOC
    ngerman
]{scrartcl}

% ----------------------------------------------------
% 				Class Options
% ----------------------------------------------------

\define@boolkey+{Protokoll.cls}[cls]{titlepage}[true]{\relax}{\PackageError{informatics.cls}{The 'titlepage' option only allows the following values: 'true', 'false'}\relax}

\define@boolkey+{Protokoll.cls}[cls]{showframe}[true]{\relax}{\PackageError{Protokoll.cls}{The 'showframe' option only allows the following values: 'true', 'false'}\relax}

\newif\ifclstableofcontent
\define@choicekey+{Protokoll.cls}{tableofcontent}{default}[default]{%
	\def\cls@tableofcontent@settings{\csname cls@tableofcontent@settings@#1\endcsname}
	\clstableofcontenttrue
}{\PackageError{Protokoll.cls}{The 'tableofcontent' option allows only the following values: 'default'}\relax}

\newif\ifclslistoffigures
\define@choicekey+{Protokoll.cls}{listoffigures}{default}[default]{%
	\def\cls@listoffigures@settings{\csname cls@listoffigures@settings@#1\endcsname}
	\clslistoffigurestrue
}{\PackageError{Protokoll.cls}{The 'listoffigures' option allows only the following values: 'default'}\relax}

\newif\ifclslistoftables
\define@choicekey+{Protokoll.cls}{listoftables}{default}[default]{%
	\def\cls@listoftables@settings{\csname cls@listoftables@settings@#1\endcsname}
	\clslistoftablestrue
}{\PackageError{Protokoll.cls}{The 'listoftables' option allows only the following values: 'default'}\relax}

\newif\ifclsacro
\define@choicekey+{Protokoll.cls}{acro}{default, list}[default]{%
	\def\cls@acro@display{\csname cls@acro@display@#1\endcsname}
	\clsacrotrue
}{\PackageError{Protokoll.cls}{The 'acro' option allows only the following values: 'default' and 'list'}\relax}

\newif\ifclsresetacro
\define@choicekey+{Protokoll.cls}{reset-acro}{section}[section]{%
	\def\cls@reset@acro@settings{\csname cls@reset@acro@settings@#1\endcsname}
	\clsresetacrotrue
}{\PackageError{Protokoll.cls}{The 'reset-acro' option allows only the following values: 'section'}\relax}

\newif\ifclsresetlabel
\define@choicekey+{Protokoll.cls}{reset-label}{section}[section]{%
	\def\cls@reset@label@settings{\csname cls@reset@label@settings@#1\endcsname}
	\clsresetlabeltrue
}{\PackageError{Protokoll.cls}{The 'reset-label' option allows only the following values: 'section'}\relax}

\define@boolkey+{Protokoll.cls}[cls]{backref}[true]{\relax}{\PackageError{Protokoll.cls}{The 'backref' option only allows the following values: 'true', 'false'}\relax}

\define@boolkey+{Protokoll.cls}[cls]{hyphenation}[true]{\relax}{\PackageError{Protokoll.cls}{The 'hyphenation' option only allows the following values: 'true', 'false'}\relax}

\newif\ifclsdesign
\define@choicekey+{Protokoll.cls}{design}{default, hhu}{%
	\def\cls@design@class{\csname cls@design@class@#1\endcsname}
	\clsdesigntrue
}{\PackageError{Protokoll.cls}{The 'design' option allows only the following values: 'hhu' and 'default'}\relax}
\ExecuteOptionsX{design=default}

\ProcessOptionsX\relax
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}		% Unbekannte Befehle an scrartcl
\ProcessOptions\relax
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{scrartcl}}		% Unbekannte Befehle an scrartcl
\ProcessOptionsX\relax

% ----------------------------------------------------
% 				Macros
% ----------------------------------------------------

\def\@abstractcontent{}

% ----------------------------------------------------
%   			Coding
% ----------------------------------------------------
\RequirePackage[utf8]{inputenc}                                     % Codierung auf UTF8
\RequirePackage[T1]{fontenc}                                        % Codierung, verbessert Performance
\RequirePackage{lmodern}                                            % Schriftbild wird verschöndert
\RequirePackage{import}												% Verbesserte Importierung
\RequirePackage[]{microtype}                                        % Verbesserung mikrotypografischer Einstellungen
\RequirePackage{blindtext}											% Ermöglicht per \blindtext Testexte
\RequirePackage{everypage}                                          % Ermöglicht Hooks auf Seitenanfang

% ----------------------------------------------------
%				Dokumenteinstellung
% ----------------------------------------------------
\RequirePackage{abstract}											% Fügt Abstract Umgebung ein --> \begin{abstract}
\RequirePackage[]{environ}                                      	% Erleichtert Erstellung von Umgebungen
\RequirePackage{chngcntr}                                           % Ermöglicht Kontrolle über den Reset von Countern nach Gliederungen
\setlength{\emergencystretch}{1em}                              	% Reduziert Fehlermeldungen --> mit Vorsicht benutzen!

% ----------------------------------------------------
%				Sprache
% ----------------------------------------------------
\RequirePackage[ngerman]{babel}                                 	% Übersetzt vieles auf Deutsch

% ----------------------------------------------------
%Seiten/Dokumentlayout
% ----------------------------------------------------
\RequirePackage[]{geometry}
\RequirePackage{pdflscape}											% Ermöglicht Querformat --> \begin{landscape}
\RequirePackage[]{caption}                                      	% Captions können weiter angepasst werden
\RequirePackage[]{scrlayer-scrpage}                                 % Weitere Anpassungen von Seitenlayout /Header & footer
\automark[section]{section}
\setlength{\parindent}{0ex}											% Einrückung bei Absatz
\setlength{\itemsep}{20pt}                                      	% Enumerate Listen Abstand
\RequirePackage[]{tocbasic}                                     	% Ermöglicht Anpassungen des TOC
\clearpairofpagestyles                                          	% leert alle Header and Footer
\RequirePackage{tabto}                                          	% tab Befelhl
\RequirePackage[]{enumitem}                                     	% Läst Auflistungen editieren
\newlist{enumChar}{enumerate}{10}                               	% Umgebung mit Buchstaben (groß) Auflistung
\setlist[enumChar]{
    label=\Alph*., 
    align=left
}
\newlist{enumchar}{enumerate}{10}                               	% Umgebung mit Buchstaben (klein) Auflistung
\setlist[enumchar]{                                             
    label=\alph*., 
    align=left
}
\newlist{enumBar}{itemize}{10}                                  	% Umgebung mit Zahlen Auflistung
\setlist[enumBar]{
    label=--, 
    align=left
}
\newlist{enumNum}{enumerate}{10}                               		% Umgebung mit Zahlen Auflistung
\setlist[enumNum]{
    label=\arabic*., 
    align=left
}
\RequirePackage{multicol}
\RequirePackage[super]{nth}											% Erlaubt englische Zählungen; 1st, 2nd


% ----------------------------------------------------
%   Grafik Packete
% ----------------------------------------------------
\RequirePackage[dvipsnames]{xcolor}                                         % Farbige Texte und Boxen
\RequirePackage{graphicx}                                       	% Ermöglicht Einbindung und Anpassung von Bildern
\RequirePackage{wrapfig}                                        	% Ermöglicht Floats um Bilder von Text um fließen zu lassen
\RequirePackage{tikz,tikz-3dplot}
\RequirePackage{pgfplots}                                       	% Ermöglicht Darstellung von Plots aus externen/internen Dateien
\pgfplotsset{compat=1.16}                                       	% Version von PGFPlot
\usetikzlibrary{intersections}                                  	% Erweiterte Bibliothek für PFGPlot
\usetikzlibrary{decorations.pathmorphing}                       	% Erweiterte Bibliothek für PFGPlot
\usetikzlibrary{shadows}
\usetikzlibrary{external}
\usetikzlibrary{calc, arrows, arrows.meta, positioning, decorations.pathreplacing, decorations.markings, decorations.text, calligraphy, pgfplots.dateplot, tikzmark, shapes}
\tikzexternalize[prefix=tikz/,only named]
\RequirePackage{float}                                          	% Ermöglicht Floats um Objekte von Text um fließen zu lassen
\RequirePackage[]{svg}												% ermöglicht svg einzubinden --> includesvg
\RequirePackage[most]{tcolorbox}                                    % Ramen um Elemente
\newtcolorbox{leftrule}[1][]{blanker, breakable,                	% Umgebung Die einen Strich links setzt
     left=3mm, right=3mm, top=1mm, bottom=1mm,
     borderline west={1pt}{0pt}{black},
     before upper=\indent, parbox=false, #1}
\RequirePackage{subcaption}
\NewEnviron{scaletikzpicturetowidth}[1]{%
  \def\tikz@width{#1}%
  \def\tikzscale{1}\begin{lrbox}{\measure@tikzpicture}%
  \BODY
  \end{lrbox}%
  \pgfmathparse{#1/\wd\measure@tikzpicture}%
  \edef\tikzscale{\pgfmathresult}%
  \BODY
}
\RequirePackage{pdfpages}
\RequirePackage{circledsteps}										% Erlaubt umkreiste Zahlen

%\RequirePackage{background}

% ----------------------------------------------------
%   Mathematik und Chemie und Informatik
% ----------------------------------------------------
\newcommand{\RNum}[1]{\uppercase\expandafter{\romannumeral #1\relax}}	% Römische Zahlen
\let\defaultjot\jot
\newcommand{\clearjot}{\setlength{\jot}{\defaultjot}}			% Befehl um jot auf default zurückzusetzen
\RequirePackage{
    amsfonts,                                                   % Schriften für Mathematikumgebung
    amsmath,                                        
    amssymb, 
    cancel,                                                     % Ermöglicht (durch)streichen
    cases,                                                      % Ermöglicht Fälle
    nicefrac,                                                   % Ermöglicht Querbrüche 
    autobreak,                                                  % Formeln im Align werden umgebrochen
    sansmathfonts                                               % Schriftart 
}   
\RequirePackage[]{gauss}                                        % Gaussche Eliminierung
\RequirePackage[locale=DE]{siunitx}                             % Darstellung von Einheiten und Potenzen
	\DeclareSIUnit\molar{\mole\per\liter}                       % Definition von \molar
	\DeclareSIUnit\Molar{\textsc{M}}                            % Definition von \Molar	
\RequirePackage[version=4]{mhchem}                              % Chemiepacket --> großer Umfang
\RequirePackage{upgreek}										% Gerade grichische Symbole
\RequirePackage{chemmacros}                                     % Chemiepacket --> großer Umfang
\chemsetup[chemformula]{}                                       % Verknüfpung mit anderen Packeten
\chemsetup[ghsystem]{}                                          % GHS 
\chemsetup{modules={reactions,spectroscopy,redox}}              % Weitere Module --> Reaktionsumgebung + ?
\chemsetup{                                                 
	reactions/tag-open=[,                                       % Counterdarstellung 
	reactions/tag-close=],                                      % Counterdarstellung
}
\ProvideChemIUPAC\N{\textsc{N}}
\RequirePackage{chemfig}                                        % Chemiepacket --> zeichnen von Reaktionen
\setchemfig{atom style={scale=1}}                               % Skalierung von Chemfig
\RequirePackage{textgreek}                                      % Ermöglicht grichische Zeichen auch ohne Matheumgebung
\chemsetup{greek=upgreek}										% Chemmacros soll upgreek nutzen
\RequirePackage[]{listings}                                     % Ermöglicht schöne Darstellung von Programmiercodes
\lstset{literate=%                                              %UTF-8 Codierung
  {Ö}{{\"O}}1
  {Ä}{{\"A}}1
  {Ü}{{\"U}}1
  {ß}{{\ss}}1
  {ü}{{\"u}}1
  {ä}{{\"a}}1
  {ö}{{\"o}}1
}
\NewEnviron{eq_definition}{										% Erstellt eine Umgebung zur Definierung von Variablen, passt primär Zeilenabstand (\jot} an
    \vspace{-10mm}
    \setlength{\jot}{0mm}
    \begin{align*}
        \BODY
    \end{align*}
    \clearjot
}
\RequirePackage[]{physics}										% Viele kleine nütliche Mathematische Ausdrücke eg \dx
\@ifpackageloaded{PhysicalConstants}{\relax}{
	\usepackage{Packages/PhysicalConstants}
}
% Create a vertical neq https://tex.stackexchange.com/questions/108193/not-equal-sign-%E2%89%A0-with-a-vertical-bar
\newcommand*{\vneq}{%
  \mathrel{%
    \mathpalette\@vneq{=}%
  }%
}
\newcommand*{\@vneq}[2]{%
  % #1: math style (\displaystyle, \textstyle, ...)
  % #2: symbol (=, ...)
  \sbox0{\raisebox{\depth}{$#1\neq$}}%
  \sbox2{\raisebox{\depth}{$#1|\m@th$}}%
  \ifdim\ht2>\ht0 %
    \sbox2{\resizebox{\vneqxscale\width}{\vneqyscale\ht0}{\unhbox2}}%
  \fi
  \sbox2{$\m@th#1\vcenter{\copy2}$}%
  \ooalign{%
    \hfil\phantom{\copy2}\hfil\cr
    \hfil$#1#2\m@th$\hfil\cr
    \hfil\copy2\hfil\cr
  }%
}
\newcommand*{\vneqxscale}{1}
\newcommand*{\vneqyscale}{1}
\usepackage{Packages/VibrationalModes}

% ----------------------------------------------------
%			Referenzierungen
% ----------------------------------------------------
\RequirePackage[
    super,                                                      % Quellen werden als Exponent dargestellt
    comma,                                                      % Mehrere Quellen werden über Kommata getrennt
    numbers,                                                    % Die Zahl der Quelle wird angezeigt (alt. Kürzel)
    square,                                                     % Quellen werden von eckigen Klammern umgeben
    sort                                                        % Mehrere Quellen werden sortiert angezeigt
    ]
{natbib}                                                    	% Erzeugt Literaturverzeichnis aus bib Datei
\RequirePackage[fixlanguage]{babelbib}                          % Stellt Packete für Deutsches Literaturverzeichnis zur Verfügung
%\selectbiblanguage{ngerman}                                     
\RequirePackage[
    hyphens                                                     % Bindestriche werden miteinbezogen !ACHTUNG!
    ]
    {url}                                                       % Ermöglicht Links 
\RequirePackage[
    unicode=true,                                               % Akzeptiert UTF8
	pdfborder={0 0 0}
	]                                      
	{hyperref}                                                  % Erlaubt Referenzierung und Anpassung dieser innerhalb des Dokumentes
\urlstyle{same}													% Links übernehmen Schriftstil
\RequirePackage{bookmark}
\RequirePackage[nameinlink, noabbrev, ngerman]{cleveref}                 % Erlaubt Referenzierungen --> Erkennt deutlich mehr Umgebungen 
\RequirePackage[all]{hypcap}                                    % Korrigiert Anker zu Floats
\RequirePackage{imakeidx}                                       % Ermöglicht Index
\makeindex                                                      % Nötig um Index zu erstellen
% \Autoref soll Reaktionen auch als Reaktion benennen
\patchcmd{\hyper@makecurrent}
 {\edef\Hy@param{#1}}
 {\xHy@param@def{#1}}
 {}{}
\def\xHy@param@def#1{%
  \edef\@tempa{\csname theH#1\endcsname}%
  \edef\@tempa{\expandafter\@car\@tempa\@nil}%
  \edef\Hy@param{\if R\@tempa reaction\else#1\fi}%
}
\newcommand\reactionautorefname{Reaktion}
\addto\extrasngerman{%
	\def\subsectionautorefname{Unterkapitel}%
	\def\subsubsubsectionautorefname{Unterunterunterkapitel}%
}
\usepackage{tablefootnote}										% Ermöglicht footnotes aus Table Floats
%\renewcommand\@biblabel[1]{#1.}                                % Editiert das Label in Literaturverzeichnis (statt [1.] --> #1)
\DeclareNewTOC[
  type=diagram,                                                 % Name der Umgebung
  types=diagrams,                                               % Erweiterung (\listofschemes)
  float,                                                        % soll gleiten
  name=Diagramm,                                                % Name in Überschriften
  listname={Verzeichnis der Diagramme},                         % Listenname
]{diagram}

\DeclareNewTOC[
  type=reactionfig,                                                % Name der Umgebung
  types=reactionfigs,                                               % Erweiterung (\listofschemes)
  float,                                                        % soll gleiten
  name=Reaktion,                                                % Name in Überschriften
  listname={Verzeichnis der Reaktionen},                         % Listenname
]{reactionfig}
%\renewcommand{\theDiagramm}{\Alph{Diagramm}}                   % Setzt den Counter auf A, B, C
\RequirePackage[]{lastpage}                                     % Erlaubt Ref auf letzte Seite
\RequirePackage[acronym,nopostdot,style=super,nonumberlist,toc,nowarn]{glossaries}
\glsdisablehyper
\input{Includes/acro.tex}
\creflabelformat{equation}{#2\textup{#1}#3}						% Ändert die Referezierung von Formel (1) zu Formel 1, entfernt also die Klammern
\creflabelformat{figure}{#2\textup{#1}#3}						% "
\creflabelformat{Diagramm}{#2\textup{#1}#3}						% "
\creflabelformat{table}{#2\textup{#1}#3}						% "

\DeclareRobustCommand\citenum									% Entfernt das Leerzeichen vor citenum
   {\begingroup
%      \NAT@swatrue\let\NAT@ctype\z@\NAT@parfalse\let\textsuperscript\NAT@spacechar% DELETED
     \NAT@swatrue\let\NAT@ctype\z@\NAT@parfalse\let\textsuperscript\relax% NEW
     \NAT@citexnum[][]}

% ----------------------------------------------------
% Tabellenformatierung
% ----------------------------------------------------
\RequirePackage{tabularx}                                       % Tabellen deren Breite definierbar ist
\RequirePackage[]{tabu}	
\newcolumntype{Y}{>{\centering\arraybackslash}X}				% X Column Type aber Text in im Zentrum
\newcolumntype{P}{>{\raggedleft\arraybackslash}X}               % X Column Type aber Text Rechts zentiert
\newcolumntype{T}[2]{S[											% erweitert S Column Type (SI) #1 ist ausrichtung %2 die Größe
    table-format=4.1,
    table-alignment=#1,
    table-column-width=#2
]}
\RequirePackage{tabulary}                                       % Tabellen deren Höhe definierbar ist
\RequirePackage{array}                                          % Anpassungen von Zellen und Textpositionierung
\RequirePackage{booktabs}                                       % Rahmengestalltung 
\RequirePackage{longtable}                                      % Tabellen die über mehrere Seiten gehen können
\RequirePackage[longtable]{multirow}                            % Übergreifende Zellen
\RequirePackage{pgfplotstable}                                  % Erzeugt Tabellen aus externen Dateien
\renewcommand{\arraystretch}{1.2}                               % Abstand von Zeilen in Tabellen
%\setlength{\tabcolsep}{1pt}                                    % Abstand der Cols in Tabellen
\RequirePackage{xltabular}										% Allows longtable with tabluarx (xltabular)


% ----------------------------------------------------
% Gestaltung
% ----------------------------------------------------
\let\oldcomment = \comment
\let\comment\undefined
\RequirePackage[commentmarkup=margin]{changes}
\let\changecomment\comment
\let\comment\oldcomment
\let\defaultfboxsep\fboxsep
\let\defaultfboxrule\fboxrule
\newcommand{\emptybox}[2][\textwidth]{%
  \begingroup
    \setlength{\fboxsep}{-0.4pt}
    \setlength{\fboxrule}{0.4pt}
    \noindent\fbox{\parbox{#1}{\rule{0pt}{#2}}}%
    \setlength{\fboxsep}{\defaultfboxsep}
    \setlength{\fboxrule}{\defaultfboxrule}
  \endgroup
}
\def\emptyfigure{%
   \@ifnextchar[%
     {\emptyfigure@i}
     {\emptyfigure@i[4cm]}%
}
\def\emptyfigure@i[#1]{%
   \@ifnextchar[%
     {\emptyfigure@ii{#1}}
     {\emptyfigure@ii{#1}[\textwidth]}%
}
\def\emptyfigure@ii#1[#2]#3#4{%
  \begingroup
    \setlength{\fboxsep}{-0.4pt}
    \setlength{\fboxrule}{0.4pt}
    \begin{figure}[H]
        \centering
        \noindent\fbox{\parbox{#2}{\rule{0pt}{#1}}}%
        \caption{#3}
        \label{#4}
    \end{figure}
    \setlength{\fboxsep}{\defaultfboxsep}
    \setlength{\fboxrule}{\defaultfboxrule}
  \endgroup
}
\usepackage[]{todonotes}
\renewcommand{\todo}[2][]{\tikzexternaldisable\@todo[#1]{#2}\tikzexternalenable}

% ----------------------------------------------------
% Zusatz
% ----------------------------------------------------
%\RequirePackage{filecontents}                                   % Dateien dürfen überschrieben werden 
\RequirePackage[]{qrcode}                                       % Generiert QRCodes
% ----------------------------------------------------


% ----------------------------------------------------
% 				Titlepage
% ----------------------------------------------------
\providecommand\cls@titlepage@settings{\relax}


% ----------------------------------------------------
% 				TOC
% ----------------------------------------------------
\providecommand\cls@tableofcontent@settings@default{\relax}

% ----------------------------------------------------
%				listoffigures
% ----------------------------------------------------
\providecommand\cls@listoffigures@settings@default{\relax}

% ----------------------------------------------------
%				listoftables
% ----------------------------------------------------
\providecommand\cls@listoftables@settings@default{\relax}


% ----------------------------------------------------
%				acro
% ----------------------------------------------------
\providecommand\cls@acro@display@default{\relax}
\providecommand\cls@acro@display@list{%
	\clearpage
    \printglossary[type=\acronymtype,title={Abkürzungsverzeichnis}]
}

% ----------------------------------------------------
%				resets
% ----------------------------------------------------

\providecommand\cls@reset@acro@settings@section{
	\preto\section\glsresetall
}
\providecommand\cls@reset@label@settings@section{
	\renewcommand{\theequation}{\arabic{section}.\arabic{equation}}
    \renewcommand{\thefigure}{\arabic{section}.\arabic{figure}}
    \renewcommand{\thetable}{\arabic{section}.\arabic{table}}
    \renewcommand{\theDiagramm}{\arabic{section}.\arabic{Diagramm}}	
    \counterwithin*{figure}{section}
    \counterwithin*{equation}{section}
    \counterwithin*{table}{section}
    \counterwithin*{Diagramm}{section}
}

% ----------------------------------------------------
%				styles
% ----------------------------------------------------


\providecommand\cls@design@class@hhu{
	\usepackage{Styles/HHU_Default}
}


% ----------------------------------------------------
% 				Commands
% ----------------------------------------------------

\newcommand{\Abstract}[1]{\def\@abstractcontent{#1}}
\newcommand{\@printAbstract}{\@abstractcontent}
\newcommand{\@printAcro}{\relax}

\newcommand{\printtableofcontents}{\tableofcontents}


% Hypentation Enviroments
\NewEnviron{preventHyphenation}{
	{
	\begingroup
    \tolerance=1
	\emergencystretch=\maxdimen
	\hyphenpenalty=10000
	\hbadness=10000
	\BODY
	\endgroup
 	}
}
\NewEnviron{allowHyphenation}{
	{
	\begingroup
    \tolerance=200
	\emergencystretch=9.99756pt
	\hyphenpenalty=50
	\hbadness=1000
	\BODY
 	\endgroup
 	}
}

\newcommand{\makebibliography}[2]{
    \pagebreak
    \bibliographystyle{#1}
    \bibliography{#2}
    \ClassWarning{Protokoll}{Command makebibliography is deprecated and will be removed in a future version. Please use the default way for including a bibliography.}
}

% ----------------------------------------------------
% 				Deprecated
% ----------------------------------------------------
\NewEnviron{acronym}{%
	\PackageWarning{examplepackage}{Acronym deprecated}
}
\newcommand{\ac}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\acresetall}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\acf}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\acs}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\acl}{\ClassWarning{Protokoll}{Acronym deprecated}}

\newcommand{\acp}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\acfp}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\acsp}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\aclp}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\acfi}{\ClassWarning{Protokoll}{Acronym deprecated}}

\newcommand{\iac}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\Iac}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\acused}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\acsu}{\ClassWarning{Protokoll}{Acronym deprecated}}
\newcommand{\aclu}{\ClassWarning{Protokoll}{Acronym deprecated}}

% ----------------------------------------------------
% 				Execute Options
%				Pass remaining ones
% ----------------------------------------------------

\ifclsshowframe
	\geometry{showframe}
	\overfullrule=2cm
\fi
\ifclsacro
	\makeglossaries
\fi
\ifclsresetacro
	\cls@reset@acro@settings
\fi
\ifclsresetlabel
	\cls@reset@label@settings
\fi
\ifclshyphenation
	\relax
\else
	\tolerance=1
	\emergencystretch=\maxdimen
	\hyphenpenalty=10000
	\hbadness=10000
\fi
\ifclsbackref
	\renewcommand*{\backreftwosep}{ und~}
    \renewcommand*{\backreflastsep}{ und~}
    \renewcommand*{\backref}[1]{}% for backref < 1.33 necessary
    \renewcommand*{\backrefalt}[4]{%
    	\ifcase #1 %
    		Keine Zitierung.%
    	\or
    		Eine Zitierung in Abschnitt #2.%
    	\else
        	#1 Zitierungen in folgenden Abschnitten: #2.%
    	\fi
	}
\fi
	
	
\AfterEndPreamble{%
	%\sisetup{detect-all}
	\ifclstitlepage
		\cls@titlepage@settings
		\maketitle
	\fi
	\@printAbstract
	\ifclstableofcontent
		\cls@tableofcontent@settings
		\printtableofcontents													
	\fi
	\setcounter{page}{1}
}

\AtEndDocument{%
	\ifclslistoffigures
		 \clearpage
		 \cls@listoffigures@settings
		 \listoffigures 
	\fi
	\ifclslistoftables
		\clearpage
		\cls@listoftables@settings
		\listoftables
	\fi
	\ifclsacro
		\cls@acro@display
	\fi
}

\ifclsdesign
	\cls@design@class
\fi