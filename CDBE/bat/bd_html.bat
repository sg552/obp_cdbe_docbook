@echo off

:: -------------------------------------
rem %1: document name
rem %2: lang <zh-cn|zh-tw|en>
rem %3: output directory (optional)
:: -------------------------------------

rem load configuration
call config.bat

rem set output directory
if %3()==() ( 
  if not exist %docbook_document_output%\%1\%2 md %docbook_document_output%\%1\%2
  set docbook_outputdir=%docbook_document_output%\%1\%2\html\
) else (
  set docbook_outputdir=%3
)

rem create document subdirectory if not present
if not exist %docbook_outputdir% md %docbook_outputdir%


rem create  CSS directory and CSS file
if not exist %docbook_outputdir%\css md %docbook_outputdir%\css
copy %docbook_custom_css_path%\style.css %docbook_outputdir%\css
if exist %docbook_books_path%\%1\%2\src\css\style.css copy %docbook_books_path%\%1\%2\src\css\style.css %docbook_outputdir%\css

rem copy the original docbook images and user figures to output dir
xcopy %docbook_xsl_path%\images\*.png %docbook_outputdir%\images\ /s /e /v /d
xcopy %docbook_books_path%\%1\%2\src\figure\*.*   %docbook_outputdir%\figure\ /s /e /v /d
xcopy %docbook_books_path%\%1\%2\src\images\*.*   %docbook_outputdir%\images\ /s /e /v /d

rem  using document XSL stylesheet
set docbook_use_stylesheet=%docbook_custom_xsl_path%\cdbe_html_%2.xsl

:: translate

set XML_CATALOG_FILES=%docbook_catalog_ptah%\catalog.xml
%docbook_libxslt_path%\xsltproc.exe  --timing --xinclude --stringparam use.extensions 0 --output %docbook_outputdir%\%1.html   %docbook_use_stylesheet%  %docbook_books_path%\%1\%2\src\%1.xml 

