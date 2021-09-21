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
  set docbook_outputdir=%docbook_document_output%\%1\%2\plain\
) else (
  set docbook_outputdir=%3
)

rem create document subdirectory if not present
if not exist %docbook_outputdir% md %docbook_outputdir%


rem copy graphics  directory and browser directory
xcopy %docbook_slides_path%\graphics\*.* %docbook_outputdir%\graphics\ /s /e /v /d
xcopy %docbook_slides_path%\browser\*.* %docbook_outputdir%\browser\ /s /e /v /d


rem copy user figures to output dir
xcopy %docbook_books_path%\%1\%2\src\figure\*.*   %docbook_outputdir%\figure\ /s /e /v /d

rem  using document XSL stylesheet
set docbook_use_stylesheet=%docbook_custom_xsl_path%\cdbe_plain_%2.xsl

:: translate

set XML_CATALOG_FILES=%docbook_catalog_ptah%\catalog.xml
%docbook_libxslt_path%\xsltproc.exe  --timing  --xinclude  --output %docbook_outputdir%\index.html   %docbook_use_stylesheet%  %docbook_books_path%\%1\%2\src\%1.xml 

