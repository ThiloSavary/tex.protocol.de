\RequirePackage[l2tabu, orthodox]{nag}								% Warnt vor deprecated
\RequirePackage{etoolbox}                                           
\RequirePackage{xkeyval}

% ----------------------------------------------------
\newbool{titlepage}
\newbool{showframe}
\newbool{tableofcontent}
\newbool{listoffigures}
\newbool{listoftables}
\newbool{acrolist}
\newbool{acro}
\newbool{sectionarco}
\newbool{sectionlabel}
\newbool{backref}
\newbool{hyphenation}
% ----------------------------------------------------

% ----------------------------------------------------
%Macro 
%Saving old Hyphentation values to fall back on
\let\oldtolerance=\tolerance
\let\oldemergencystretch=\emergencystretch
\let\oldhyphenpenalty=\hyphenpenalty
\let\oldhbadness=\hbadness

%Defining default values
\let\defaulttolerance=\tolerance
\let\defaultemergencystretch=\emergencystretch
\let\defaulthyphenpenalty=\hyphenpenalty
\let\defaulthbadness=\hbadness
% ----------------------------------------------------

% Setup
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Protokoll}[2019/10/12]

\LoadClass[
    10pt,                                                           % Schriftgröße 10pt
    listof=totoc,                                                   % Gleitumgebungen in TOC
    bibliography=totoc,                                             % Literatur in TOC
    ngerman
]{scrartcl}                                                         % KOMA Articl

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}		% Unbekannte Befehle an scrartcl
\ProcessOptions\relax
% ----------------------------------------------------

% ----------------------------------------------------
%   Coding
\RequirePackage[utf8]{inputenc}                                     % Codierung auf UTF8
\RequirePackage[T1]{fontenc}                                        % Codierung, verbessert Performance
\RequirePackage{lmodern}                                            % Schriftbild wird verschöndert
\RequirePackage{import}												% Verbesserte Importierung
\RequirePackage[]{microtype}                                        % Verbesserung mikrotypografischer Einstellungen
\RequirePackage{blindtext}											% Ermöglicht per \blindtext Testexte
\RequirePackage{everypage}                                          % Ermöglicht Hooks auf Seitenanfang
% ----------------------------------------------------

% ----------------------------------------------------
%Dokumenteinstellung

\RequirePackage{abstract}										% Fügt Abstract Umgebung ein --> \begin{abstract}

\RequirePackage[]{environ}                                      % Erleichtert Erstellung von Umgebungen

\usepackage{chngcntr}                                           % Ermöglicht Kontrolle über den Reset von Countern nach Gliederungen

\setlength{\emergencystretch}{1em}                              % Reduziert Fehlermeldungen --> mit Vorsicht benutzen!
% ----------------------------------------------------

% ----------------------------------------------------
%Sprache
\RequirePackage[ngerman]{babel}                                 % Übersetzt vieles auf Deutsch
% ----------------------------------------------------

% ----------------------------------------------------
%Seiten/Dokumentlayout
\RequirePackage[]{geometry}

\RequirePackage{pdflscape}										% Ermöglicht Querformat --> \begin{landscape}

\RequirePackage[]{caption}                                      % Captions können weiter angepasst werden

\RequirePackage[]{scrlayer-scrpage}                                          % Weitere Anpassungen von Seitenlayout /Header & footer
\automark[section]{section}

\setlength{\parindent}{0ex}										% Einrückung bei Absatz
                                                 

\setlength{\itemsep}{20pt}                                      % Enumerate Listen Abstand

\RequirePackage[]{tocbasic}                                     % Ermöglicht Anpassungen des TOC

\clearscrheadfoot                                               % leert alle Header and Footer

\RequirePackage{tabto}                                          % tab Befelhl

\RequirePackage[]{enumitem}                                     % Läst Auflistungen editieren
\newlist{enumChar}{enumerate}{10}                               % Umgebung mit Buchstaben (groß) Auflistung
\setlist[enumChar]{
    label=\Alph*., 
    align=left
}

\newlist{enumchar}{enumerate}{10}                               % Umgebung mit Buchstaben (groß) Auflistung
\setlist[enumchar]{                                             % Umgebung mit Buchstaben (klein) Auflistung
    label=\alph*., 
    align=left
}

\newlist{enumBar}{itemize}{10}                                  % Umgebung mit Zahlen Auflistung
\setlist[enumBar]{
    label=--, 
    align=left
}

\newlist{enumNum}{enumerate}{10}                               % Umgebung mit Zahlen Auflistung
\setlist[enumNum]{
    label=\arabic*., 
    align=left
}

\RequirePackage{multicol}
% ----------------------------------------------------

% ----------------------------------------------------
%   Grafik Packete
\RequirePackage{graphicx}                                       % Ermöglicht Einbindung und Anpassung von Bildern

\RequirePackage{wrapfig}                                        % Ermöglicht Floats um Bilder von Text um fließen zu lassen

\RequirePackage{pgfplots}                                       % Ermöglicht Darstellung von Plots aus externen/internen Dateien
\pgfplotsset{compat=1.16}                                       % Version von PGFPlot
\usetikzlibrary{intersections}                                  % Erweiterte Bibliothek für PFGPlot
\usetikzlibrary{decorations.pathmorphing}                       % Erweiterte Bibliothek für PFGPlot

\RequirePackage{float}                                          % Ermöglicht Floats um Objekte von Text um fließen zu lassen

\RequirePackage[]{svg}											% ermöglicht svg einzubinden --> includesvg

\RequirePackage[most]{tcolorbox}                                    % Ramen um Elemente

\newtcolorbox{leftrule}[1][]{blanker, breakable,                % Umgebung Die einen Strich links setzt
     left=3mm, right=3mm, top=1mm, bottom=1mm,
     borderline west={1pt}{0pt}{black},
     before upper=\indent, parbox=false, #1}
     
\RequirePackage{subcaption}
% ----------------------------------------------------


% ----------------------------------------------------
%   Mathematik und Chemie und Informatik
\newcommand{\RNum}[1]{\uppercase\expandafter{\romannumeral #1\relax}}
% Römische Zahlen

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
% ----------------------------------------------------

% ----------------------------------------------------
%Referenzierungen
\RequirePackage[
    super,                                                      % Quellen werden als Exponent dargestellt
    comma,                                                      % Mehrere Quellen werden über Kommata getrennt
    numbers,                                                    % Die Zahl der Quelle wird angezeigt (alt. Kürzel)
    square,                                                     % Quellen werden von eckigen Klammern umgeben
    sort                                                        % Mehrere Quellen werden sortiert angezeigt
    ]
{natbib}                                                    % Erzeugt Literaturverzeichnis aus bib Datei

\RequirePackage[fixlanguage]{babelbib}                          % Stellt Packete für Deutsches Literaturverzeichnis zur Verfügung
\selectbiblanguage{ngerman}                                     

\RequirePackage[
    hyphens                                                     % Bindestriche werden miteinbezogen !ACHTUNG!
    ]
    {url}                                                       % Ermöglicht Links 
\RequirePackage[
    unicode=true,                                               % Akzeptiert UTF8
	pdfborder={0 0 0},                                        ]                                      
	{hyperref}                                                  % Erlaubt Referenzierung und Anpassung dieser innerhalb des Dokumentes
\urlstyle{same}													% Links übernehmen Schriftstil

\RequirePackage[nameinlink, noabbrev]{cleveref}                 % Erlaubt Referenzierungen --> Erkennt deutlich mehr Umgebungen 

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

\usepackage[nolist, printonlyused]{acronym}						% Ermöglicht Abkürzungen per \ac

%\renewcommand\@biblabel[1]{#1.}                                % Editiert das Label in Literaturverzeichnis (statt [1.] --> #1)


\DeclareNewTOC[
  type=Diagramm,                                                % Name der Umgebung
  types=Diagramm,                                               % Erweiterung (\listofschemes)
  float,                                                        % soll gleiten
  name=Diagramm,                                                % Name in Überschriften
  listname={Verzeichnis der Diagramme},                         % Listenname
]{Diagramm}

%\renewcommand{\theDiagramm}{\Alph{Diagramm}}                   % Setzt den Counter auf A, B, C

\RequirePackage[]{lastpage}                                     % Erlaubt Ref auf letzte Seite
% ----------------------------------------------------

% ----------------------------------------------------
% Tabellenformatierung
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

% ----------------------------------------------------

% ----------------------------------------------------
% Gestaltung
\RequirePackage{xcolor}                                         % Farbige Texte und Boxen

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
   


% ----------------------------------------------------

% ----------------------------------------------------
% Zusatz
%\RequirePackage{filecontents}                                  % Dateien dürfen überschrieben werden 
\RequirePackage[]{qrcode}                                       % Generiert QRCodes
% ----------------------------------------------------

% ----------------------------------------------------


% ----------------------------------------------------
% Custom Coding

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

% ----------------------------------------------------
% Bibliothek wird eingefügt
\newcommand{\makebibliography}[2]{
    \pagebreak
    \bibliographystyle{#1}
    \bibliography{#2}
}

\DeclareOptionX{showframe}{\ifstrequal{#1}{true}
    {
        \booltrue{showframe}
        \geometry{showframe}
	    \overfullrule=2cm
    }{
        \boolfalse{showframe}
    }
}
\DeclareOptionX{titlepage}{\ifstrequal{#1}{true}
    {
        \booltrue{titlepage}
    }{
        \boolfalse{titlepage}
        \renewcommand{\maketitle}{
		    \relax
        }
    }
}
\DeclareOptionX{tableofcontent}{\ifstrequal{#1}{true}
    {
        \booltrue{tableofcontent}
    }{
        \boolfalse{tableofcontent}
        \renewcommand{\tableofcontents}{
		    \relax
        }
    }
}
\ExecuteOptionsX{showframe=false}
\ExecuteOptionsX{titlepage=true}
\ExecuteOptionsX{tableofcontent=true}

\AtBeginDocument{%
    \sisetup{detect-all}                                            % Siunits erkennt aktuelle Schriftart 
	\maketitle
	\tableofcontents

	\setcounter{page}{1}
}

\DeclareOptionX{listoffigures}{\ifstrequal{#1}{true}
    {
        \booltrue{listoffigures}
        \AtEndDocument{
		    \clearpage
		    \listoffigures 
	    }
    }{
        \boolfalse{listoffigures}
    }
}
\DeclareOptionX{listoftables}{\ifstrequal{#1}{true}
    {
        \booltrue{listoftables}
        \AtEndDocument{
		    \clearpage
		    \listoftables
	    }
    }{
        \boolfalse{listoftables}
    }
}
\DeclareOptionX{acro}{\ifstrequal{#1}{true}
    {
        \booltrue{acro}
        \AtEndDocument{
		    \import{}{Includes/acro.tex}
	    }
    }{
        \ifstrequal{#1}{list}{
            \booltrue{acro}
            \booltrue{acrolist}
            \AC@nolistfalse
    	    \AtEndDocument{
    		    \clearpage
    		    \section*{Abkürzungsverzeichnis}
    		    \addcontentsline{toc}{section}{Abkürzungsverzeichnis}
    		    \import{}{Includes/acro.tex}
    	    }
        }{
            \boolfalse{acro}
            \boolfalse{acrolist}
        }
    }
}
\DeclareOptionX{sectionarco}{\ifstrequal{#1}{true}
    {
        \booltrue{sectionarco}
        \preto\section\acresetall						% resets the Acrynonym 
    }{
        \boolfalse{sectionarco}
    }
}
\DeclareOptionX{sectionlabel}{\ifstrequal{#1}{true}
    {
        \booltrue{sectionlabel}
        \renewcommand{\theequation}{\arabic{section}. \arabic{equation}}
    	\renewcommand{\thefigure}{\arabic{section}. \arabic{figure}}
    	\renewcommand{\thetable}{\arabic{section}. \arabic{table}}
    	\renewcommand{\theDiagramm}{\arabic{section}. \arabic{Diagramm}}
    	\counterwithin*{figure}{section}
    	\counterwithin*{equation}{section}
    	\counterwithin*{table}{section}
    	\counterwithin*{Diagramm}{section}
    }{
        \boolfalse{sectionlabel}
    }
}
\DeclareOptionX{preventhyphenation}{\ifstrequal{#1}{true}
    {
        \boolfalse{hyphenation}
        \tolerance=1
		\emergencystretch=\maxdimen
		\hyphenpenalty=10000
		\hbadness=10000
    }{
        \booltrue{hyphenation}
    }
}
\ExecuteOptionsX{listoffigures=false}
\ExecuteOptionsX{listoftables=false}
\ExecuteOptionsX{acro=false}
\ExecuteOptionsX{sectionarco=false}
\ExecuteOptionsX{sectionlabel=false}
\ExecuteOptionsX{preventhyphenation=false}

\DeclareOption{backref}{
    \booltrue{backref}
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
}
\DeclareOption*{\ClassWarning{Protokoll}{‘\CurrentOption’ ignored}}
\DeclareOptionX*{\ClassWarning{Protokoll}{‘\CurrentOption’ ignored}}
\ProcessOptionsX*\relax
%-----------------------------------------------------
% Externe Datein
\import{}{Includes/si_konstanten.tex}

