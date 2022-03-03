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
% Enable own macros
\RequirePackage{../mymacros}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enable post-90s text processing
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typesetting
\usepackage{babel}
\usepackage{microtype}
\usepackage{parskip}
\usepackage{csquotes}
\usepackage{booktabs}
\usepackage{listings}
\usepackage{soul}

\usepackage{lmodern} % upgrade default font
\usepackage[sc]{mathpazo} % pretty font for text

\linespread{1.05} % more spacing
\setkomafont{disposition}{\fontseries{sbc}\sffamily}

\usepackage[shortlabels]{enumitem}
\setlist{nosep}

\usepackage[scaled=0.85]{beramono}
%\usepackage[scaled=0.85]{inconsolata}

\usepackage{lstautogobble}

\definecolor{codered}{rgb}{0.788, 0.102, 0.35}
\definecolor{codegreen}{rgb}{0.137, 0.471, 0.255}
\definecolor{codeblue}{rgb}{0, 0.333, 0.749}
\definecolor{codeorange}{rgb}{0.996, 0.541, 0.094}
\definecolor{codegray}{rgb}{0.627, 0.647, 0.663}
\definecolor{codepurple}{HTML}{C42043}
\definecolor{backcolour}{HTML}{F2F2F2}
\definecolor{bookColor}{cmyk}{0,0,0,0.90}  
\color{bookColor}

\lstset{upquote=true}

% better highlighting
\makeatletter
\newenvironment{btHighlight}[1][]
{\begingroup\tikzset{bt@Highlight@par/.style={#1}}\begin{lrbox}{\@tempboxa}}
{\end{lrbox}\bt@HL@box[bt@Highlight@par]{\@tempboxa}\endgroup}

\newcommand\btHL[1][]{%
  \begin{btHighlight}[#1]\bgroup\aftergroup\bt@HL@endenv%
}
\def\bt@HL@endenv{%
  \end{btHighlight}%   
  \egroup
}
\newcommand{\bt@HL@box}[2][]{%
  \tikz[#1]{%
    \pgfpathrectangle{\pgfpoint{1pt}{0pt}}{\pgfpoint{\wd #2}{\ht #2}}%
    \pgfusepath{use as bounding box}%
    \node[anchor=base west, fill=orange!30,outer sep=0pt,inner xsep=1pt, inner ysep=0pt, rounded corners=3pt, minimum height=\ht\strutbox+1pt,#1]{\raisebox{1pt}{\strut}\strut\usebox{#2}};
  }%
}
\makeatother

%%% used to color digits
% \newcommand\digitstyle{\color{codeorange}}
% \makeatletter
% \newcommand{\ProcessDigit}[1]
% {%
%   \ifnum\lst@mode=\lst@Pmode\relax%
%    {\digitstyle #1}%
%   \else
%     #1%
%   \fi
% }

\lstdefinelanguage{mysql}
    {morekeywords={USE, SELECT, FROM, WHERE, AS, ORDER, ASC, DESC, IS, AND, OR, LIKE, JOIN, INNER, LEFT, RIGHT, FULL, OUTER, ON, UNION, MINUS, INTERSECT, GROUP, BY, IN, HAVING, USE, SHOW, CREATE, UPDATE, ALTER, DESCRIBE, COLUMNS, SCHEMA, SCHEMAS, DATABASE, DATABASES, TABLE, TABLES, INSERT, INTO, VALUES, DROP, PRIMARY, KEY, FOREIGN, CONSTRAINT, REFERENCES, CASE, WHEN, THEN, ELSE, END, CROSS, INTERVAL, YEAR, HOUR, ADD, MODIFY, RENAME, TO, IF, EXISTS, NOT, REPLACE, VIEW, START, TRANSACTION, COMMIT, ROLLBACK, AUTOCOMMIT, FOREIGN_KEY_CHECKS, SET, TRUNCATE, LOCK, WRITE, UNLOCK, DELIMITER, PROCEDURE, BEGIN, CALL, TRIGGER, BEFORE, FOR, EACH, ROW, AFTER},
    sensitive=false,
    basicstyle=\footnotesize\ttfamily,
    keywordstyle=\bfseries\color{codeblue},  
    stringstyle=\color{codered},
    commentstyle=\color{codegrey},
    % literate=
    % *{0}{{{\ProcessDigit{0}}}}1
    % {1}{{{\ProcessDigit{1}}}}1
    % {2}{{{\ProcessDigit{2}}}}1
    % {3}{{{\ProcessDigit{3}}}}1
    % {4}{{{\ProcessDigit{4}}}}1
    % {5}{{{\ProcessDigit{5}}}}1
    % {6}{{{\ProcessDigit{6}}}}1
    % {7}{{{\ProcessDigit{7}}}}1
    % {8}{{{\ProcessDigit{8}}}}1
    % {9}{{{\ProcessDigit{9}}}}1,
    morecomment=[l][\color{codegray}]{--},
    morecomment=[s][\color{codegray}]{{/*}{*/}},
    morestring=[b]",
    morestring=[b]',
    % keyword highlighting
    classoffset=1, % starting new class
    %otherkeywords={CONCAT,ROUND,COUNT,COALESCE,DISTINCT,MIN,MAX,SUM,AVG,ANY,ALL},
    morekeywords={CONCAT, ROUND, COUNT, COALESCE, DISTINCT, MIN, MAX, SUM, AVG, ANY, ALL, NOW, POW, CAST, STR_TO_DATE, DATE_FORMAT, GET_FORMAT, DATEDIFF, TIMEDIFF, DATE_ADD},
    keywordstyle=\color{codegreen},
    classoffset=0,
    classoffset=2, % starting new class
    %otherkeywords={NULL},
    morekeywords={NULL},
    keywordstyle=\bfseries\color{codered},
    classoffset=0,
    classoffset=3, % starting new class
    morekeywords={INT, CHAR, VARCHAR, DECIMAL, FLOAT, DATETIME, DEFAULT, BOOLEAN, DATE, TIME, DATETIME},
    keywordstyle=\bfseries\color{codeorange},
    classoffset=0,
    % better highlighting
    moredelim=**[is][\btHL]{!}{!},
    }

\lstdefinestyle{MatseInputStyle}{
    backgroundcolor=\color{backcolour}, 
    basicstyle=\footnotesize\ttfamily,
    keywordstyle=\bfseries\color{codeblue},  
    stringstyle=\color{codered},
    commentstyle=\color{codegrey},
    %keywordstyle=\color{codeblue},
    %stringstyle=\color{codered},
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    showspaces=false,
    showstringspaces=false,
    showtabs=false, %
    autogobble=true,
    % SQL specific
    % language=mysql,
    % deletekeywords={IDENTITY},
    % deletekeywords={[2]INT},
    % morekeywords={clustered},
    % show small line numbers
    numbers=left,
    numberstyle=\tiny\color{codegray},
    numbersep=10pt,
    stepnumber=1,
    framesep=5pt,
    xleftmargin=10pt,
    framexleftmargin=0pt,
    %frame=ltb,
    frame=l,
    framerule=0pt,
}
\lstset{style=MatseInputStyle}

\makeatletter
% Re-enable paragraph spacing in minipages;
% we choose something smaller than what is used outside of minipages.
\newcommand{\@minipagerestore}{\setlength{\parskip}{0.8\medskipamount}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utilities
\usepackage{blindtext}
\usepackage{footnote}
\usepackage{pdfpages}

\usepackage{nicefrac}
\usepackage{polynom}

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
\usepackage{siunitx}
\usepackage{venndiagram}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diagrams
\usepackage{tikz}
\usepackage{tikzscale}
\usepackage{pgfplots, pgfplotstable}
\usepgfplotslibrary{fillbetween}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Environments
\usepackage{algpseudocode}

% for each
\algnewcommand\algorithmicforeach{\textbf{for each}}
\algdef{S}[FOR]{ForEach}[1]{\algorithmicforeach\ #1\ \algorithmicdo}

% Just like the 'center' block, but without spacing around it.
\newenvironment{tightcenter}{%
  \setlength\topsep{0pt}
  \setlength\parskip{0pt}
  \begin{center}
}{%
  \end{center}
}

% LaTeX counter interface for \rownum
% ---
\makeatletter
\@ifundefined{c@rownum}{%
  \let\c@rownum\rownum
}{}
\@ifundefined{therownum}{%
  \def\therownum{\@arabic\rownum}%
}{}
\makeatother

%%%%%%%%%%%%%%%%
% Links and Metadata, Context Blocks
\usepackage{tcolorbox}
\usepackage{nameref}

\usepackage[]{imakeidx}
\usepackage[
  colorlinks,
  citecolor = .,
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

\usepackage{iflang}
\newcommand{\SpickerAlgorithm}{\IfLanguageName{ngerman}{Algorithmus}{Algorithm}}
\newcommand{\SpickerCode}{\IfLanguageName{ngerman}{Code}{Code}}

\tcbset{boxrule=0pt,toprule=1pt,parbox=false,on line}

\newenvironment{algo}[1]{%
\index{#1}%
\setlist{nosep,leftmargin=*}%
\begin{tcolorbox}[colback=fhblue!5!white, colframe=fhblue!75!black, title={\sffamily \SpickerAlgorithm: #1}]
}{%
\end{tcolorbox}}

\newenvironment{info}[1]{%
\setlist{nosep,leftmargin=*}%
\begin{tcolorbox}[colback=fhyellow!5!white, colframe=fhyellow!75!black, title={\sffamily Information: #1}]
}{%
\end{tcolorbox}}

\newenvironment{code}[1]{%
\index{#1}%
\begin{tcolorbox}[colback=fhpurple!5!white, colframe=fhpurple!75!black, title={\sffamily \SpickerCode: #1}]
}{%
\end{tcolorbox}}

\newenvironment{defi}[1]{%
\index{#1}%
\label{defi:#1}%
\begin{tcolorbox}[colback=fhmint!5!white, colframe=fhmint!75!black, title={\sffamily Definition: #1}, label=defi:#1]
%\begin{tcolorbox}[colback=fhmint!5!white, colframe=fhmint!75!black, title={\sffamily Definition: #1}]
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

% SQL specific
\newenvironment{sql}[1]{%
\index[SQL]{#1}%
\begin{tcolorbox}[colback=fhblue!5!white, colframe=fhblue!75!black, title={\sffamily SQL: #1}]
}{%
\end{tcolorbox}}

\newenvironment{sqlbonus}[1]{%
\index[SQL]{#1}%
\begin{tcolorbox}[colback=fhpurple!5!white, colframe=fhpurple!75!black, title={\sffamily SQL-Bonus: #1}]
}{%
\end{tcolorbox}}
    
\newcommand{\exampleseparator}{\noindent\rule{\textwidth}{0.2pt}}

\newcommand*{\fullref}[1]{\hyperref[{#1}]{\ref*{#1} \nameref*{#1}}}

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

\usepackage[
  style=numeric, 
  backend=bibtex, 
  sorting=none
]{biblatex}