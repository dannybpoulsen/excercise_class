\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{opgaver}[2020/08/12 Excercise sheets]

\newif\ifhidesolution
\newif\ifshowcorrectionhint
\showcorrectionhinttrue % einkommentieren für korrekturHinweise
\newif\iflandscape
\newif\ifshowgrid
\newif\ifenglish
\newif\ifdanish
\newif\ifinteractive
\newif\iflogo

\newcount\@punktcount

% this command gets written in the aux file:
\def\lastcountervalue#1#2{\expandafter\xdef\csname #1\endcsname{#2}}
% this is the user command to save the last value:
\AtEndDocument{\write\@auxout{\string\lastcountervalue{points}{\the\@punktcount}}}
% this is the user command to retrieve the last value:
\def\getlastpoints{%
  \@ifundefined{points}%
  {??}{\@nameuse{points}}%
}

\gdef\@kurs{}
\def\kurs#1{\gdef\@kurs{#1}}
\gdef\@leitungA{}
\def\leitungA#1{\gdef\@leitungA{#1}}
\gdef\@leitungB{}
\def\leitungB#1{\gdef\@leitungB{#1}}
\gdef\@serie{}
\def\serie#1{\gdef\@serie{#1}}
\gdef\@abgabe{}
\def\abgabe#1{\gdef\@abgabe{#1}}
\gdef\@ausgabe{}
\def\ausgabe#1{\gdef\@ausgabe{#1}}
\gdef\@uni{Christian-Albrechts-Universit\"{a}t zu Kiel}
\def\uni#1{\gdef\@uni{#1}}
\gdef\@institut{Institut f\"{u}r Informatik}
\def\institut#1{\gdef\@institut{#1}}
\gdef\@arbeitsgruppe{}
\def\arbeitsgruppe#1{\gdef\@arbeitsgruppe{#1}}
\gdef\@verantwortung{Prof. Awesome}
\def\verantwortung#1{\gdef\@verantwortung{#1}}
\gdef\@semester{Sommersemester 2019}
\def\semester#1{\gdef\@semester{#1}}

% Schlüsselwörter
\gdef\@languageEn{}
\def\languageEn#1{\gdef\@languageEn{#1}}
\gdef\@textPunkt{Punkt}
\def\textPunkt#1{\gdef\@textPunkt{#1}}
\gdef\@textPunkte{Punkte}
\def\textPunkte#1{\gdef\@textPunkte{#1}}
\gdef\@punkteSumme{}
\def\punkteSumme#1{\gdef\@punkteSumme{#1}}

\gdef\@textAbgabe{Abgabe}
\def\textAbgabe#1{\gdef\@textAbgabe{#1}}
\gdef\@textLoesung{Lösung:}
\def\textLoesung#1{\gdef\@textLoesung{#1}}
\def\textLoesung#1{\gdef\@textLoesung{#1}}
\gdef\@textKorrekturhinweis{Korrekturhinweis:}
\def\textKorrekturhinweis#1{\gdef\@textKorrekturhinweis{#1}}
\def\textKorrekturhinweis#1{\gdef\@textKorrekturhinweis{#1}}
\gdef\@textAufgabe{Hausaufgabe}
\def\textAufgabe#1{\gdef\@textAufgabe{#1}}
\gdef\@textSerie{Übungsblatt }
\def\textSerie#1{\gdef\@textSerie{#1}}
\gdef\@textLoesungsvorschlag{Lösungsvorschlag für Übungsblatt }
\def\textLoesungsvorschlag#1{\gdef\@textLoesungsvorschlag{#1}}


\DeclareOption{hidesolution}{\hidesolutiontrue}
\DeclareOption{hidecorrectionhint}{\showcorrectionhintfalse}
\DeclareOption{landscape}{\landscapetrue}
\DeclareOption{showgrid}{\showgridtrue}
\DeclareOption{english}{\englishtrue}
\DeclareOption{danish}{\danishtrue}
\DeclareOption{interactive}{\interactivetrue}
\DeclareOption{logo}{\logotrue}

\ProcessOptions\relax

\LoadClass{scrartcl}
\KOMAoptions{paper=a4}

\KOMAoptions{fontsize=11pt}
\KOMAoptions{pagesize=pdftex}

\RequirePackage[final]{hyperref}
\RequirePackage{scrlayer-scrpage}
\RequirePackage[final]{graphicx}
\pagestyle{scrheadings}
\clearscrheadfoot
\ohead{\pagemark}



\usepackage{tikz}
\usepackage[framemethod=tikz]{mdframed}
\usetikzlibrary{positioning, shapes,patterns,shadows.blur, arrows,decorations.text,arrows,automata,shadows,patterns,decorations.text, automata}
\tikzset{initial text={}}
\usepackage[margin=0.6in]{geometry}
\usepackage{svg}
\usepackage{braket}
\usepackage{enumerate}
\usepackage{dsfont}
\usepackage{fontawesome}
\usepackage{url}

\RequirePackage[T1]{fontenc}
%\RequirePackage[theoremfont,largesc,tighter]{newpxtext} % osf for text, not math
%\RequirePackage{cabin} % sans serif
%\RequirePackage{inconsolata} % sans serif mono font
%\RequirePackage{newpxmath} % bb from STIX
%\RequirePackage[cal=boondoxo]{mathalfa} % This package provides a standard means of setting math alphabets associated with the macros \mathcal, \mathbb, \mathfrak

\ifenglish
\textAbgabe{Due till}
\textLoesung{Solution}
\textKorrekturhinweis{Correction Advice}
\textAufgabe{Excercise}
\textSerie{Excercise Sheet}
\textLoesungsvorschlag{Example Solution}
\textPunkt{Point}
\textPunkte{Points}
\fi

\ifdanish
\textAbgabe{Afleveres}
\textLoesung{Løsning}
\textKorrekturhinweis{Retterark}
\textAufgabe{Opgave}
\textSerie{Opgaveark }
\textLoesungsvorschlag{Løsningsforslag til Opgaveark  }
\textPunkt{Point}
\textPunkte{Points}
\fi


\newcommand{\serienr}[0]{\nolinebreak\@serie}

% Farben
\definecolor{pantone280}{cmyk}{100,080,000,0.15}
\definecolor{pantone280}{RGB}{000,061,143}

\definecolor{cauTF}{RGB}{000,061,143}   %{RGB}{0,61,143} % HEX #003d86
\newcommand{\colorCauTF}[1]{{\color{cauTF}{#1}}}
\definecolor{cauMNF}{RGB}{242,148,0} % HEX #f29400
\newcommand{\colorcauMNF}[1]{{\color{cauMNF}{#1}}}
\definecolor{cauRed}{RGB}{216,42,47} % HEX #fedeed
\newcommand{\colorcauRed}[1]{{\color{cauRed}{#1}}}


\definecolor{aau_bl}{RGB}{33,26,82}
\definecolor{aau_blt}{RGB}{89,79,191}


\colorlet{usecol}{aau_bl}
\colorlet{headcol}{aau_blt}


% Titel Definition
\def\@maketitle{%
  \begin{tikzpicture}[remember picture,overlay]
 
 \node[anchor=north,fill=usecol,minimum width=\paperwidth,minimum height=1.5cm] at (current page.north) {};
\node[anchor=south,fill=usecol,minimum width=\paperwidth,minimum height=0.7cm] at (current page.south) {};
%\node[anchor=north] at ($(current page.north east)+(-4.55,-0.368)$) {\includegraphics[height=3cm]{tf}};
\node[anchor=north west,color=white] at ($(current page.north west)+(1.35,-0.57)$) {\sffamily{\fontsize{20}{20}\selectfont{\@kurs}}};
\ifx\@abgabe\empty\else
\node[anchor=south east,color=white] at ($(current page.south east)+(-0.05,0.05)$) {\scriptsize\sffamily\textbf{\@textAbgabe}: \@abgabe};
\fi
\node[anchor=south west,color=white] at ($(current page.south west)+(0.05,0.05)$) {\scriptsize\sffamily\@semester};
%\node[anchor=south east,fill=usecol,minimum width=0.9cm,minimum height=0.3cm] at ($(current page.south east)+(0,4)$)  {};

\iflogo\node[anchor=north] at ($(current page.north east)+(-2.55,-1.26)$) {\includegraphics[trim=0 0 0 60,clip,width=4.5cm]{AAU_LOGO_RGB}};
 \node[anchor=north] at ($(current page.north east)+(-2.55,-0)$) {\includegraphics[trim=0 20 0 0,clip,width=3cm]{AAU_LOGO_WHITE.png}};\else\empty\fi
 
\end{tikzpicture}


% \begin{tikzpicture}[remember picture,overlay]
%            \node[] at ($(current page.north east)+(-3,-2.45)$) {
%                \includegraphics[width=3cm]{ifi.png}
%           };
% \end{tikzpicture}
  %\parindent \z@%
 \vspace*{-0.25cm}
  {\sffamily\fontsize{9}{9}\selectfont
    \ifx\@arbeitsgruppe\empty\vspace{\baselineskip}\else\@arbeitsgruppe\\\fi
  \vspace{-0.4cm}
  
  \@verantwortung\ifx\@leitungA\empty\else, \@leitungA\fi\\
  }\vspace*{-0.2cm}

{\sffamily\color{headcol}	
\ifhidesolution	
\Huge{\@textSerie \@serie}
\else 
\sffamily\vspace*{0.05cm}\fontsize{20}{20}\selectfont{\@textLoesungsvorschlag \@serie}
\fi}
\vspace*{0.5cm}
  
%\parbox{9cm}{\centering {\large\textsc{\@uni}} \\% \@verantwortung \\
%  \@arbeitsgruppe\\\vspace*{0.12cm}
%  \scriptsize \@verantwortung, \@leitungA}
 
   %\hfill\@leitungA \\
%  \begin{center}
%    {\LARGE\textbf{\@kurs}}\vspace*{-0.4cm}
%  \end{center}
%  \rule{\textwidth}{0.1pt}
%  \@semester \hfill \@textAbgabe: \@abgabe
	
	
%	\vspace*{-0.2cm}{
%	\sffamily\color{usecol}	
%	\ifhidesolution	
%	\Huge\textbf{\@textSerie \@serie}
%	\else 
%	\LARGE\textbf{\@textLoesungsvorschlag \@serie}
%	\fi}

%  \begin{tikzpicture}[overlay,remember picture]
%  \node[anchor=center,opacity=.3] at ($(current page.south east)+(-2.05,2.25)$)  {\includegraphics[width=0.5\textwidth,trim=-1cm 7cm 0cm 0]{siegel}};
%  \end{tikzpicture}

}

% Schwierigkeitsgrad 0 - 3
\newcommand{\difficulty}[1]{
	\ifnum\pdfstrcmp{#1}{0}=0\faStarO\raisebox{.7ex}{\faStarO}\faStarO
	\else\ifnum\pdfstrcmp{#1}{0.5}=0\faStarHalfO\raisebox{.7ex}{\faStarO}\faStarO
	\else \ifnum\pdfstrcmp{#1}{1}=0\faStar\raisebox{.7ex}{\faStarO}\faStarO
	\else \ifnum\pdfstrcmp{#1}{1.5}=0\faStar\raisebox{.7ex}{\faStarHalfO}\faStarO
	\else \ifnum\pdfstrcmp{#1}{2}=0\faStar\raisebox{.7ex}{\faStar}\faStarO
	\else \ifnum\pdfstrcmp{#1}{2.5}=0\faStar\raisebox{.7ex}{\faStar}\faStarHalfO
	\else \ifnum\pdfstrcmp{#1}{3}=0\faStar\raisebox{.7ex}{\faStar}\faStar
	\else \phantom{\faStar\raisebox{.7ex}{\faStar}\faStar}
	\fi\fi\fi\fi\fi\fi\fi
}



% Aufgaben als Section
\newcommand{\aufgabe}[3]{\@afterindentfalse \addvspace{3.5ex \@plus 1ex \@minus .2ex}%
  \refstepcounter{section}%
  {\parindent \z@%
    \addcontentsline{toc}{section}{\@textAufgabe \arabic{section}}%
    \raggedsection\normalfont\nobreak{\normalfont{\normalfont\textbf{\color{headcol}\sffamily\large
    {\tiny\hspace*{0.35cm} \color{headcol}\raisebox{2.6ex}{\difficulty{#3}}}\hspace*{-1.05cm}\@textAufgabe			
    ~ \arabic{section}}}\enskip #1}\hfill\ifnum\pdfstrcmp{#2}{0}=0\empty\else\large#2 \ifnum\pdfstrcmp{#2}{1}=0\@textPunkt\else\@textPunkte\fi\fi\par\nobreak}\nobreak%
  \global\advance\@punktcount\numexpr(#2)%
  \@afterheading\par
}

% Hinweis als Section
%\newcommand{\hinweis}[1]{\@afterindentfalse \addvspace{3.5ex \@plus 1ex \@minus .2ex}%
%  {\parindent \z@%
%    \phantomsection%
%    \addcontentsline{toc}{section}{#1}%
%    \raggedsection\normalfont\nobreak \textbf{#1}\nobreak}\nobreak%
%  \@afterheading
%}

\ifhidesolution
\usepackage{environ}
\NewEnviron{hide}{}
\let\loesung\hide	
\else
%	\newenvironment{loesung}[1][\color{usecol}\sffamily\large\@textLoesung]{	
%	\begin{trivlist}
%	\item[\hskip \labelsep {\bfseries #1}]}{\end{trivlist}
%	}
	\newenvironment{loesung}{\par~\par\noindent\normalfont{\bfseries\color{headcol}\sffamily\large\@textLoesung}\par\nopagebreak%
	\begin{mdframed}[
		linewidth=1.5pt,
		linecolor=usecol!80,
		bottomline=false,topline=false,rightline=false,
		innerrightmargin=0pt,innertopmargin=0pt,innerbottommargin=0pt,
		innerleftmargin=0.2cm,
		skipabove=0.3\baselineskip
		]}
	{\end{mdframed} }
\fi

% Small Lists
\setlength\leftmargini  {30\p@}
\setlength\leftmargin    {\leftmargini}
\setlength\leftmarginii  {\leftmargini}
\setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\def\@listI{\leftmargin\leftmargini
            \parsep 1\p@ \@plus1\p@ \@minus\p@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep0\p@}
\let\@listi\@listI
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus2\p@ \@minus\p@}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@}

%Redefine the first level
\renewcommand{\theenumi}{\alph{enumi}}
\renewcommand{\labelenumi}{\theenumi)}

%\AtBeginDocument{%
%  \makeatletter
%  \author{\@verantwortung, \@leitungA}
%  \title{\@kurs}
%  \hypersetup{pdfsubject={Serie \@serie}}
%  \makeatother
%}


%% Commands

\newcommand{\blank}{\texttt{\char32}}
\newcommand{\turL}{\mathsf{L}}
\newcommand{\turR}{\mathsf{R}}
\newcommand{\turN}{\mathsf{N}}
\newcommand{\Lang}[1]{\ifmmode{\text{\textsc{#1}}}\else\textsc{#1}\fi}
\renewcommand{\epsilon}{\varepsilon}



% Borders
\usepackage{stackengine}
\def\linethickness{.5pt}
\newcommand\tbline[1]{%
	\stackunder{%
		\stackon{#1}{\rule{\widthof{~#1~}}{\linethickness}}%
	}{%
		{\rule{\widthof{~#1~}}{\linethickness}}%
	}%
}
\newsavebox\nodebox
\newcommand\lrline[1]{%
	\sbox\nodebox{%
		\stackunder{%
			\stackon{#1}{\phantom{\rule{\widthof{~#1~}}{\linethickness}}}%
		}{%
			{\phantom{\rule{\widthof{~#1~}}{\linethickness}}}%
		}%
	}%
	\rule[-\dp\nodebox]{\linethickness}{\ht\nodebox+\dp\nodebox}%
	\usebox{\nodebox}%
%	\rule[-\dp\nodebox]{\linethickness}{\ht\nodebox+\dp\nodebox}%
}
\newcommand\tblrline[1]{%
	\sbox\nodebox{%
		\tbline{#1}%
	}%
	\rule[-\dp\nodebox]{\linethickness}{\ht\nodebox+\dp\nodebox}%
	\usebox{\nodebox}%
	\rule[-\dp\nodebox]{\linethickness}{\ht\nodebox+\dp\nodebox}%
}

% Footer/Header
\ohead{}
\ihead{\normalfont \begin{tikzpicture}[remember picture,overlay]
	\node[anchor=north,fill=usecol,minimum width=\paperwidth,minimum height=1.5cm] at (current page.north) {};
	\node[anchor=south,fill=usecol,minimum width=\paperwidth,minimum height=0.7cm] at (current page.south) {};
	\node[anchor=north west,color=white] at ($(current page.north west)+(1.12,-0.57)$) {\sffamily{\fontsize{20}{20}\selectfont{
              \@kurs}}};
	\node[anchor=north east,color=usecol,fill=white,minimum width=0.75cm,minimum height=0.75cm,rounded corners=3pt] at ($(current page.north east)+(-0.5,-0.375)$) {\sffamily{\fontsize{15}{15}\selectfont{\color{usecol}\sffamily\sffamily\thepage}}};
	\node[anchor=south east,color=white] at ($(current page.south east)+(-0.05,0.05)$) {\scriptsize\sffamily{\ifhidesolution{\@textSerie \@serie}\else{\@textLoesungsvorschlag \@serie}\fi}};
	\node[anchor=south west,color=white] at ($(current page.south west)+(0.05,0.05)$) {\scriptsize\sffamily\@semester};
	%\node[anchor=south east,fill=usecol,minimum width=0.9cm,minimum height=0.3cm] at ($(current page.south east)+(0,4)$)  {};
	\end{tikzpicture}
}

\setlength{\parindent}{0pt}


% Hinweis unter Aufgabe
\newenvironment{remark}{\color{usecol}
	\begin{description}\item{\color{usecol}\faWarning~} }{\end{description}}

% Beispiel unter Aufgabe
\newenvironment{example}{
	\begin{description}	\item{\color{usecol}\faCommenting~} \color{usecol} }{\end{description}}

\RequirePackage{palatino}
%\RequirePackage{times}
\IfFileExists{roboto.sty}{
	\RequirePackage[condensed,]{roboto}
}{
	\RequirePackage{helvet}
	\renewcommand{\sfdefault}{phv}
}
%}



\usetikzlibrary{matrix}
\usepackage{pgfplots}
\usepackage{mathabx}
\renewcommand{\square}{\texttt{\char32}}
% Lösungsfelder:
\usepackage{zref-savepos}

%Lösungsbox
\newcommand{\yourSolution}{
	\ifhidesolution
	\ifshowgrid
	\automaticBoxText{Lösung}
	\fi
	\fi
}

% Automatic Boxes
\newcommand{\automaticBoxText}[1]{
	\vspace{0.4cm}\zsavepos{\arabic{section}}
	\textbf{\color{usecol}\sffamily #1:}~\\~\\
	\automaticBox
	\newpage
	\iflandscape
		\newGrid{362.5197pt}
		\newpage
	\fi
	
}

\newcommand{\automaticBox}{
	\begin{tikzpicture}
	\draw[step=0.5,black!20,thin,xshift=0.2cm,yshift=0.2cm, dashed] (0.3,0.3) grid (\linewidth-\pgflinewidth,{\the\dimexpr\zposy{\arabic{section}}sp\relax-65pt});
	\draw[step=1,black!30,thin,xshift=0.2cm,yshift=0.2cm] (0.3,0.3) grid (\linewidth-\pgflinewidth,{\the\dimexpr\zposy{\arabic{section}}sp\relax-65pt});
	\end{tikzpicture}
}

\newcommand{\newGrid}[1]{
	\ifhidesolution	
	\begin{tikzpicture}
	\draw[step=0.5,black!20,thin,xshift=0.2cm,yshift=0.2cm, dashed] (0.3,0.3) grid (\linewidth-\pgflinewidth,#1);
	\draw[step=1,black!30,thin,xshift=0.2cm,yshift=0.2cm] (0.3,0.3) grid (\linewidth-\pgflinewidth,#1);
	\end{tikzpicture}
	\fi}
\renewcommand\LayoutCheckField[2]{#2\hspace{5pt}#1}

\makeatletter
\def\@choiceinter#1{\ifhidesolution\par\CheckBox{#1}\else#1~\par\faCircleThin\fi\hfill}
\def\@choicestd#1{\par\faCircleThin~#1\hfill}
\def\@cchoiceinter#1{\ifhidesolution\par\CheckBox{#1}\else\par\faCheck~#1\fi\hfill}
\def\@cchoicestd#1{\ifhidesolution\@choicestd{#1}\else\par\faCheck~#1\fi\hfill}


  
\newcommand{\choice}[1]{\ifinteractive\@choiceinter{#1}\else\@choicestd{#1}\fi}
        %\faCircleThin~#1\hfill}
\newcommand{\cchoice}[1]{\ifinteractive\@cchoiceinter{#1}\else\@cchoicestd{#1}\fi}
\makeatother

\newenvironment{multchoice}{\par\addvspace{\baselineskip}}{\par\addvspace{\baselineskip}}

\newenvironment{answerspot}{\ifinteractive\begin{Form}\else\empty\fi}{\ifinteractive\end{Form}\else\empty\fi}



\makeatletter
\def\@makeSum{
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north east] at ($(current page.south east)+(-0.5,4.75)$) {\sffamily{\fontsize{10}{10}\selectfont{\color{usecol}\sffamily$\Sigma$}}};
    \node[anchor=north east,color=white,fill=usecol,draw=usecol,minimum width=0.5cm,minimum height=0.5cm,text=white,rounded corners=3pt] at ($(current page.south east)+(0.1,4.75)$) {\sffamily{\fontsize{10}{10}\selectfont{\sffamily\getlastpoints}}};
  \end{tikzpicture}
}

\def\@makeTextFieldInter#1{\vspace{15pt}\par \ifhidesolution\TextField[width=\textwidth,height=#1,multiline=true]{}\else\empty\fi}
\def\@makeTextFieldStd#1{\vspace{15pt}\par \ifhidesolution\framebox{\rule{0pt}{#1}\rule{\textwidth}{0pt}} \else\empty\fi}
\newcommand{\makeTextField}[1][3cm]{\ifinteractive\@makeTextFieldInter{#1}\else\@makeTextFieldStd{#1}\fi}
\newcommand{\makeSum}{\@makeSum}
\makeatother
\endinput

