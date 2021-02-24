# Changelog
All notable changes to this project will be documented in this file.

## [Unreleased]
### Protokoll.cls
- Made titlepage option boolean, style of titlepage can be changed by the selected style class
- Added the *dvipsnames* options to *xcolor*
### Styles/HHU_Default.sty
- Fixed titlepage spacing
- Fixed hyperref and options bug (caused due wrong hook order)
- Added titlepage layout options
  - added Default (the previous one)
  - addded Simple (no changed to KOMA)
  - added Fancy



## [v0.1.0-alpha] - 2020/12/26

### Protokoll.cls
#### Packages
##### Added
- glossaries
- todonotes
- upgreek
- VibrationalModes
- bookmark
- circledsteps
- pdfpages
- tikz-3dplot
##### Changed
- pgfplots <br> Added tikzlibraries *shadow*, *external*, *calc*, *arrows*, *arrows.meta*, *positioning*, *decorations.pathreplacing*, *decorations.markings*, *decorations.text*, *calligraphy* and *pgfplots.dateplot* <br> Through external tikz files are excluded and stored in a subfolder named "*tikz*" <br>This only applies for named tikz images (by \\tikzsetnextfilename{})
##### Removed
- acronym <br> Replaced with glossaries

#### Commands
##### Added
- \\vneq <br> Creates an \neq (≠) but with an vertical bar
##### Changed
- \\citenum <br> (From *natbib*) <br> Removed leading space
##### Removed
- \\makebibliography <br> Is now deprecated, will be removed next release <br> It is adviced to use the default commands: <br>
    *\pagebreak
    \bibliographystyle{#1}
    \bibliography{#2}*

#### Enviroments
##### Added
- reactionfig <br> An floating reaction enviroment (not linked to the reaction enviroment from mhchem yet)
##### Changed
-  Renamed *~~Diagramm~~* to diagram <br> *float figure enviroment*; adds an additional figure enviroment for diagramms

#### Options
Reworked the whole Option processing workflow, through this option names and allowed values will be **different** from now on:
##### Changed
- titlepage <br> Default: **default** <br> Allowed values: *default* <br> Creates an titlepage if given, if not, there will be no titlepage
- tableofcontent <br> Default: **default** <br> Allowed values: *default* <br> Creates an tableofcontent if given, if not, there will be no tableofcontent
- listoffigures <br> Default: **default** <br> Allowed values: *default* <br> Creates an listoffigures if given, if not, there will be no listoffigures
- listoftables <br> Default: **default** <br> Allowed values: *default* <br> Creates an listoftables if given, if not, there will be no listoftables
- acro <br> Default: **default** <br> Allowed values: *default*, *list* <br> Aktivates the acronym package and if the Option *list* is chosen, creates an listofacronyms
- reset-acro= <br> **No Default** <br> Allowed values: *section* <br> Resets acronyms every \<value> 
- reset-label= <br> **No Default** <br> Allowed values: *section* <br> Floating captions will include the current \<value> number, so an caption looks like this: "Fig. 3.1: *Caption*". The second counter will be reset every \<value>.
- backref <br> Default: **true** <br> Allowed values: *\<boolean>* <br> Aktivates the backref package
- showframe <br> Default: **true** <br> Allowed values: *\<boolean>* <br> Aktivates the showframe package
- hyphenation <br> Default: **true** <br> Allowed values: *\<boolean>* <br> Controlles hyphenation
- design <br> Default: **default** <br> Allowed values: *default*, *hhu* <br> Loads predefined Designs

### Styles/HHU_Default.sty
#### Options
Package Options are now possible, they can be set by \\usepackage[\<Options>] or with the new provided Command \\DesignOptions{Options}
##### Added
  - ihead <br> Default: **title** <br> Allowed values: *author*, *title*, *none*, *subtitle* <br> Sets the ihead Heading
  - design <br> Default: **author** <br> Allowed values: *author*, *title*, *none*, *subtitle* <br> Sets the ohead Heading
#### Commands
##### Added
- \\DesignOptions{Options\<keyValString>}<br>
Set Package Options for the loaded Style
#### Modification
##### Changed
- Captionlayout <br> now left aligned

### PhysicalConstants.sty
#### Commands
#### Added
- providePConst{name\<String>}{value\<number>}{unit\<SI-package-String>} <br> Allowes to create own Constants
##### Removed
- ~~\faraday~~

### VibrationalModes.sty
Created Package for Vibrational Modes Display
#### Commands
##### Added
- \SVib[index\<String\> (Default s)] <br>Prints the Symbol for streching oszillations with an index (s, as ...)
- \SVib[index\<String\> (Default s)]{chem. Formula \<ceString\>} <br>Prints the Symbol for streching oszillations with an index (s, as ...) and the coresponding chemical Formula
- \DVib[index\<String\> (Default s)] <br>Prints the Symbol for deformation oszillations with an index (s, as ...)
- \DVib[index\<String\> (Default s)]{chem. Formula \<ceString\>} <br>Prints the Symbol for deformation oszillations with an index (s, as ...) and the coresponding chemical Formula
- \Vib[vibType\<LaTeX\>][index\<String\> (Default s)] <br> Prints the Symbol for given vibType oszillations with an index (s, as ...)
- \Vib[vibType\<LaTeX\>][index\<String\> (Default s)]{chem. Formula \<ceString\>} <br> Prints the Symbol for given vibType oszillations with an index (s, as ...) and the coresponding chemical Formula


## [v0.0.3-alpha] - 2020/10/02
### Protokoll.cls
#### Packages
##### Added
- xltabular
- PhysicalConstants

#### Commands
##### Added
- \\Abstract{Abstract\<LaTeX\>} <br> Creates an Abstract before Table of Contents

#### Enviroments
##### Added
- scaletikzpicturetowidth{width\<LaTeXWidht\>} <br> Creates an Enviroment where the contained TikZ Picture is scaled to the given width

#### Bugfix
- changed from deprecated *~~\\clearscrheadfoot~~* to *\\clearpairofpagestyles*

### PhysicalConstants.sty
Created package for constants
#### Commands
##### Added
- \PConst{ConstName\<String\>}<br>Prints the value of the Const (if known) with the SI Package
- \faraday<br> Prints the value of the Faraday Constante with the SI Package



## [v0.0.2-alpha] - 2020/06/19
### Protokoll.cls
#### Configuration
##### Changed
- Kernel
  - *~~\\parindent 0ex~~* &#8594; *\setlength{\parindent}{0ex}*
- changes
  - commands
    - **Bugfix** *\\changecomment* works now as intended

#### Enviroments
##### Added
- preventHyphenation <br> *text enviroment*; prevents Hyphenation disregarding the global settings
- allowHyphenation <br> *text enviroment*; allows Hyphenation disregarding the global settings

### Styles/HHU_Default.sty
#### Documentlayout
##### Changed Modification
- footer
  - footnoterule
    - *~~\\textwidth~~* &#8594; *\\columnwidth*

### ~~pic/Blank.png~~
- removed

## [v0.0.1-alpha] - 2020/06/15
### Protokoll.cls
#### Packages
##### Added
- abstract
- acronym [nolist, printonlyused]
- amsfonts
- amsmath
- amssymb
- autobreak
- array  
- babel
- babelbib [fixlanguage]
- blindtext
- booktabs
- cancel
- caption
- cases
- changes [commentmarkup=margin]
- chemfig
- chemmacros
- chngcntr
- cleveref [nameinlink, noabbrev]
- enumitem
- environ
- etoolbox
- everypage
- float
- fontenc [T1]
- gauss
- geometry
- graphicx
- hypcap [all]
- hyperref [unicode=true, pdfborder={0 0 0}]
- inputenc [utf8]
- imakeidx
- import
- KOMA-Script [10pt, listof=totoc, bibliography=totoc, ngerman]
- lastpage
- listings
- lmodern
- longtable
- mhchem [version=4]
- micotype
- multicol
- multirow [longtable]
- nag [l2tabu, orthodox]
- natbib [super, comma, numbers, square, sort]
- nicefrac
- pdflscape
- pgfplots
- pgfplotstable
- physics
- qrcode
- sansmathfonts
- scrlayer-scrpage
- siunitx [locale=DE]
- subcaption
- svg
- tablefootnote
- tabto
- tabu
- tabularx
- tabulary
- tcolorbox  
- textgreek
- tocbasic
- url [hyphens]
- wrapfig
- xcolor
- xkeyval

#### Configuration
##### Added
- bibliography
  - language: *ngerman*
- chemsetup
  - library
    - chemformula
    - ghsystem
  - modules
    - reactions
    - redox
    - spectroscopy
  - IUPAC commands
    - *Nitrogen* <br> \\N <br> \\textsc{N}
- listings
  - UTF-8 encoding
- siunitx
  - SIUnits
    - \\molar <br> \\mole\\per\\liter
    - \\Molar <br> \\textsc{M}
  - font
    - same as document font
- tabularx
  - columntype
    - Y <br> X columntype but centered
    - P <br> X columntype but right-centered
    - T{alignment, size} <br> S columntype (from siunitx) <br> **Unstable**
- TikZ
  - library
    - intersections
    - decorations.pathmorphing
- url
  - font
    - same as document font

##### Added Modification
- Kernel
  - tables
    - arraystretch *~~1~~* &#8594; *1.2*
  - lengths
    - parindent *~~\\parindent~~* &#8594; *0 px*
- changes
  - commands
    - *~~\\comment~~* &#8594; *\\changecomment*

#### Options
##### Added
- acrolist=\<boolean\>\\"list"
  - *true* <br> imports Includes/acro.tex <br> bool <ins>acro</ins> is set to true
  - *list* <br> imports Includes/acro.tex <br> the list of acronyms gets printed <br> bool <ins>acro</ins> is set to true <br> bool <ins>acrolist</ins> is set to true
  - ***false*** <br> bool <ins>acro</ins> is set to false <br> bool <ins>acrolist</ins> is set to false
- listoffigures=\<boolean\>
  - *true* <br>the command <ins>listoffigures</ins> (leaded by \\clearpage) is added to the <ins>AtEndDocument</ins> Hook <br> bool <ins>listoffigures</ins> is set to true
  - ***false*** <br> bool <ins>listoffigures</ins> is set to false
- listoftables=\<boolean\>
  - *true* <br>the command <ins>listoftables</ins> (leaded by \\clearpage) is added to the <ins>AtEndDocument</ins> Hook <br> bool <ins>listoftables</ins> is set to true
  - ***false*** <br> bool <ins>listoftables</ins> is set to false
- preventhyphenation=\<boolean\>
  - *true* <br> hyphenation gets prevented <br> bool <ins>hyphenation</ins> is set to false
  - ***false*** <br> bool <ins>hyphenation</ins> is set to true
- sectionarco=\<boolean\>
  - *true* <br> the command <ins>acresetall</ins> is added to the <ins>\\preto\\section</ins> Hook<br> bool <ins>sectionarco</ins> is set to true
  - ***false*** <br> bool <ins>sectionarco</ins> is set to false
- sectionlabel=\<boolean\>
  - *true* <br> the counters of <ins>figures</ins>, <ins>equations</ins>, <ins>tables</ins> and <ins>Diagramms</ins> are resetted every section<br> the label of <ins>figures</ins>, <ins>equations</ins>, <ins>tables</ins> and <ins>Diagramms</ins> are changed to display the section number (eg. 1.1)<br> bool <ins>sectionlabel</ins> is set to true
  - ***false*** <br> bool <ins>sectionlabel</ins> is set to false
- showframe=\<boolean\>
  - *true* <br> package <ins>geometry</ins> shows the document border <br> bool <ins>showframe</ins> is set to true
  - ***false*** <br> bool <ins>showframe</ins> is set to false
- tableofcontent=\<boolean\>
  - ***true*** <br> bool <ins>tableofcontent</ins> is set to true
  - *false* <br> the command <ins>tableofcontents</ins> is changed to do nothing <br> bool <ins>tableofcontent</ins> is set to false
- titlepage=\<boolean\>
  - ***true*** <br> bool <ins>titlepage</ins> is set to true
  - *false* <br> the command <ins>maketitle</ins> is changed to do nothing <br> bool <ins>titlepage</ins> is set to false
- backref
  - *present* <br> hooks are added for the back references list at the end of the entries <br> bool <ins>backref</ins> is set to true



#### Commands
##### Added
- \\RNum{Number\<integer\>} <br> creates the roman number of the given integer
- \\clearjot <br> resets the jot to the default value
- \\emptybox[width \<length default: \\textwidth\>]{height \<length\>} <br> creates an empty box
- \\emptyfigure[height \<length default: 4cm\>][width \<length default: \\textwidth\>]{caption \<string\>}{label \<string\>} <br> Creates an empty figure with box
- \\makebibliography{bibliographystyle<string>}{bibfilename<string>} <br> Creates the bibliography with the given style


#### Booleans
##### Added
- acro <br> if *true*, acronyms are included
- acrolist <br> if *true*, acronyms are included AND the List of acronyms is printed
- backref <br> if *true*, hooks are added for the back references list
at the end of the entries
- hyphenation <br> if *true*, hyphenation is allowed
- listoffigures <br> if *true*, the List of Figures is printed
- listoftables <br> if *true*, the List of Tables is printed
- sectionarco <br> if *true*, ac will print the full name of any acronym and the acronym in brackets after each section
- sectionlabel <br> if *true*, labelcounter are reset every new section
- showframe <br> if *true*, borders are displayed
- tableofcontent <br> if *true*, the table of content is printed
- titlepage <br> if *true*, the titlepage is printed

#### Enviroments
##### Added
- Diagramm <br> *float figure enviroment*; adds an additional figure enviroment for diagramms
- enumChar <br> *enumerate enviroment*; the label is a capital letter
- enumchar <br> *enumerate enviroment*; the label is a lower case letter
- enumNum <br> *enumerate enviroment*; the label is a number
- enumBar <br> *itemize enviroment*; the label is a dash
- leftrule <br> *colorbox*; adds a rule at the left side of the content
- eq_definition <br> *math&ast; enviroment*; changes space between lines

##### Added Modification
- reaction: <br> *chemical enviroment*
  - changed the label: *~~(1)~~* &#8594; *[1]*
  - changed autoref name: *~~Gleichung~~* &#8594; *Reaktion*

#### Automation
##### Added
- At the beginn of Document
  - throw \\maketitle
  - throw \\tableofcontents
  - set page counter to 1
- Imports
  - Includes/si_konstanten.tex

---
### Styles/HHU_Default.sty

#### Packages
##### Added
- helvet [scaled=0.92]
- setspace [onehalfspacing]

#### Configuration
##### Added Modification
- siunitx
  - translation
    - list-final-separator							
    - list-pair-separator
    - range-phrase
  - unit display
    - fraction
  - uncertainty
    - separated


#### Macros
##### Added
- authormail{\<string\>} <br> defines <ins>@authormail</ins>
- group{\<string\>} <br> defines <ins>@group</ins>
- institute{\<string\>} <br> defines <ins>@institute</ins>
- matriculation{\<string\>} <br> defines <ins>@matriculation</ins>

##### Added Modification
- author{\<TeXstring\>} <br> defines <ins>@author</ins> <br> defines the metadata <ins>pdfauthor</ins>
- date{\<string\>} <br> defines <ins>@date</ins>
- subtitle{\<string\>} <br> defines <ins>@subtitle</ins>
- title{\<string\>} <br> defines <ins>@title</ins>

#### Documentlayout
##### Added Modification
- a4paper
- margin
  - left: *2.5 cm*
  - right: *2.5 cm*
  - top: *2.5 cm*
  - bottom: *2.0 cm*
- lengths
  - footsktip: *1.0 cm*
- font
  - sfdefault (Helvet)
  - onehalfspaced
- header
  - in textarea
  - with sepline
  - content
    - left: @subtitle
    - right: @author
- footer
  - in textarea
  - footnoterule
    - \\textwidth
  - content
    - right: \\pagemark
- pagemark
  - titlepage
    - none
  - table of content
    - roman beginning with 1
  - document
    - arabic beginning with 1
- headlines
  - section
    - *14 pt*
    - bold
  - subsection
    - *13 pt*
    - bold
  - subsubsection
    - *12 pt*
    - bold
- caption
  - small
- captionlabel
  - bold
- table of content
  - with dots

#### Commands
##### Added Modification
- \\maketitle <br> if Bool <ins>titlepage</ins>, the titlepage gets completely redesigned
- \\tableofcontents <br> Added an \\cleardoubleoddpage

#### Enviroments
##### Added Modification
- enumChar, enumchar, enumBar, enumNum
  - leftmargin: *4.75 mm*
  - labelwidth: *3 mm*
  - labelsep: *1.75 mm*
  - labelindent: *0 mm*
  - itemindent: *0 mm*
  - topsep: *-\parskip*
  - noitemsep
  - partopsep: *0 pt*



<!--[Unreleased]: https://github.com/ThiloSavary/tex.protocol.de/-->
[Unreleased]: https://github.com/ThiloSavary/tex.protocol.de/compare/v0.1.0-alpha...HEAD
[v0.0.1-alpha]: https://github.com/ThiloSavary/tex.protocol.de/releases/tag/v0.0.1-alpha
[v0.0.2-alpha]: https://github.com/ThiloSavary/tex.protocol.de/compare/v0.0.1-alpha...v0.0.2-alpha
[v0.0.3-alpha]: https://github.com/ThiloSavary/tex.protocol.de/compare/v0.0.2-alpha...v0.0.3-alpha
[v0.1.0-alpha]: https://github.com/ThiloSavary/tex.protocol.de/compare/v0.0.3-alpha...v0.1.0-alpha