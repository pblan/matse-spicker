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
\LoadClass[parskip=half-, DIV=15]{scrartcl}

% Enable own macros
\RequirePackage{operators}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enable post-90s text processing
\usepackage[default]{sourcesanspro} % upgrade default font
% \usepackage{lmodern} % upgrade default font
% \renewcommand\familydefault{\sfdefault}
\let\emph\relax % there's no \RedeclareTextFontCommand
\DeclareTextFontCommand{\emph}{\bfseries\itshape}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typesetting
\usepackage{babel}
\usepackage{microtype}
\usepackage{csquotes}
\usepackage{booktabs}
\usepackage{listings}
\usepackage{soul}

% \usepackage[sc]{mathpazo} % pretty font for text

% \linespread{1.05} % more spacing
\setkomafont{disposition}{\fontseries{sbc}\sffamily}

\usepackage[shortlabels]{enumitem}
\setlist{nosep}

\usepackage[scaled=0.85]{beramono}

\usepackage{lstautogobble}

\newcommand*{\ditto}{\texttt{\char`\"}}

% Colors
\RequirePackage[svgnames, table]{xcolor}

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
\definecolor{fhyellow}{RGB}{249,248,113}
\definecolor{bg}{rgb}{0.95,0.95,0.95}

\definecolor{codered}{rgb}{0.788, 0.102, 0.35}
\definecolor{codegreen}{rgb}{0.137, 0.471, 0.255}
\definecolor{codeblue}{rgb}{0, 0.333, 0.749}
\definecolor{codeorange}{rgb}{0.996, 0.541, 0.094}
\definecolor{codegrey}{rgb}{0.627, 0.647, 0.663}
\definecolor{codepurple}{HTML}{C42043}
\definecolor{backcolour}{HTML}{F2F2F2}

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
\usepackage{tabularx}

\usepackage{nicefrac}
\usepackage{polynom}

% Set Variables for title
% https://tex.stackexchange.com/a/214259 
\RequirePackage{etoolbox}

\makeatletter
\let\@university\@empty
\let\@programme\@empty
\let\@lecturer\@empty

\newcommand\university[1]{\gdef\@university{#1}}
\newcommand\programme[1]{\gdef\@programme{#1}}
\newcommand\lecturer[1]{\gdef\@lecturer{#1}}
\makeatother

\makeatletter
\newkomafont{spickerlink}{\usekomafont{title}\Large\bfseries}
\newkomafont{university}{\usekomafont{title}\Large}
\newkomafont{programme}{\usekomafont{title}\normalfont\large}
\newkomafont{lecturer}{\usekomafont{subtitle}}
\makeatother

% Show most recent revision number and date in date field
\makeatletter
\date{\small \IfLanguageName{ngerman}{Letzte Änderung:}{Last Change:} \filename@parse{\jobname}\IfFileExists{\filename@base.last-change}{\input{\filename@base.last-change}}{\today}}
\makeatother

% Custom Title Format
\makeatletter
\renewcommand*{\@maketitle}{%
  \global\@topnum=\z@
  \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
  \ifx\@titlehead\@empty \else
    \begin{minipage}[t]{\textwidth}
      \usekomafont{titlehead}{\@titlehead\par}%
    \end{minipage}\par
  \fi
  \null
  \vskip 2em%
  \begin{center}%
    % MATSE-Spicker 
    {\usekomafont{spickerlink}{\href{https://matse.paddel.xyz/spicker}{https://matse.paddel.xyz/spicker} \par}}%
    \vskip 1.5em
    % Subject
    \ifx\@subject\@empty \else
      {\usekomafont{subject}{\@subject \par}}%
      \vskip 1.5em
    \fi
    % University
    \ifx\@university\@empty \else
      {\usekomafont{university}{\@university\par}}%
      % \vskip .5em
    \fi
    % Programme
    \ifx\@programme\@empty \else
      {\usekomafont{programme}{\@programme\par}}%
      % \vskip .5em
    \fi
    \vskip 1em
      % Title
      {\usekomafont{title}{\Huge \@title \par}}%
    \vskip .5em
    % Subtitle
    \ifx\@subtitle\@empty \else
      {\usekomafont{subtitle}{\@subtitle \par}}%
      % \vskip .5em
    \fi
    \ifx\@lecturer\@empty \else
      {\usekomafont{subtitle}{\@lecturer \par}}%
      % \vskip .5em
    \fi
    \vskip 1em
      {%
        \usekomafont{author}{%
          \lineskip .5em%
          \begin{tabular}[t]{@{}l}
            \@author
          \end{tabular}\par
        }%
      }%
    \vskip .5em%
      {\usekomafont{date}{\@date \par}}%
    \vskip \z@ \@plus 1em
      {\usekomafont{publishers}{\@publishers \par}}%
    \ifx\@dedication\@empty \else
      \vskip 2em
        {\usekomafont{dedication}{\@dedication \par}}%
    \fi
  \end{center}%
  \par
  \vskip 2em
}%



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

\usetikzlibrary{tikzmark,bbox,calc,automata,arrows.meta,chains,decorations.pathreplacing,matrix,scopes,shapes.misc,shapes.multipart,backgrounds}

\usepackage{pgfplots, pgfplotstable}
\usepgfplotslibrary{fillbetween}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
\usepackage[most, skins]{tcolorbox}
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

% https://xyquadrat.ch/2022/04/04/latex-boxes/
\tcbset {
  base/.style={
      enhanced,
      arc=2mm,
      boxrule=0mm,
      coltitle=white,
      left=2.5mm,
      leftrule=1pt,
      rightrule=1pt,
      toprule=0pt,
      bottomrule=1pt,
      right=3.5mm,
    }
}

\newkomafont{spickerboxtype}{\normalfont\small\itshape}
\newkomafont{spickerboxtitle}{\normalfont\normalsize\bfseries}
\newkomafont{spickerboxsubtitle}{\normalfont\footnotesize\itshape}

\newenvironment{defi}[2][\empty]{%
  \ifx\empty#1
    \index{#2}%
  \else
    \index{#1!#2}%
  \fi
  \label{defi:#2}%
  \begin{tcolorbox}[%
      colbacktitle=fhmint!75!black,
      colback=fhmint!5!white,%
      colframe=fhmint!75!black,%
      base={#2},%
      label={%
          \ifx\empty#1
          {defi:#2}%
          \else
          {defi:#1:#2}
          \fi
        },
      % before title={%
      %         {\usekomafont{spickerboxtype}{Definition:}\hspace*{5mm}}
      %     },
      title={%
          \vphantom{Hy}%
          \usekomafont{spickerboxtitle}{{#2}}%
          \ifx\empty#1
          {}
          \else
          {
            \hspace{2.5mm}\usekomafont{spickerboxsubtitle}{#1}
          }
          \fi
        },
      after title={%
          {\hfill\usekomafont{spickerboxtype}{Definition}}
        },
      % after title={
      %         {\usekomafont{spickerboxsubtitle}{
      %                     \ifx\empty#1
      %                     {\hfill}
      %                     \else
      %                     {\hfill #1}
      %                     \fi
      %                 }}
      %     },
    ]%
    }%
    {%
    
  \end{tcolorbox}}


\newenvironment{bonus}[2][\empty]{%
  \ifx\empty#1
    \index{#2}%
  \else
    \index{#1!#2}%
  \fi
  \label{bonus:#2}%
  \begin{tcolorbox}[%
      colbacktitle=fhred!75!black,
      colback=fhred!5!white,%
      colframe=fhred!75!black,%
      base={#2},%
      label={%
          \ifx\empty#1
          {bonus:#2}%
          \else
          {bonus:#1:#2}
          \fi
        },
      % before title={%
      %         {\usekomafont{spickerboxtype}{Definition:}\hspace*{5mm}}
      %     },
      title={%
          \vphantom{Hy}%
          \usekomafont{spickerboxtitle}{{#2}}%
          \ifx\empty#1
          {}
          \else
          {
            \hspace{2.5mm}\usekomafont{spickerboxsubtitle}{#1}
          }
          \fi
        },
      after title={%
          {\hfill\usekomafont{spickerboxtype}{Bonus}}
        },
      % after title={
      %         {\usekomafont{spickerboxsubtitle}{
      %                     \ifx\empty#1
      %                     {\hfill}
      %                     \else
      %                     {\hfill #1}
      %                     \fi
      %                 }}
      %     },
    ]%
    }%
    {%
    
  \end{tcolorbox}}


\newenvironment{example}[2][\empty]{%
  \ifx\empty#1
    \index[Beispiele]{#2}%
  \else
    \index[Beispiele]{#1!#2}%
  \fi
  \label{example:#2}%
  \begin{tcolorbox}[%
      colbacktitle=fhblue!75!black,
      colback=fhblue!5!white,%
      colframe=fhblue!75!black,%
      base={#2},%
      label={%
          \ifx\empty#1
          {example:#2}%
          \else
          {example:#1:#2}
          \fi
        },
      % before title={%
      %         {\usekomafont{spickerboxtype}{Definition:}\hspace*{5mm}}
      %     },
      title={%
          \vphantom{Hy}%
          \usekomafont{spickerboxtitle}{{#2}}%
          \ifx\empty#1
          {}
          \else
          {
            \hspace{2.5mm}\usekomafont{spickerboxsubtitle}{#1}
          }
          \fi
        },
      after title={%
          {\hfill\usekomafont{spickerboxtype}{\IfLanguageName{ngerman}{Beispiel}{Example}}}
        },
      % after title={
      %         {\usekomafont{spickerboxsubtitle}{
      %                     \ifx\empty#1
      %                     {\hfill}
      %                     \else
      %                     {\hfill #1}
      %                     \fi
      %                 }}
      %     },
    ]%
    }%
    {%
    
  \end{tcolorbox}}

\newenvironment{algo}[1]{%
  \index{#1}%
  \setlist{nosep,leftmargin=*}%
  \begin{tcolorbox}[colback=fhblue!5!white, colframe=fhblue!75!black, title={\usekomafont{spickerboxtype}{\SpickerAlgorithm:} #1}]
    }{%
  \end{tcolorbox}}

\newenvironment{info}[1]{%
  \setlist{nosep,leftmargin=*}%
  \begin{tcolorbox}[colback=fhyellow!5!white, colframe=fhyellow!75!black, title={\usekomafont{spickerboxtype}{Information:} #1}]
    }{%
  \end{tcolorbox}}

\newenvironment{code}[1]{%
  \index{#1}%
  \begin{tcolorbox}[colback=fhpurple!5!white, colframe=fhpurple!75!black, title={\usekomafont{spickerboxtype}{\SpickerCode:} #1}]
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

\usepackage[
  style=numeric,
  backend=bibtex,
  sorting=none
]{biblatex}

% Add Disclaimer
\newcommand{\disclaimer}{%
  \clearpage
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{center}
    \section*{Haftungsausschluss}
  \end{center}
  \vspace{0.5cm}
  Liebe:r Leser:in,
  
  die folgende Zusammenfassung wurden mit viel Sorgfalt erstellt, um Dir einen Überblick über die vollständigen Vorlesungen zu geben.
  Als Referenzmaterial wurden in der Regel die Unterlagen des jeweiligen Semesters verwendet, es sei denn, es wurde ausdrücklich anders angegeben.
  
  Bitte beachte jedoch, dass diese Zusammenfassungen meine persönliche Interpretation der Vorlesungen widerspiegeln und möglicherweise nicht alle Facetten der behandelten Themen erfassen.
  Jede:r Dozent:in hat eigenen Stil und Schwerpunkt, wodurch sich die Inhalte von Semester zu Semester leicht verändern können.
  
  Es ist mir wichtig zu betonen, dass diese Zusammenfassungen nicht als Ersatz für den direkten Besuch der Vorlesungen oder das Studium der offiziellen Lehrmaterialien dienen sollen.
  Sie dienen lediglich als Unterstützung, um Dir einen Anhaltspunkt zu geben und Dir beim Lernen zu helfen.
  
  Ich übernehme keine Gewähr für die Richtigkeit, Vollständigkeit oder Aktualität der bereitgestellten Informationen.
  Es liegt in Deiner Verantwortung, Deine Kenntnisse durch den persönlichen Besuch der Vorlesungen und das Studium der offiziellen Unterlagen zu vertiefen.
  
  Betrachte diese Zusammenfassungen gern als Ausgangspunkt für Deine eigenen Notizen.
  Nutze sie als Sprungbrett, um tiefer in die Materie einzusteigen und Dein Verständnis zu erweitern.
  Ergänze Dein Wissen durch Diskussionen mit Kommiliton:innen, den Austausch mit Dozent:innen und das Hinzuziehen weiterer zuverlässiger Quellen und Fachliteratur.
  
  Solltest Du Fehler finden oder Verbesserungsvorschläge haben, freue ich mich über Deine Rückmeldung über \href{https://github.com/pblan/matse-spicker}{GitHub}.
  Du kannst mich alternativ per \href{mailto:patrick.blaneck@rwth-aachen.de}{E-Mail} erreichen.
  
  Vielen Dank und viel Erfolg bei Deinem Studium!
  
  \vspace{0.5cm}
  
  Herzliche Grüße\\
  Patrick Gustav Blaneck
  \vspace*{\fill}
  \clearpage
}
