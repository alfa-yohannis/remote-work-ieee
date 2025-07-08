%% infotel.cls 1   2024-02-01    Infotel style file
%------------------------------------------------------------------
% Filename: infotel.cls
%
% This documentclass is intended for typesetting articles for the
%
%                        Jurnal Infotel.
%
%
% Search for ``%%% PART'' to find the main parts of this class file.
% 
% The class was developed by Matt Duckham (http://www.duckham.org) 
% in substantial part based on the toc (Theory of Computing) 
% document class. For more information see:
%  
%             http://theoryofcomputing.org
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Declare class and load external packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Need this version of LaTeX atleast (for ClassWarning commands)
\NeedsTeXFormat{LaTeX2e}[1994/06/01] 
\ProvidesClass{infotel}[2009/08/12 v1.1 Jurnal Infotel]

% Type area sizes
%\DeclareOption{demy}
%   {\setlength\textwidth  {115mm}%
%    \setlength\textheight {170mm}}
%\DeclareOption{royal}
%   {\setlength\textwidth  {115mm}%
%    \setlength\textheight {190mm}}
%\DeclareOption{quarto}
%   {\setlength\textwidth  {135mm}%
%    \setlength\textheight {202mm}}
%\DeclareOption{crown}
%   {\setlength\textwidth  {140mm}%
%    \setlength\textheight {220mm}}

% Load article class and handle options.
\ProcessOptions\relax
\LoadClass[10pt,twoside,letterpaper,onecolumn]{article}

% Load required packages
\RequirePackage{palatino}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{url}
%\RequirePackage[cross,letter,center]{crop}
\RequirePackage[letter,center]{crop}
%\RequirePackage{geometry}

\RequirePackage{authblk}
\renewcommand{\Affilfont}{\small}

% Load cclicenses package
% Note that this package is included in the infotel/latex distribution
\RequirePackage{cclicenses}


\urlstyle{rm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% IF macro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rather than load the whole ifthen package, we'll use the following macro.
%
% Check if the two arguments expand to the same thing
% MAGIC happens in the \edef which expands #1 and #2 completely first
% Mainly used to check equality of strings
\newcommand{\ifex}[2]{%
   \edef\infotel@tmpa{#1}%
   \edef\infotel@tmpb{#2}%
   \ifx\infotel@tmpa\infotel@tmpb
}

  \setlength{\itemsep}{1pt}
  \setlength{\parskip}{0pt}
  \setlength{\parsep}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Define the layout of the page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set page and margin lengths

%% Lulu: Crown Quarto Color, Perfect Bound (18.91cm x 24.589cm)
\setlength{\paperwidth}{21cm} % set size for latex
\setlength{\paperheight}{29.7cm}
\special{papersize=21cm,29.7cm} % set size for ghostscript
%\setlength{\paperwidth}{7.5in} % set size for latex
%\setlength{\paperheight}{10in}
%\special{papersize=7.5in,10in} % set size for ghostscript
%``\typearea[6mm]{1}%% 6 mm for spine

%\setlength{\voffset}{45pt}
%\setlength{\hoffset}{-40pt}
\setlength\textwidth  {140mm}%
\setlength\textheight {200mm}
%\setlength{\headheight}{24pt}
%\setlength{\headsep}{24pt}
%\setlength{\footskip}{30pt}
%\setlength{\textheight}{578.5pt}
%\setlength{\marginparwidth}{62.27pt}

% Compute side margins to center text horizontally in page.
\newlength{\infotel@hpadding}
\setlength{\infotel@hpadding}{\paperwidth}
\addtolength{\infotel@hpadding}{-2in}
\addtolength{\infotel@hpadding}{-\textwidth}
\setlength{\evensidemargin}{.5\infotel@hpadding}
\setlength{\oddsidemargin}{.5\infotel@hpadding}
\addtolength{\evensidemargin}{-0.1in}
\addtolength{\oddsidemargin}{0.1in}

% Compute top margin to center virtual header/footer textbox.
\newlength{\infotel@documentheight}
\newlength{\infotel@vpadding}
\setlength{\infotel@documentheight}{\textheight}
\addtolength{\infotel@documentheight}{\footskip}
\addtolength{\infotel@documentheight}{\headsep}
\addtolength{\infotel@documentheight}{\headheight}
\setlength{\infotel@vpadding}{\paperheight}
\addtolength{\infotel@vpadding}{-\infotel@documentheight}
\addtolength{\infotel@vpadding}{-2in}
\setlength{\topmargin}{.5\infotel@vpadding}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Values of parameters specific to the journal 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\infotel@journalname{Jurnal Infotel}
\newcommand\infotel@journaladdress{https://ejournal.ittelkom-pwt.ac.id/index.php/infotel}
\newcommand{\infotel@cclicenseurl}{http://creativecommons.org/licenses/by/3.0/}

% Initialize properties to default value
\newcommand{\infotel@month}{\@empty}
\newcommand{\infotel@year}{\@empty}
\newcommand{\infotel@volume}{\@empty}
\newcommand{\infotel@number}{\@empty}
\newcommand{\infotel@received}{\@empty}
\newcommand{\infotel@accepted}{\@empty}
\newcommand{\infotel@returned}{\@empty}
\newcommand{\infotel@revised}{\@empty}
\newcommand{\infotel@declaredfirstpage}{\@empty}
\newcommand{\infotel@declaredlastpage}{\@empty}
\newcommand{\infotel@doi}{\@empty}
\newcommand{\infotel@url}{\@empty}

%%% The rest of this part establises the hookds for the \infoteldetails command.
\define@key{infoteldet}{month}{\renewcommand{\infotel@month}{#1}}
\define@key{infoteldet}{year}{\renewcommand{\infotel@year}{#1}}
\define@key{infoteldet}{volume}{\renewcommand{\infotel@volume}{#1}}
\define@key{infoteldet}{number}{\renewcommand{\infotel@number}{#1}}
\define@key{infoteldet}{doi}{\renewcommand{\infotel@doi}{#1}}
\define@key{infoteldet}{received}{\renewcommand{\infotel@received}{#1}}
\define@key{infoteldet}{accepted}{\renewcommand{\infotel@accepted}{#1}}
\define@key{infoteldet}{returned}{\renewcommand{\infotel@returned}{#1}}
\define@key{infoteldet}{revised}{\renewcommand{\infotel@revised}{#1}}
\define@key{infoteldet}{firstpage}{\renewcommand{\infotel@declaredfirstpage}{#1}}
\define@key{infoteldet}{lastpage}{\renewcommand{\infotel@declaredlastpage}{#1}}
\define@key{infoteldet}{doi}{\renewcommand{\infotel@doi}{#1}}
\define@key{infoteldet}{url}{\renewcommand{\infotel@url}{#1}}

% argument is a comma seperated list of the type "volume=6,year=8,..."
% If we have details of section we are interested in, process it
\newcommand{\infoteldetails}[1]{\setkeys{infoteldet}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Default values for Article META Information 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\infotel@copyrightauthor{Jurnal Infotel}
\newcommand\infotel@runningauthor{}
\newcommand\infotel@runningtitle{}

% Define parameter passing functions for author metadata.
\newcommand*{\runningauthor}[1]{%
    \renewcommand\infotel@runningauthor{#1}}
\newcommand*{\runningtitle}[1]{%
    \renewcommand\infotel@runningtitle{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Keywords definition
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\def\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}

% Abstract environment redefined
\renewenvironment{abstract}{
      \vskip 1em\hrule\vskip 1em
      \@beginparpenalty\@lowpenalty
\noindent {\bfseries Abstract:}}%
     {\vskip 1em \noindent {\bfseries Keywords:} \@keywords \par\vskip 1em \hrule\par\vskip 1em\thispagestyle{titlepage}}

% Banner layout 
\newcommand{\infotel@bannerjournalname}%
          {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{sc}{\infotel@journalname}}

\newcommand{\infotel@bannertexta}{\infotel@bannerjournalname}

% Comment out for papers under review
\newcommand{\infotel@bannerpubdata}
           {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{sc}\selectfont
            {Vol. \infotel@volume, No. \infotel@number, \infotel@month\ \infotel@year, 
              pp. \infotel@declaredfirstpage--\infotel@declaredlastpage.}}

% Comment out for papers with publication data
%\renewcommand{\infotel@bannerpubdata}%
 %          {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{n}\selectfont%
%            {Number \infotel@number\ (Article forthcoming)}}%


% \newcommand{\infotel@bannerpubdata}{Article submitted for review}

\newcommand\infotel@bannertextb%
           {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{it}
            \selectfont{\infotel@bannerpubdata}}

\newcommand\infotel@bannertextc%
           {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{sc}
            \selectfont{doi:\infotel@doi}}

\newlength{\infotel@bannerwidth}
\setlength{\infotel@bannerwidth}{\textwidth}
\newcommand{\infotel@banner}{%
  \begin{minipage}{\infotel@bannerwidth}%
    \infotel@bannertexta\\ \infotel@bannertextb \hfill \infotel@bannertextc \\
  \end{minipage}}

% Define the date box. If \infotel@received is
% undefined, this will simply print
% the current date, as does the article class.
\newcommand\infotel@reviseddatelayout{\ifex\infotel@revised\@empty{}\else{Revised: \infotel@revised; Accepted: \infotel@accepted}\fi}
\newcommand\infotel@datelayout%
{\fontsize{8}{10}\usefont{OT1}{ptm}{m}{sl}\selectfont%
  \ifex{\infotel@received}{\@empty}{\@date}%
  \else%
  {{Received: \infotel@received; %
	%returned: \infotel@returned; %
   \infotel@reviseddatelayout.}}%
  \fi}

\def\@maketitle{%
  \newpage 
  \begin{center}%
    \infotel@banner%
  \end{center}%
  \null
  \articletype
  \vskip 2em%
  \begin{center}%
    \let \footnote \thanks
    {\huge \@title \par}%
    \vskip 1em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
       \@author %\\ \@affiliation
      \end{tabular}\par}%
    \vskip 0.5em%
    {\infotel@datelayout}%
  \end{center}%
  \par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Header and footer initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% This defines the footer running citation. We must produce two versions of it, the one without links is used
%% to determines spacing; the other is actually used for layout.
\newcommand\infotel@runningcitation%
{\textsc{\infotel@journalname}}

\newcommand\infotel@runningcitation@nolink%
{\textsc{\infotel@journalname}}

% Header layout wrapper.
\newcommand\infotel@headerlayout[1]
   {\fontsize{8}{10}\usefont{OT1}{ptm}{m}{sc}\selectfont{#1}}
\newcommand\infotel@footerlayout[1]
   {\fontsize{8}{10}\usefont{OT1}{ptm}{m}{sc}\selectfont{#1}}

% Copyright
\newcommand{\infotel@crlayout}[1]{\fontsize{6}{7}\usefont{OT1}{ptm}{m}{n}\selectfont{#1}}
\newcommand{\infotel@ccicon@text}[1]{\infotel@crlayout{$\bigcirc$\hspace{-6.6pt}\raisebox{.5pt}{\tiny{cc}}\hspace{1.5pt}}}
\newcommand{\infotel@cclogo@eps}[1]{\raisebox{-.5#1}{\includegraphics[height=#1]{infotel_large}}}
\newcommand{\infotel@ccicon@eps}[1]{\raisebox{-.5#1}{\includegraphics[height=#1]{infotel_small}}}

% Set up title page style.
\newcommand{\ps@titlepage}{%
  \renewcommand{\@oddhead}{\hfil\infotel@cclogo@eps{40pt}}%
  \renewcommand{\@evenhead}{\hfil\infotel@cclogo@eps{40pt}}%
  \renewcommand{\@oddfoot}{\small\copyright\ \infotel@copyrightauthor\hfil ISSN: 2085-3688; e-ISSN: 2460-0997}%
  \renewcommand{\@evenfoot}{\small\copyright\ \infotel@copyrightauthor\hfil ISSN: 2085-3688; e-ISSN: 2460-0997}%
}

% Set up the 2ff. page style.
\renewcommand{\ps@headings}{%
\renewcommand{\@oddhead}
             {\hfil\infotel@headerlayout{\infotel@runningtitle}\hfil\fontsize{9}{11}\usefont{OT1}{ptm}{m}{rm}\selectfont\thepage}%    
\renewcommand{\@evenhead}
             {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{rm}\selectfont\thepage\hfil\infotel@headerlayout{\infotel@runningauthor}\hfil}%
\renewcommand{\@oddfoot}
             {\hfil\infotel@footerlayout{Jurnal Infotel, \infotel@runningcitation}}%
\renewcommand{\@evenfoot}
             {\infotel@ccicon@eps{11pt}\ \ \ \href{https://ejournal.ittelkom-pwt.ac.id/index.php/infotel}{https://ejournal.ittelkom-pwt.ac.id/index.php/infotel}\hfil}%
}

%% Determine actual footer height.
\newlength\infotel@footerheight
\settoheight\infotel@footerheight{\infotel@footerlayout{\infotel@runningcitation@nolink}}

% Define the default page style to be headings.
\pagestyle{headings}
\pagenumbering{arabic}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Predefined Abbreviations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ie}{i.\,e.}
\newcommand{\eg}{e.\,g.}
\newcommand{\Eg}{E.\,g.}
\newcommand{\phd}{Ph.\,D.}
\newcommand{\msc}{M.\,S.}
\newcommand{\bsc}{B.\,S.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Article types
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\articletype}{\textsc{Research Article}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Header and footer initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%\renewcommand\infotel@runningcitation%
%{\ifex\infotel@number\@empty
%  {Article submitted for review}
% \else
%  {Number \infotel@number\ (\infotel@year),
%    pp. \infotel@declaredfirstpage--\infotel@declaredlastpage}
% \fi
%}

\renewcommand\infotel@runningcitation%
{\ifex\infotel@number\@empty
  	{Article submitted for review}
 \else
  {\ifex\infotel@year\@empty 
  	{Number \infotel@number\ (Article forthcoming)} 
  	\else {Vol. \infotel@volume, No. \infotel@number, \infotel@month\ \infotel@year,  pp. \infotel@declaredfirstpage--\infotel@declaredlastpage.} \fi }
 \fi
}

% Numbering within articles for long form articles.
%{\numberwithin{equation}{chapter}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Macros for compact list environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ----------------------------------------------------
%% Copyright (c) 1993 Hydro-Quebec [EMAIL PROTECTED]
%% ----------------------------------------------------

%% Bring items closer together in list environments 
% Prevent infinite loops
\let\orig@Itemize =\itemize         
\let\orig@Enumerate =\enumerate
\let\orig@Description =\description
% Zero the vertical spacing parameters
\def\Nospacing{\itemsep=0pt\topsep=0pt\partopsep=0pt%
\parskip=0pt\parsep=0pt}

% Small text in tables
\renewenvironment{table}{\@float{table}[htb]\small}{\end@float}


\def\noitemsep{
% Redefine the environments in terms of the original values
\renewenvironment{itemize}{\orig@Itemize\Nospacing}{\endlist}
\renewenvironment{enumerate}{\orig@Enumerate\Nospacing}{\endlist}
\renewenvironment{description}{\orig@Description\Nospacing}%
{\endlist}
}

\def\doitemsep{
% Redefine the environments to the original values
\renewenvironment{itemize}{\orig@Itemize}{\endlist}
\renewenvironment{enumerate}{\orig@Enumerate}{\endlist}
\renewenvironment{description}{\orig@Description}{\endlist}
}



%%%% fin macro %%%%
\noitemsep  

