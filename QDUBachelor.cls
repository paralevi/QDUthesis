%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{QDUBachelor}[2017/04/17 0.1 Qingdao University Thesis Template for Bachelor Degree]

%twoside -双面 openany -新章节可在偶数页开始
\LoadClass[a4paper,oneside,openany]{ctexbook}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions
%------------------------ Packages ------------------------
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{amsmath}
\RequirePackage[a4paper,centering,left=2.5cm,right=2cm,top=2cm,bottom=2cm,includehead,includefoot]{geometry} %页面设置

\RequirePackage{hyperref}
\hypersetup{pdfencoding=auto} 
 \ifprint
 \hypersetup{hidelinks}
 \else
\hypersetup{citecolor=magenta,linkcolor=blue}
\fi

\RequirePackage{array}

%font setting
\RequirePackage{xeCJK}
\RequirePackage{fontspec}
\setCJKfamilyfont{xbsong}{FZXiaoBiaoSong-B05S}
\newcommand{\xbsong}{\CJKfamily{xbsong}}

%parameter
\newtoks\title %论文标题
\newtoks\school %学院
\newtoks\major %专业
\newtoks\name %姓名
\newtoks\supervisor %指导教师
\newtoks\date

%cover setting
\def\maketitle {
    \thispagestyle{empty}
    \centerline{\includegraphics[height=3.02cm]{figures/logo} }
    \vskip 4\baselineskip
    \centerline{\xbsong \zihao{-0} {本科毕业论文(设计)}}
    \vskip 14\baselineskip
    \centerline {
        \begin{tabular}{ b{2.5cm} >{\centering\arraybackslash}b{8cm}}
            \fangsong \zihao{-3} \ziju{2}{题目}： & {\heiti \zihao{-3} \the\title} \\[-1pt]
            \cline{2-2} \\[0.1cm]
            \fangsong \zihao{-3} \ziju{2}{学院}： & {\heiti \zihao{-3} \the\school} \\[-1pt]
            \cline{2-2} \\[0.1cm]
            \fangsong \zihao{-3} \ziju{2}{专业}： & {\heiti \zihao{-3} \the\major} \\[-1pt]
            \cline{2-2} \\[0.1cm]
            \fangsong \zihao{-3} \ziju{2}{姓名}： & {\heiti \zihao{-3}\the\name} \\[-1pt]
            \cline{2-2} \\[0.1cm]
            \fangsong \zihao{-3} 指导教师： & {\heiti \zihao{-3} \the\supervisor} \\[-1pt]
            \cline{2-2} \\[0.1cm]
        \end{tabular}
    }
    \vskip 2\baselineskip
    \centerline{\fangsong \zihao{4} \the\date}
}



