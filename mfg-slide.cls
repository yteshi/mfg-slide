% Copyright 2024 by Yuta Teshima
%
% This file may be distributed and/or modified under the GNU Public License.
% The latest version is available at https://www.gnu.org/licenses/gpl-3.0.html .
% See the file LICENSE for more details.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mfg-slide}[2024/10/13 mfg-slide]

\LoadClassWithOptions{beamer}
\usetheme{MFG}

\RequirePackage{amsmath, amssymb, physics}
\RequirePackage{mathtools}
\RequirePackage{unicode-math}
\unimathsetup{math-style=ISO,bold-style=ISO}
\RequirePackage{calc, environ}

\newcommand{\margin}{5mm}
\newcommand{\halfmargin}{4.4mm}

\NewEnviron{wideframe}[1][]{%
    \begin{frame}{#1}%
        \newdimen{\mytextwidth}%
        \mytextwidth=\dimexpr\textwidth+\halfmargin+\halfmargin\relax%
        \makebox[\textwidth][c]{%
            \begin{minipage}{\mytextwidth}%
                \BODY%
            \end{minipage}%
        }%
    \end{frame}}

% Modified code of `beamerbaseboxes.sty`
% Modified lines are marked with `% NEW`.
% The original code is available https://github.com/josephwright/beamer/blob/main/base/beamerbaseboxes.sty
\renewcommand\beamerboxesrounded[2][]{%
    \global\let\beamer@firstlineitemizeunskip=\relax%
    \vbox\bgroup%
    \setkeys{beamerboxes}{upper=block title,lower=block body,width=\textwidth,shadow=false}%
    \setkeys{beamerboxes}{#1}%
    {%
        \usebeamercolor{\bmb@lower}%
        \globalcolorstrue%
        \colorlet{lower.bg}{bg}%
    }%
    {%
        \usebeamercolor{\bmb@upper}%
        \globalcolorstrue%
        \colorlet{upper.bg}{bg}%
    }%
    %
    % Typeset head
    %
    \vskip4bp
    \setbox\bmb@box=\hbox{%
        \begin{minipage}[b]{\bmb@width}%
            \usebeamercolor[fg]{\bmb@upper}%
            #2%
        \end{minipage}}%
    \ifdim\wd\bmb@box=0pt%
        \setbox\bmb@box=\hbox{}%
        \ht\bmb@box=1.5pt%
        \bmb@prevheight=-4.5pt%
    \else%
        \wd\bmb@box=\bmb@width%
        \bmb@temp=\dp\bmb@box%
        \ifdim\bmb@temp<1.5pt%
            \bmb@temp=1.5pt%
        \fi%
        \setbox\bmb@box=\hbox{\raise\bmb@temp\hbox{\box\bmb@box}}%
        \dp\bmb@box=0pt%
        \bmb@prevheight=\ht\bmb@box%
    \fi%
    \bmb@temp=\bmb@width%
    \bmb@dima=\bmb@temp\advance\bmb@dima by2.2bp%
    \bmb@dimb=\bmb@temp\advance\bmb@dimb by4bp%
    \hbox{%
        \begin{pgfpicture}{0bp}{+-\ht\bmb@box}{0bp}{+-\ht\bmb@box}
            \ifdim\wd\bmb@box=0pt%
                \color{lower.bg}%
            \else%
                \color{upper.bg}%
            \fi%
            %   \pgfpathqmoveto{-4bp}{-1bp}% original
            %   \pgfpathqcurveto{-4bp}{1.2bp}{-2.2bp}{3bp}{0bp}{3bp}% original
            %   \pgfpathlineto{\pgfpoint{\bmb@temp}{3bp}}% original
            \pgfpathqmoveto{-4bp}{-1bp}% NEW
            \pgfpathqcurveto{-4bp}{2.1bp}{-3.1bp}{3bp}{0bp}{3bp}% NEW
            \pgfpathlineto{\pgfpoint{\bmb@temp}{3bp}}% NEW
            \pgfpathcurveto%
            %       {\pgfpoint{\bmb@dima}{3bp}}% original
            %       {\pgfpoint{\bmb@dimb}{1.2bp}}% original
            {\pgfpoint{\bmb@dima+0.9bp}{3bp}} % NEW
            {\pgfpoint{\bmb@dimb}{2.1bp}} % NEW
            {\pgfpoint{\bmb@dimb}{-1bp}}
            \bmb@dima=-\ht\bmb@box%
            \advance\bmb@dima by-2pt%
            \pgfpathlineto{\pgfpoint{\bmb@dimb}{\bmb@dima}}
            \pgfpathlineto{\pgfpoint{-4bp}{\bmb@dima}}
            \pgfusepath{fill}
        \end{pgfpicture}%
        \copy\bmb@box%
    }%
    \nointerlineskip%
    \vskip-1pt%
    \ifdim\wd\bmb@box=0pt%
    \else%
        \hbox{%
            \begin{pgfpicture}{0pt}{0pt}{\bmb@width}{6pt}
                \bmb@dima=\bmb@width%
                \advance\bmb@dima by8bp%
                \pgfpathrectangle{\pgfpoint{-4bp}{-1bp}}{\pgfpoint{\bmb@dima}{8bp}}
                \pgfusepath{clip}
                {\pgftransformshift{\pgfpoint{-4bp}{0bp}}\pgftext[left,base]{\pgfuseshading{bmb@transition}}}%
            \end{pgfpicture}%
        }%
        \nointerlineskip%
        \vskip-0.5pt%
    \fi%
    \ifbmb@shadow%
        \setbox\bmb@boxshadow=\hbox{\pgfuseshading{bmb@shadow}}%
        \setbox\bmb@boxshadowball=\hbox{\pgfuseshading{bmb@shadowball}}%
        \setbox\bmb@boxshadowballlarge=\hbox{\pgfuseshading{bmb@shadowballlarge}}%
    \fi%
    \setbox\bmb@colorbox=\hbox{{\pgfpicturetrue\pgfsetcolor{lower.bg}}}%
    \setbox\bmb@box=\hbox\bgroup\begin{minipage}[b]{\bmb@width}%
        \vskip2pt%
        \usebeamercolor[fg]{\bmb@lower}%
        \colorlet{beamerstructure}{upper.bg}%
        \colorlet{structure}{upper.bg}%
        %\color{.}%
        }

        \def\endbeamerboxesrounded{%
    \end{minipage}\egroup%
    \wd\bmb@box=\bmb@width%
    \bmb@temp=\dp\bmb@box%
    \advance\bmb@temp by.5pt%
    \setbox\bmb@box=\hbox{\raise\bmb@temp\hbox{\box\bmb@box}}%
    \dp\bmb@box=0pt%
    \bmb@temp=\wd\bmb@box%
    \bmb@dima=\bmb@temp\advance\bmb@dima by2.2bp%
    \bmb@dimb=\bmb@temp\advance\bmb@dimb by4bp%
    \hbox{%
        \begin{pgfpicture}{0bp}{0bp}{0bp}{0bp}
            \ifbmb@shadow%
            {\pgftransformshift{\pgfpoint{4bp}{-3bp}}\pgftext{\copy\bmb@boxshadowball}}
            \begin{pgfscope}
                {%
                    \advance\bmb@temp by-1bp%
                    \pgfpathrectangle{\pgfpoint{\bmb@temp}{-7bp}}{\pgfpoint{9bp}{9bp}}%
                    \pgfusepath{clip}
                }%
                {\pgftransformshift{\pgfpoint{\bmb@temp}{1bp}}\pgftext{\box\bmb@boxshadowballlarge}}
            \end{pgfscope}
            \begin{pgfscope}
                \advance\bmb@temp by-4bp%
                \pgfpathrectangle{\pgfpoint{4bp}{-7bp}}{\pgfpoint{\bmb@temp}{5bp}}
                \pgfusepath{clip}
                {\pgftransformshift{\pgfpoint{4bp}{-7bp}}\pgftext[left,base]{\copy\bmb@boxshadow}}%
            \end{pgfscope}
            \begin{pgfscope}
                \advance\bmb@temp by 4bp%
                \bmb@dima=\ht\bmb@box%
                \advance\bmb@dima by\bmb@prevheight%
                \advance\bmb@dima by 4bp%
                \pgfpathrectangle{\pgfpoint{\bmb@temp}{1bp}}{\pgfpoint{4bp}{\bmb@dima}}
                \pgfusepath{clip}
                \advance\bmb@dima by-4bp%
                {\pgftransformshift{\pgfpoint{\bmb@temp}{\bmb@dima}}\pgftext{\box\bmb@boxshadowball}}
                \advance\bmb@dima by-1bp%
                \pgfpathrectangle{\pgfpoint{\bmb@temp}{1bp}}{\pgfpoint{4bp}{\bmb@dima}}
                \pgfusepath{clip}
                \advance\bmb@temp by4bp%
                    {\pgftransformshift{\pgfpoint{\bmb@temp}{-3bp}}%
                        \pgftransformrotate{90}%
                        \pgftext[left,base]{\box\bmb@boxshadow}}%
            \end{pgfscope}
            \fi%
            \unhbox\bmb@colorbox%
            \pgfpathqmoveto{-4bp}{1bp}
            %   \pgfpathqcurveto{-4bp}{-1.2bp}{-2.2bp}{-3bp}{0bp}{-3bp} % original
            \pgfpathqcurveto{-4bp}{-2.1bp}{-3.1bp}{-3bp}{0bp}{-3bp} % NEW
            \pgfpathlineto{\pgfpoint{\the\bmb@temp}{-3bp}}
            \pgfpathcurveto%
            %   {\pgfpoint{\the\bmb@dima}{-3bp}}% original
            %   {\pgfpoint{\the\bmb@dimb}{-1.2bp}}% original
            %   {\pgfpoint{\the\bmb@dimb}{1bp}}% original
            {\pgfpoint{\bmb@dima+0.9bp}{-3bp}} % NEW
            {\pgfpoint{\bmb@dimb}{-2.1bp}}
            {\pgfpoint{\the\bmb@dimb}{1bp}}
            {
                \bmb@dima=\ht\bmb@box%
                \pgfpathlineto{\pgfpoint{\bmb@dimb}{\bmb@dima}}
                \pgfpathlineto{\pgfpoint{-4bp}{\bmb@dima}}
                \pgfusepath{fill}
            }
            \ifbmb@shadow%
            {
                \color{black!50!bg}
                \pgfsetlinewidth{0pt}
                \pgfpathmoveto{\pgfpoint{\bmb@dimb}{-.5bp}}
                \bmb@dima=\ht\bmb@box%
                \advance\bmb@dima by\bmb@prevheight%
                \advance\bmb@dima by 1bp%
                \pgfpathlineto{\pgfpoint{\bmb@dimb}{\bmb@dima}}
                \pgfusepath{stroke}
                \bmb@temp=\bmb@dima
                \advance\bmb@dima by 1bp%
                \color{black!31!bg}
                \pgfpathmoveto{\pgfpoint{\bmb@dimb}{\bmb@temp}}
                \pgfpathlineto{\pgfpoint{\bmb@dimb}{\bmb@dima}}
                \pgfusepath{stroke}
                \advance\bmb@dima by 1bp%
                \advance\bmb@temp by 1bp%
                \color{black!19!bg}
                \pgfpathmoveto{\pgfpoint{\bmb@dimb}{\bmb@temp}}
                \pgfpathlineto{\pgfpoint{\bmb@dimb}{\bmb@dima}}
                \pgfusepath{stroke}
                \advance\bmb@dima by 1bp%
                \advance\bmb@temp by 1bp%
                \color{black!6!bg}
                \pgfpathmoveto{\pgfpoint{\bmb@dimb}{\bmb@temp}}
                \pgfpathlineto{\pgfpoint{\bmb@dimb}{\bmb@dima}}
                \pgfusepath{stroke}
                \advance\bmb@dima by 1.5bp%
                \advance\bmb@temp by 1bp%
                \color{bg}
                \pgfpathmoveto{\pgfpoint{\bmb@dimb}{\bmb@temp}}
                \pgfpathlineto{\pgfpoint{\bmb@dimb}{\bmb@dima}}
                \pgfusepath{stroke}
            }
            \fi
        \end{pgfpicture}%
        \box\bmb@box%
    }%
    \ifbmb@shadow%
        \vskip4bp minus 2bp%
    \else%
        \vskip2bp%
    \fi%
    \egroup% of \vbox\bgroup
}

