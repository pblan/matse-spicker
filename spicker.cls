% Additional warnings for deprecated things
\RequirePackage[l2tabu, orthodox]{nag}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spicker}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optional 'english' language option
\newcommand{\InitSpickerLanguage}{\PassOptionsToPackage{english,ngerman}{babel}}
\DeclareOption{english}{\renewcommand{\InitSpickerLanguage}{\PassOptionsToPackage{english}{babel}}}
\ProcessOptions
\InitSpickerLanguage

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compact scrartcl format
\LoadClass[a4paper,parskip=half-,DIV=15,fontsize=11pt]{scrartcl}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enable post-90s text processing
\usepackage[utf8]{inputenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typesetting
\usepackage{babel}
\usepackage{microtype}
\usepackage{parskip}
\usepackage{microtype}
\usepackage{csquotes}
\usepackage{booktabs}

\usepackage{lmodern} % upgrade default font
\usepackage[sc]{mathpazo} % pretty font for text

\linespread{1.05} % more spacing
\setkomafont{disposition}{\fontseries{sbc}\sffamily}

\usepackage{enumitem}
\setlist{nosep}

\makeatletter
% Re-enable paragraph spacing in minipages;
% we choose something smaller than what is used outside of minipages.
\newcommand{\@minipagerestore}{\setlength{\parskip}{0.8\medskipamount}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utilities
\usepackage{lipsum}

\usepackage[svgnames]{xcolor}
% https://s3.amazonaws.com/edwardtufte.com/colorblind_palette.png
\definecolor{orange}{RGB}{230,159,0}
\definecolor{skyblue}{RGB}{86,180,233}
\definecolor{bluishgreen}{RGB}{0,158,115}
\definecolor{vermillion}{RGB}{213,94,0}
\definecolor{reddishpurple}{RGB}{204,121,167}
\definecolor{matse}{RGB}{11,102,168}
\definecolor{fhmint}{RGB}{0,177,172}
\definecolor{fhblue}{RGB}{0,141,208}
\definecolor{fhred}{RGB}{168,46,104}
\definecolor{fhpurple}{RGB}{147,81,159}

% Show most recent revision number and date in date field
\makeatletter
\date{\small \IfLanguageName{ngerman}{Letzte Änderung:}{Last Change:} \filename@parse{\jobname}\IfFileExists{\filename@base.last-change}{\input{\filename@base.last-change}}{\today}}
\makeatother

\subject{\normalfont{}\texttt{\href{https://matse.paddel.xyz/spicker}{https://matse.paddel.xyz/spicker}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Math & Symbols
\usepackage{mathtools}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{stmaryrd}
\usepackage{braket}
\usepackage{cool}

\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}

\DeclareMathOperator{\Exists}{\exists}
\DeclareMathOperator{\Forall}{\forall}
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}

\newcommand{\Nplus}{\mathbb{N}^+}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Rnonneg}{\mathbb{R}^+_0}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\bigo}{\mathcal{O}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diagrams

\usepackage{pgfplots}
\usepgfplotslibrary{fillbetween}
\pgfplotsset{compat=1.8}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Links and Metadata
\usepackage[
  colorlinks,
  citecolor = fhmint,
  linkcolor = matse,
  urlcolor = matse
]{hyperref}
\usepackage{bookmark}

\makeatletter
\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author}
  }
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header
\usepackage{fancyhdr}

\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
%\renewcommand{\subsectionmark}[1]{\markright{#1}{}}

\fancyhf{}

\fancyhead[L]{\leftmark}
\fancyhead[R]{\rightmark} % 1. sectionname
%\fancyfoot[C]{\thepage}
\fancypagestyle{plain}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0pt}%
}

%\rhead{\thesubsection} %%%COMMENT THIS LINE%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Environments
\usepackage{todonotes}

% Just like the 'center' block, but without spacing around it.
\newenvironment{tightcenter}{%
  \setlength\topsep{0pt}
  \setlength\parskip{0pt}
  \begin{center}
}{%
  \end{center}
}

\usepackage{tcolorbox}

\usepackage{array}   % for \newcolumntype macro

\newcolumntype{L}{>{$}l<{$}} % math-mode version of "l" column type
\newcolumntype{R}{>{$}r<{$}} % math-mode version of "r" column type
\newcolumntype{C}{>{$}c<{$}} % math-mode version of "c" column type
\newcolumntype{P}{>{$}p<{$}} % math-mode version of "l" column type

%%%%%%%%%%%%%%%%
% Context Blocks

\usepackage[]{imakeidx}

\usepackage{iflang}
\newcommand{\SpickerAlgorithm}{\IfLanguageName{ngerman}{Algorithmus}{Algorithm}}
\newcommand{\SpickerTheorem}{\IfLanguageName{ngerman}{Satz}{Theorem}}

\tcbset{boxrule=0pt,toprule=1pt,parbox=false,on line}

\newenvironment{algo}[1]{%
\index{#1}%
\setlist{nosep,leftmargin=*}%
\begin{tcolorbox}[colback=fhblue!5!white, colframe=fhblue!75!black, title={\sffamily \SpickerAlgorithm: #1}]
}{%
\end{tcolorbox}}

\newenvironment{theo}[1]{%
\index{#1}%
\begin{tcolorbox}[colback=fhpurple!5!white, colframe=fhpurple!75!black, title={\sffamily \SpickerTheorem: #1}]
}{%
\end{tcolorbox}}

\newenvironment{defi}[1]{%
\index{#1}%
\begin{tcolorbox}[colback=fhmint!5!white, colframe=fhmint!75!black, title={\sffamily Definition: #1}]
}{%
\end{tcolorbox}}

\newenvironment{bonus}[1]{%
\index{#1}%
\begin{tcolorbox}[colback=fhred!5!white, colframe=fhred!75!black, title={\sffamily Bonus: #1}]
}{%
\end{tcolorbox}}

\newenvironment{example}[1]{%
\index[Beispiele]{#1}%
\begin{tcolorbox}[colback=fhred!5!white, colframe=fhred!75!black, title={\sffamily \IfLanguageName{ngerman}{Beispiel}{Example}: #1}]
}{%
\end{tcolorbox}}

%%%%%%%%%%%%%%
% Split Blocks

\newenvironment{halfboxl}{%
\noindent
\begin{minipage}[t]{0.4875\textwidth}
%\vspace{0pt}
%\vspace{\dimexpr\ht\strutbox-\topskip}
}{%
\end{minipage}\hspace{0.025\textwidth}}
\newenvironment{halfboxr}{%
\begin{minipage}[t]{0.4875\textwidth}
\vspace{0pt}
}{%
\end{minipage}\bigbreak}

\newenvironment{thirdboxl}{%
\begin{minipage}[t]{0.3166\textwidth}
}{%
\end{minipage}\hspace{0.025\textwidth}}
\newenvironment{thirdboxm}{%
\begin{minipage}[t]{0.3166\textwidth}
}{%
\end{minipage}\hspace{0.025\textwidth}}
\newenvironment{thirdboxr}{%
\begin{minipage}[t]{0.3166\textwidth}
}{%
\end{minipage}\bigbreak}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citations 

\usepackage[style=numeric, backend=bibtex]{biblatex}