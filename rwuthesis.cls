\NeedsTeXFormat{LaTeX2e}[2017/01/01]
\ProvidesClass{rwuthesis}[2019/09/02 RWU thesis class]

\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage{translations}

\SetupKeyvalOptions{
	family=rwuthesis,
	prefix=rwuthesis@
}

\newcommand{\rwuthesis@baseclass}{scrreprt}

\DeclareVoidOption{twoside}{%
	\PassOptionsToClass{\CurrentOption}{\rwuthesis@baseclass}
}
\DeclareVoidOption{twocolumn}{%
	\PassOptionsToClass{\CurrentOption}{\rwuthesis@baseclass}
}

\DeclareStringOption{type}
\DeclareStringOption{DIV}
\DeclareStringOption{BCOR}

\ProcessKeyvalOptions*

\PassOptionsToClass{12pt}{\rwuthesis@baseclass}

\LoadClass{scrreprt}
\RequirePackage{rwukoma}

\ifthenelse{\equal{\rwuthesis@DIV}{}}{}{%
	\KOMAoption{DIV}{\rwuthesis@DIV}%
}

\ifthenelse{\equal{\rwuthesis@BCOR}{}}{}{%
	\KOMAoption{BCOR}{\rwuthesis@BCOR}%
}

\ifthenelse{\equal{\rwuthesis@type}{bachelor} \OR \equal{\rwuthesis@type}{master}}{%
	\ClassInfo{rwuthesis}{Thesis type is \rwuthesis@type}%
}{%
	\ClassError{rwuthesis}{Thesis type has to be bachelor or master}{%
		Please specify the type option as type=bachelor or type=master\MessageBreak
		when defining the document class, e.g.:\MessageBreak
		\space\space \protect\documentclass[type=bachelor]{rwuthesis}
	}%
}

\DeclareTranslationFallback{rwuthesis-bachelor-thesis}{In-depth safety assessment \& breakdown of rover design considerations}
\DeclareTranslation{English}{rwuthesis-bachelor-thesis}{In-depth safety assessment \& breakdown of rover design considerations}
\DeclareTranslation{German}{rwuthesis-bachelor-thesis}{In-depth safety assessment \& breakdown of rover design considerations}

\DeclareTranslationFallback{rwuthesis-master-thesis}{}
\DeclareTranslation{English}{rwuthesis-master-thesis}{}
\DeclareTranslation{German}{rwuthesis-master-thesis}{}

\DeclareTranslationFallback{rwuthesis-degree-course}{}
\DeclareTranslation{English}{rwuthesis-degree-course}{}
\DeclareTranslation{German}{rwuthesis-degree-course}{}

\DeclareTranslationFallback{rwuthesis-faculty}{Faculty:}
\DeclareTranslation{English}{rwuthesis-faculty}{Faculty:}
\DeclareTranslation{German}{rwuthesis-faculty}{Fakultät:}

\DeclareTranslationFallback{rwuthesis-reviewer-tablelayout}{@{}ll}
\DeclareTranslation{English}{rwuthesis-reviewer-tablelayout}{@{}ll}
\DeclareTranslation{German}{rwuthesis-reviewer-tablelayout}{@{}l@{ }ll}
\DeclareTranslationFallback{rwuthesis-first-reviewer}{First Reviewer}
\DeclareTranslation{English}{rwuthesis-first-reviewer}{First Reviewer}
\DeclareTranslation{German}{rwuthesis-first-reviewer}{1. & Gutachter}
\DeclareTranslationFallback{rwuthesis-second-reviewer}{Second Reviewer}
\DeclareTranslation{English}{rwuthesis-second-reviewer}{Second Reviewer}
\DeclareTranslation{German}{rwuthesis-second-reviewer}{2. & Gutachter}

\DeclareTranslationFallback{rwuthesis-to-attain}{to attain academic accreditation for a scientific report}
\DeclareTranslation{English}{rwuthesis-to-attain}{to attain academic accreditation for a scientific report}
\DeclareTranslation{German}{rwuthesis-to-attain}{to attain academic accreditation for a scientific report}

\DeclareTranslationFallback{rwuthesis-submitted-by}{submitted by}
\DeclareTranslation{English}{rwuthesis-submitted-by}{submitted by}
\DeclareTranslation{German}{rwuthesis-submitted-by}{vorgelegt von}

\newcommand{\authormail}[1]{\newcommand{\rwuthesis@authormail}{#1}}
\newcommand{\fordegree}[1]{\newcommand{\rwuthesis@fordegree}{#1}}
\newcommand{\firstreviewer}[1]{\newcommand{\rwuthesis@firstreviewer}{#1}}
\newcommand{\firstreviewermail}[1]{\newcommand{\rwuthesis@firstreviewermail}{#1}}
\newcommand{\secondreviewer}[1]{\newcommand{\rwuthesis@secondreviewer}{#1}}
\newcommand{\secondreviewermail}[1]{\newcommand{\rwuthesis@secondreviewermail}{#1}}
\newcommand{\degreecourse}[1]{\newcommand{\rwuthesis@degreecourse}{#1}}
\newcommand{\faculty}[1]{\newcommand{\rwuthesis@faculty}{#1}}

\renewcommand{\maketitle}{%
	\begin{titlepage}
		\sffamily
		\begingroup%
			\setlength{\parfillskip}{0pt}%
			\begin{minipage}{\dimexpr\textwidth-6.12cm\relax}%
				\GetTranslation{rwuthesis-degree-course} \rwuthesis@degreecourse\\
				\GetTranslation{rwuthesis-faculty} \rwuthesis@faculty%
			\end{minipage}\hfill\begin{minipage}{5.12cm}%
				\rwulogo%
			\end{minipage}%
			\par%
		\endgroup

		\vfill

		\textbf{\Huge\@title}

		\ifthenelse{\equal{\rwuthesis@type}{bachelor}}{%
			\textbf{\large\GetTranslation{rwuthesis-bachelor-thesis}}
		}{%
			\textbf{\large\GetTranslation{rwuthesis-master-thesis}}
		}

		\vfill

		\GetTranslation{rwuthesis-to-attain}\\
		\rwuthesis@fordegree

		\vfill

		\GetTranslation{rwuthesis-submitted-by}:

		\textbf{\large\@author}
		\ifthenelse{\isundefined{\rwuthesis@authormail}}{%
			\ClassWarning{rwuthesis}{\protect\authormail\space undefined, no mail address on title page}
		}{%
			\\
			<\url{\rwuthesis@authormail}>
		}

		\@date

		\vfill

		\begin{tabular}{\GetTranslation{rwuthesis-reviewer-tablelayout}}
			\GetTranslation{rwuthesis-first-reviewer}: & \rwuthesis@firstreviewer
			\ifthenelse{\isundefined{\rwuthesis@firstreviewermail}}{}{
				<\url{\rwuthesis@firstreviewermail}>%
			}
			\\
			\GetTranslation{rwuthesis-second-reviewer}: & \rwuthesis@secondreviewer
			\ifthenelse{\isundefined{\rwuthesis@secondreviewermail}}{}{
				<\url{\rwuthesis@secondreviewermail}>%
			}
		\end{tabular}
	\end{titlepage}
	\cleardoublepage
}

\endinput
