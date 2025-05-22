\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{upsabo}[2025/05/18 UPSA-BO Thesis Template]

% Base class options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax

% Load base class (KOMA-Script book)
\LoadClass[
  a4paper,
  12pt,
  twoside,
  openright,
  parskip=half,
]{scrbook}

% Required packages
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{tocloft}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{titletoc}

% Define UPSA colors
\definecolor{upsared}{RGB}{171, 31, 45}
\definecolor{upsagray}{RGB}{83, 86, 90}

% Set page geometry
\geometry{
  top=2.5cm,
  bottom=2.5cm,
  inner=3cm,
  outer=2cm,
  bindingoffset=5mm,
}

% Configure hyperref
\hypersetup{
  colorlinks=true,
  linkcolor=upsared,
  citecolor=upsared,
  urlcolor=upsared,
  pdfborder={0 0 0},
}

% Title page variables
\renewcommand{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\studentid}[1]{\def\@studentid{#1}}
\newcommand{\place}[1]{\def\@place{#1}}
\newcommand{\academicyear}[1]{\def\@academicyear{#1}}
\newcommand{\submissiondate}[1]{\def\@submissiondate{#1}}

% Default values
\def\@subtitle{}
\def\@degree{}
\def\@faculty{}
\def\@supervisor{}
\def\@studentid{}
\def\@place{Cochabamba}
\def\@academicyear{\the\year}
\def\@submissiondate{\today}

% Cover page (external title page)
\newcommand{\makecoverpage}{
  \begin{titlepage}
    \centering
    \vspace*{1cm}

    % Logo
    \includegraphics[width=0.4\textwidth]{logo-upsa.png}\\[2cm]

    % Faculty
    {\Large\textbf{\@faculty}}\\[1cm]

    % Title
    {\LARGE\textbf{\@title}}\\[0.5cm]

    % Subtitle (if exists)
    \ifx\@subtitle\empty\else
      {\large\textbf{\@subtitle}}\\[0.5cm]
    \fi

    % Degree
    {\large Trabajo Final de Grado para obtener el título de:\\
    \textbf{\@degree}}\\[2cm]

    % Author
    {\large\textbf{Presentado por:}}\\
    {\large\textbf{\@author}}\\[2cm]

    % Place and year
    {\large\@place, \@academicyear}

    \vfill
  \end{titlepage}
  \cleardoublepage
}

% Internal title page
\newcommand{\makeinternaltitlepage}{
  \begin{titlepage}
    \centering
    \vspace*{1cm}

    % Logo
    \includegraphics[width=0.4\textwidth]{logo-upsa.png}\\[2cm]

    % Faculty
    {\Large\textbf{\@faculty}}\\[1cm]

    % Title
    {\LARGE\textbf{\@title}}\\[0.5cm]

    % Subtitle (if exists)
    \ifx\@subtitle\empty\else
      {\large\textbf{\@subtitle}}\\[0.5cm]
    \fi

    % Degree
    {\large Trabajo Final de Grado para obtener el título de:\\
    \textbf{\@degree}}\\[1.5cm]

    % Author and ID
    {\large\textbf{Presentado por:}}\\
    {\large\textbf{\@author}}\\
    {\large\textbf{Código: \@studentid}}\\[1.5cm]

    % Supervisor
    {\large\textbf{Bajo la dirección de:}}\\
    {\large\textbf{\@supervisor}}\\[1.5cm]

    % Place, date
    {\large\@place, \@submissiondate}

    \vfill
  \end{titlepage}
}

% Redefine \maketitle to use our custom title pages
\renewcommand{\maketitle}{
  \makecoverpage
  \makeinternaltitlepage
}

% TOC formatting
\renewcommand{\contentsname}{Índice General}
\renewcommand{\listfigurename}{Índice de Figuras}
\renewcommand{\listtablename}{Índice de Tablas}

% Create a command for appendices TOC
\newcommand{\listofappendices}{%
  \chapter*{Índice de Anexos}
  \@starttoc{app}
}

% Chapter formatting
\titleformat{\chapter}[display]
  {\normalfont\huge\bfseries}
  {\chaptertitlename\ \thechapter}{20pt}{\Huge}
\titlespacing*{\chapter}{0pt}{50pt}{40pt}

% Section formatting
\titleformat{\section}
  {\normalfont\Large\bfseries}
  {\thesection}{1em}{}
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

% Subsection formatting
\titleformat{\subsection}
  {\normalfont\large\bfseries}
  {\thesubsection}{1em}{}
\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\endinput
