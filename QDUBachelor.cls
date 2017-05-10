%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{QDUBachelor}[2017/05/10 1.0 Qingdao University Thesis Template for Bachelor Degree]

%twoside -双面 openany -新章节可在偶数页开始
\LoadClass[winfonts,openany,zihao=-4,UTF8]{ctexbook}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions
%------------------------ Packages ------------------------
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{amsmath}
\RequirePackage[a4paper,centering,left=2.5cm,right=2cm,top=2cm,bottom=2cm]{geometry} %页面设置
\RequirePackage{hyperref}
\hypersetup{pdfencoding=auto} 
 \ifprint
 \hypersetup{colorlinks,linkcolor=black,anchorcolor=black,citecolor=black}
 \else
\hypersetup{colorlinks,linkcolor=blue,anchorcolor=green,citecolor=magenta}
\fi
\RequirePackage{makecell}
\RequirePackage{graphicx}
%\RequirePackage{wallpaper}
\RequirePackage[font=small,labelfont=bf]{caption}
\RequirePackage{subfigure}
\RequirePackage{floatrow}
\DeclareFloatFont{tblfont}{\zihao{5}}
\floatsetup[table]{font=tblfont,capposition=top}
\RequirePackage{array}
\RequirePackage{fontspec}
\RequirePackage{diagbox}
\RequirePackage{tikz}
\RequirePackage[super,square]{natbib}
%head&foot setting
\pagestyle{fancy}
\lhead{}
\chead{\zihao{5} 青岛大学本科毕业论文（设计）}
\rhead{}
\lfoot{}
\cfoot{\zihao{5}\thepage}
\rfoot{}

%chapter&section setting
\setcounter{secnumdepth}{3}
\ctexset { chapter = { format+={\zihao {3}},beforeskip=1cm } } 
\ctexset { section = { format+={\raggedright \zihao {-3}} } }
\ctexset { subsection = { format+={\zihao {4}} } }
\ctexset { subsubsection = { indent={1pc},number={(\arabic {subsubsection})} } }

%font setting
\RequirePackage{xeCJK}
\RequirePackage{fontspec}
\setCJKfamilyfont{xbsong}{FZXiaoBiaoSong-B05S}
\newcommand{\xbsong}{\CJKfamily{xbsong}}

%parameter
\newtoks\title %论文标题
\newtoks\titleEn %论文英文标题
\newtoks\school %学院
\newtoks\major %专业
\newtoks\name %姓名
\newtoks\supervisor %指导教师
\newtoks\date

%------------------------ cover ------------------------
\def\maketitle {
    \begin{titlepage}
    \thispagestyle{empty}
    %\CenterWallPaper{1}{temp.pdf}
    \vspace*{70pt}
    \centerline{\includegraphics[height=3.02cm,width=11cm]{figures/logo} }
    \vspace{75pt}
    \centerline{\xbsong \zihao{-0}{本科毕业论文(设计)}}
    \vspace{180pt}
    \centerline {
        \begin{tabular}{ b{2.5cm} >{\centering\arraybackslash}b{8cm}}
            \fangsong \zihao{-3} \ziju{2} \textbf{题目：} & {\heiti \zihao{-3} \the\title} \\[-2pt]
            \Xcline{2-2}{1pt} \\[0.1cm]
            \fangsong \zihao{-3} \ziju{2} \textbf{学院：} & {\heiti \zihao{-3} \the\school} \\[-2pt]
            \Xcline{2-2}{1pt} \\[0.1cm]
            \fangsong \zihao{-3} \ziju{2} \textbf{专业：} & {\heiti \zihao{-3} \the\major} \\[-2pt]
            \Xcline{2-2}{1pt} \\[0.1cm]
            \fangsong \zihao{-3} \ziju{2} \textbf{姓名：} & {\heiti \zihao{-3}\the\name} \\[-2pt]
            \Xcline{2-2}{1pt} \\[0.1cm]
            \fangsong \zihao{-3} \textbf{指导教师：} & {\heiti \zihao{-3} \the\supervisor} \\[-2pt]
            \Xcline{2-2}{1pt} \\[0.1cm]
        \end{tabular}
    }
    \vskip 1\baselineskip
    \centerline{\fangsong \zihao{4} \textbf{\the\date}}
    \end{titlepage}
    \thispagestyle{empty}
    \begin{center}
    ~~\vfill
    \heiti \zihao{2}{\the\title}\\
    \heiti \zihao{2}{\the\titleEn}
    \end{center}
    ~~\vfill
}

%------------------------declaration------------------------
\def\declaration {
    \clearpage
    \thispagestyle{empty}
    \vspace*{1cm}
    \centerline{\heiti \zihao{3} {郑~~重~~声~~明}}
    \vskip 1\baselineskip
    本人呈交的学位论文（设计），是在指导教师的指导下，独立进行研究工作所取得的成果，所有数据、图片资料真实可靠。除文中已经注明引用的内容外，本学位论文（设计）的研究成果不包含他人享有著作权的内容。对本论文（设计）所涉及的研究工作做出贡献的其他个人和集体，均已在文中以明确的方式标明。本学位论文（设计）的知识产权归属于青岛大学。
    \begin{center}
    本人签名：\rule{0.2\textwidth}{0.1pt} \hspace{0.08\textwidth} 日期：\rule{0.2\textwidth}{0.1pt}
    \end{center}
}

%------------------------ abstract ------------------------
\newcommand{\varKeyword}{}
\newcommand{\keyword}[1]{\renewcommand{\varKeyword}{#1}}
\newenvironment{abstract}[1]{
    \thispagestyle{empty}
    \vspace*{1cm}
    \centerline{\heiti \zihao{3} {摘\quad{}要}}
    \setcounter{page}{1}
    \vspace{1.2cm}
    \keyword{#1}
}{
    \\\textbf{关键词} \varKeyword
    \clearpage
}
\newenvironment{abstractEn}[1]{
    \thispagestyle{empty}
    \vspace*{1cm}
    \centerline{\heiti \zihao{3} \textbf{Abstract}}
    \vspace{1.2cm}
    \keyword{#1}
}{
    \\\textbf{Keywords} \varKeyword
    \clearpage
}

%------------------------ thanks ------------------------
\renewenvironment{thanks}{
    \chapter*{谢\quad{}辞}
    \addcontentsline{toc}{chapter}{谢辞} 
}{\clearpage}

%------------------------ reference ------------------------
\newcommand{\reference}[1] {
    \nocite{*}
    \bibliographystyle{bstutf8}
    \phantomsection
    \addcontentsline{toc}{chapter}{参考文献}
    \kaishu
    \bibliography{#1}
}{}
