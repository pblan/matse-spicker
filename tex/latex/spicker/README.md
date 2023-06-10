# spicker

This class file is designed for summarizations of university courses, specifically
in the field of computer science and mathematicss, but can easily be adapted to other fields. 

It supports German and English language by default.

Additional to the layout utilities, the class provides several commonly used
macros for computer science topics, namely several mathematical operators and
mathmode utilities.

## User Guide

Use the class like any default document class:

```latex
  \documentclass[<option>]{spicker}

  \title{}
  \subtitle{}
  \university{}
  \programme{}
  \lecturer{}

  \author{}
  % ...

  \makeindex[intoc] % index of definitions
  \makeindex[intoc, name=Beispiele,title=Beispiele] % index of examples

  \begin{document}
    \maketitle
    \tableofcontents

    \section{...}
    % ...
    
    \begin{defi}[Related Topic]{Subtopic}
      % ...
    \end{defi}

    % ...

    \printindex % definitions
    \printindex[Beispiele] % examples
  \end{document}
```

Because it inherits from `article`, you can pass down any options that
`article` understands.