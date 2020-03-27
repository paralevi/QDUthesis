%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{QDUBachelor}[2017/06/01 1.2.1 Qingdao University Thesis Template for Bachelor Degree]

%twoside -双面 openany -新章节可在偶数页开始
\LoadClass[winfonts,twoside,openany,zihao=-4,UTF8]{ctexbook}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions
%------------------------ Packages ------------------------
\RequirePackage{hyperref} %PDF链接设置
\hypersetup{pdfencoding=auto} 
 \ifprint
 \hypersetup{colorlinks,linkcolor=black,anchorcolor=black,citecolor=black}
 \else
\hypersetup{colorlinks,linkcolor=blue,anchorcolor=green,citecolor=magenta}
\fi

\RequirePackage{fancyhdr}
\RequirePackage[a4paper,centering,left=2.5cm,right=2cm,top=2cm,bottom=2cm,includehead,includefoot]{geometry} %页面设置
%\RequirePackage{wallpaper} %用于封面元素对齐
\RequirePackage{makecell}
\RequirePackage{array} %绘制封面下划线
\RequirePackage{titlesec} %标题样式设置
\RequirePackage[subfigure]{tocloft} %目录样式设置
\RequirePackage{tikz} %绘图
\RequirePackage{amsmath} %数学公式
\RequirePackage{graphicx} %插图环境
\RequirePackage[font=small,labelfont=bf,labelsep=space]{caption} %图片标题小号加粗
\RequirePackage{subfigure} %并排图片
\RequirePackage{diagbox} %绘制斜线表头
\RequirePackage{floatrow} %表格标题五号置顶
\DeclareFloatFont{tblfont}{\zihao{5}}
\floatsetup[table]{font=tblfont,capposition=top}
\RequirePackage[super,square]{natbib} %引用格式设置为上标方括号

%head&foot setting
\makeatletter
\newcommand*{\emptystyles}{%
\let\oldplain\ps@plain
\let\ps@plain\ps@emptynumbering
\pagestyle{plain}}

\newcommand*{\restorestyles}{%
\clearpage\thispagestyle{empty}
\let\ps@plain\oldplain
\pagestyle{plain}}
\makeatother

\fancypagestyle{plain}{%
\fancyhf{}
\chead{\zihao{5} 青岛大学本科毕业论文（设计）}
\cfoot{\zihao{5}\thepage}
\renewcommand\headrulewidth{0.4pt}
}

\fancypagestyle{emptynumbering}{%
\fancyhf{}
\cfoot{\zihao{5}\thepage}
\renewcommand\headrulewidth{0pt}
}

%chapter&section setting
\renewcommand{\contentsname}{\hspace*{\fill}\zihao{3} 目\quad{}录\hspace*{\fill}}
\setcounter{secnumdepth}{3}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength\cftbeforetoctitleskip{0em}
\ctexset { chapter = { format+={\zihao {3}},beforeskip=0em,afterskip=1em} } 
\ctexset { section = { format+={\raggedright \zihao {-3}} } }
\ctexset { subsection = { format+={\zihao {4}} } }
\ctexset { subsubsection = { indent={1pc},number={(\arabic {subsubsection})} } }

%font setting
\RequirePackage{xeCJK}
\RequirePackage{fontspec}
%\setmainfont{Times New Roman}
\setCJKfamilyfont{xbsong}{FZXiaoBiaoSong}
\newcommand{\xbsong}{\CJKfamily{xbsong}}

%parameter
\newtoks\title %论文标题
\newtoks\titleEn %论文英文标题
\newtoks\school %学院
\newtoks\major %专业
\newtoks\name %姓名
\newtoks\supervisor %指导教师
\newtoks\date %封面日期

\RequirePackage{listings} %代码样式
% \definecolor{gray}{rgb}{0.5,0.5,0.5}
\lstset{ 
  tabsize=4, %
  frame=single, %把代码用带有阴影的框圈起来
  %commentstyle=\color{gray}, %浅灰色的注释
  %rulesepcolor=\color{red!20!green!20!blue!20}, %代码块边框为淡青色
  %keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  keywordstyle=\bfseries,
  showstringspaces=false,%不显示代码字符串中间的空格标记
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle=\footnotesize, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  escapechar=`,
  escapebegin=\begin{CJK*}{GBK}{hei},escapeend=\end{CJK*},
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible
  % numbersep=-1em
}
%------------------------ cover ------------------------
\def\maketitle {
    \begin{titlepage}
    \thispagestyle{empty}
    %\CenterWallPaper{1}{temp.pdf}
    \vspace*{40pt}
    \centerline{\includegraphics[height=3.02cm,width=11cm]{figures/logo} }
    \vspace{75pt}
    \centerline{\xbsong \zihao{-0}{本科毕业论文(设计)}}
    \vspace{180pt}
    \centerline {
        \begin{tabular}{ b{2.5cm} >{\arraybackslash}b{8cm}}
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
    ~~\vfill
    \end{center}
}

%------------------------ declaration ------------------------
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

%------------------------ appendix ------------------------
\renewenvironment{appendix}{
    \clearpage
    \chapter*{附\quad{}录}
    \addcontentsline{toc}{chapter}{附录} 
}{\clearpage}

%------------------------ reference ------------------------
\newcommand{\reference}[1] {
    \nocite{*}
    \bibliographystyle{bstutf8}
    \phantomsection
    \addcontentsline{toc}{chapter}{参考文献}
    \kaishu
    \bibliography{#1}
}
